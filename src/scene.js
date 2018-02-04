/**
 * This is the main scene. It does not depend on vue application
 * and can be used as long as we have a canvas.
 * 
 * Its main responsibility is to manage life cycle of the WebGL app
 */
var makePanzoom = require('panzoom');
var createShaderCodeState = require('./editor/shaderCodeState');
var bus = require('./bus');
var util = require('./util/gl-utils');
var createShaders = require('./util/createShaders');
var createChannelsState = require('./channelsState');
var appState = require('./appState');

var HIDE_UI_THRESHOLD = 2500; // if nothing happens in this many milliseconds - hide ui

module.exports = initScene;

function initScene(canvas) {
  var gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
  if (!gl) throw new Error('WebGL is not available');

  // This is used to track seconds since application start time.
  var startTime;
  // Pass cursor to the shader as `iMouse`
  var cursor = {currentX: 0, currentY: 0, clickX: 0, clickY: 0};
  // Pass current frame number to shader as `iFrame`
  var currentFrameNumber = 0;
  var orientation = {alpha: 0, beta: 0, gamma: 0, absolute: 0};

  // This will be updated by panzoom controller (see applyTransform)
  var sceneTransform = {x: 0, y: 0, z: 1};
  var sceneWidth = canvas.clientWidth;
  var sceneHeight = canvas.clientHeight;

  // Allow to pan and zoom the scene. The panzoom library
  // manages user actions, and actual translation happens in the shader.
  var panzoom = makePanzoom(gl.canvas, {
    realPinch: true,
    zoomSpeed: 0.035,
    controller: {
      applyTransform,
      getOwner() { return gl.canvas; },
    }
  });

  restorePanzoom(); // Let's load previous pan zoom state from query string

  // Instead of blindly updating all gl properties, we queue them up
  // and in the frame renderer we address changes.
  var requestSizeUpdate = true;      // This means that screen size needs to be updated
  var requestTransformUpdate = true; // And this means that transforms are dirty
  var orientationChanged = true;

  // This is used to auto-hide UI when there is no input. We only do this
  // when code editor is closed, and there was no user activity in HIDE_UI_THRESHOLD ms.
  // TODO: This can be refactored into vue app. No need for it to be here...
  var lastActivityTime = new Date();

  // Handle for the next requestAnimationFrame call.
  var nextAnimationFrame;
  // Handle of of the interval that "auto-hides" UI when app is inactive.
  var lastActiveIntervalId;
  
  // We pass a few things to the shader (like mouse pose), and we need to update
  // transforms when window changes. So, we listen to relevant events here.
  listenToEvents();

  var shader = createShaders(appState.getCode());

  gl.enable(gl.BLEND);
  gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);

  gl.clearColor(0, 0, 0, 1); // Not sure if I need this
  var screenProgram, quadBuffer;

  var channelsState = createChannelsState(gl);

  // This is used by Vue app to communicate with the scene
  var state = {
    isActive: true,
    // This is the main bit for the code. 
    // TODO: If someone wants to use scene independently, this needs to 
    // be less coupled with the application 
    codeEditorState: createShaderCodeState(updateCode),
    channelsState,
    goToOrigin,
    setActivityMonitorEnabled,
    dispose
  };

  // This is not very cool, okay?
  window.scene = state;

  return state; // That's it. The public part is over.

  function animate() {
    // TODO: Do I need this?
    gl.clear(gl.DEPTH_BUFFER_BIT | gl.COLOR_BUFFER_BIT);
    nextAnimationFrame = 0;
    drawCurrentFrame();
    currentFrameNumber += 1;
    scheduleNextFrame();
  }

  function drawCurrentFrame() {
    gl.useProgram(screenProgram.program); 

    if (requestSizeUpdate) {
      requestSizeUpdate = false;
      gl.viewport(0, 0, sceneWidth, sceneHeight);
      gl.uniform2f(screenProgram.iResolution, sceneWidth, sceneHeight);
    }

    if (requestTransformUpdate) {
      requestTransformUpdate = false;
      gl.uniform3f(screenProgram.iTransform, sceneTransform.x, sceneTransform.y, sceneTransform.z);
    }

    channelsState.render(screenProgram, currentFrameNumber);

    var iTime = window.performance.now() - startTime;
    gl.uniform1f(screenProgram.iTime, iTime/1000);
    gl.uniform1f(screenProgram.iFrame, currentFrameNumber);
    gl.uniform4f(screenProgram.iMouse, cursor.currentX, cursor.currentY, cursor.clickX, cursor.clickY);
    if (orientationChanged) {
      orientationChanged = false;
      gl.uniform4f(screenProgram.iOrientation, orientation.alpha, orientation.beta, orientation.gamma, orientation.absolute);
    }
    gl.drawArrays(gl.TRIANGLES, 0, 6);
  }

  function scheduleNextFrame() {
    if (nextAnimationFrame) return;
    nextAnimationFrame = requestAnimationFrame(animate);
  }

  function updateCode(parserResult) {
    // We first try to update the program. If there are any errors, this call will throw
    // and they will be handled by the editor state.
    var updateProgram = util.createProgram(gl, shader.vertexShader, parserResult.code);

    // If we reach this code, then we didn't throw, and we have a valid webgl code.
    // Let's unload what we have now.
    if (screenProgram) screenProgram.unload();

    // And re-initialize all primitives.
    startTime = window.performance.now();
    screenProgram = updateProgram;

    quadBuffer = util.createBuffer(gl, new Float32Array([0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1]));
    util.bindAttribute(gl, quadBuffer, screenProgram.a_pos, 2);

    requestSizeUpdate = true;
    requestTransformUpdate = true;
    
    scheduleNextFrame();

    bus.fire('scene-ready', window.scene);
  }

  // Technically the following three functions are all related to panzoom
  // and could be extracted into own module.
  function goToOrigin() {
    panzoom.showRectangle({
      left: 0, right: window.innerWidth,
      top: 0, bottom: window.innerHeight
    });
    
    applyTransform(panzoom.getTransform());
  }

  function applyTransform(newTransform) {
    var tx = newTransform.x/sceneWidth;
    var ty = newTransform.y/sceneHeight;
    var scale = newTransform.scale;

    sceneTransform.x = tx;
    sceneTransform.y = ty; 
    sceneTransform.z = scale;
    requestTransformUpdate = true;
    appState.saveTransform(tx, ty, scale);
    scheduleNextFrame();
  }

  function restorePanzoom() {
    var rect = appState.getVisibleRectangle(sceneWidth, sceneHeight);
    if (rect) panzoom.showRectangle(rect);
  }

  function markInactiveIfNeeded() {
    var now = new Date();
    if (now - lastActivityTime > HIDE_UI_THRESHOLD) state.isActive = false; 
  }

  function setActivityMonitorEnabled(enabled) {
    if (!enabled) {
      clearInterval(lastActiveIntervalId);
      lastActiveIntervalId = false;
      state.isActive = true;
    } else if (!lastActiveIntervalId) {
      lastActiveIntervalId = setInterval(markInactiveIfNeeded, 2000);
    }
  }

  function activate() {
    // This will reset lastActivityTime to now, so that 
    // activity monitor can make correct predictions.
    lastActivityTime = new Date();
    state.isActive = true;
  }

  function dispose() {
    panzoom.dispose();

    window.removeEventListener('resize', updateSize);
    window.removeEventListener('mousemove', onMouseMove, true);
    window.removeEventListener('mousedown', onMouseClick, true);
    window.removeEventListener('touchstart', onTouchStart, true);
    window.removeEventListener('touchmove', onTouchMove, true);
    window.removeEventListener('keydown', activate, true);
    window.removeEventListener('deviceorientation', onOrientationChange, true);

    cancelAnimationFrame(nextAnimationFrame);
    setActivityMonitorEnabled(false);
    nextAnimationFrame = 0;
  }

  function listenToEvents() {
    window.addEventListener('resize', updateSize);
    window.addEventListener('mousemove', onMouseMove, true);
    window.addEventListener('mousedown', onMouseClick, true);
    window.addEventListener('touchstart', onTouchStart, true);
    window.addEventListener('touchmove', onTouchMove, true);
    window.addEventListener('keydown', activate, true);
    window.addEventListener('deviceorientation', onOrientationChange, true);

    // We don't want to hide UI if there is no old code.
    if (appState.hasCode()) setActivityMonitorEnabled(true);
  }

  function onTouchStart(e) {
    activate();
    var firstTouch = e.touches[0];
    if (!firstTouch) return;

    setClick(firstTouch.clientX, firstTouch.clientY);
    setHover(firstTouch.clientX, firstTouch.clientY);
  }

  function onOrientationChange(e) {
    orientationChanged = true;
    orientation.absolute = e.absolute;
    orientation.alpha = Math.PI * e.alpha / 180;
    orientation.beta = Math.PI * e.beta / 180;
    orientation.gamma = Math.PI * e.gamma / 180;
  }

  function onTouchMove(e) {
    activate();
    var firstTouch = e.touches[0];
    if (!firstTouch) return;
    setHover(firstTouch.clientX, firstTouch.clientY);
  }

  function onMouseMove(e) { setHover(e.clientX, e.clientY); activate(); }

  function onMouseClick(e) { setClick(e.clientX, e.clientY); activate(); }

  function setHover(ex, ey) {
    cursor.currentX = ex;
    cursor.currentY = ey;
  }

  function setClick(ex, ey) {
    cursor.clickX = ex;
    cursor.clickY = ey;
  }

  function updateSize() {
    setSceneSize(window.innerWidth, window.innerHeight);
  }

  function setSceneSize(width, height) {
    canvas.width = width;
    canvas.height = height;
    sceneWidth = width;
    sceneHeight = height;

    restorePanzoom();
    requestSizeUpdate = true;
    scheduleNextFrame();
  }
}