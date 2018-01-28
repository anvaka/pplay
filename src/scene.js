var makePanzoom = require('panzoom');
var createFractalCodeState = require('./editor/fractalCodeState');
var config = require('./config.js');
var bus = require('./bus');
var util = require('./util/gl-utils');
var createShaders = require('./util/createShaders');
var appState = require('./appState');

module.exports = initScene;

function initScene(canvas) {
  var gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
  if (!gl) {
    throw new Error('WebGL is not available');
  }

  var panzoom = makePanzoom(gl.canvas, {
    realPinch: true,
    zoomSpeed: 0.035,
    controller: {
      applyTransform,
      getOwner() { return gl.canvas; },
    }
  });

  var startTime;
  var cursor = {currentX: 0, currentY: 0, clickX: 0, clickY: 0};
  var sceneTransform = {x: 0, y: 0, z: 1};
  var sceneWidth = canvas.clientWidth;
  var sceneHeight = canvas.clientHeight;

  var requestSizeUpdate = true;
  var requestTransformUpdate = true;
  var currentFrameNumber = 0;
  
  restorePanzoom();
  var shader = createShaders(appState.getCode());

  gl.enable(gl.BLEND);
  gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA)
  var screenProgram = util.createProgram(gl, shader.vertexShader, shader.fragmentShader);
  var quadBuffer = util.createBuffer(gl, new Float32Array([0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1]));
  util.bindAttribute(gl, quadBuffer, screenProgram.a_pos, 2);

  listenToEvents();

  var codeEditorState = createFractalCodeState(updateCode);

  var state = {
    sidebarOpen: !config.isSmallScreen(),
    codeEditorState,
    goToOrigin,
    dispose
  }

  window.scene = state;

  var nextAnimationFrame = requestAnimationFrame(animate);

  return state;

  function animate() {
    nextAnimationFrame = 0;
    drawCurrentFrame();
    currentFrameNumber += 1;
    scheduleNextFrame();
  }

  function goToOrigin() {
    panzoom.showRectangle({
      left: 0, right: window.innerWidth,
      top: 0, bottom: window.innerHeight
    });
    
    applyTransform(panzoom.getTransform());
  }

  function updateCode(parserResult) {
    var updateProgram = util.createProgram(gl, shader.vertexShader, parserResult.code);
    if (screenProgram) {
      screenProgram.unload();
    }
    startTime = window.performance.now();
    screenProgram = updateProgram;
    requestSizeUpdate = true;
    requestTransformUpdate = true;

    bus.fire('scene-ready', window.scene);
  }

  function scheduleNextFrame() {
    if (nextAnimationFrame) return;
    nextAnimationFrame = requestAnimationFrame(animate);
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
      gl.uniform3f(screenProgram.u_transform, sceneTransform.x, sceneTransform.y, sceneTransform.z);
    }

    var iTime = window.performance.now() - startTime;
    gl.uniform1f(screenProgram.iTime, iTime/1000);
    gl.uniform1f(screenProgram.iFrame, currentFrameNumber);
    gl.uniform4f(screenProgram.iMouse, cursor.currentX, cursor.currentY, cursor.clickX, cursor.clickY);
    gl.drawArrays(gl.TRIANGLES, 0, 6);
  }

  function applyTransform(newTransform) {
    var tx = newTransform.x/sceneWidth;
    var ty = newTransform.y/sceneHeight;
    var scale = newTransform.scale;

    sceneTransform.x = tx;// (tx * 2 - 1)/scale;
    sceneTransform.y = ty; //(ty * 2 - 1)/scale;
    sceneTransform.z = scale;
    requestTransformUpdate = true;
    appState.saveTransform(tx, ty, scale);
    scheduleNextFrame();
  }

  function restorePanzoom() {
    var rect = appState.getVisibleRectangle(sceneWidth, sceneHeight);
    if (rect) panzoom.showRectangle(rect);
  }

  function dispose() {
    panzoom.dispose();

    window.removeEventListener('resize', updateSize);
    window.removeEventListener('mousemove', onMouseMove);
    window.removeEventListener('mousedown', onMouseClick);
    window.removeEventListener('touchstart', onTouchStart);
    window.removeEventListener('touchmove', onTouchMove);
    cancelAnimationFrame(nextAnimationFrame);
    nextAnimationFrame = 0;
  }

  function listenToEvents() {
    window.addEventListener('resize', updateSize);
    window.addEventListener('mousemove', onMouseMove);
    window.addEventListener('mousedown', onMouseClick);
    window.addEventListener('touchstart', onTouchStart);
    window.addEventListener('touchmove', onTouchMove);
  }

  function onTouchStart(e) {
    var firstTouch = e.touches[0];
    if (!firstTouch) return;

    setClick(firstTouch.clientX, firstTouch.clientY);
    setHover(firstTouch.clientX, firstTouch.clientY);
  }

  function onTouchMove(e) {
    var firstTouch = e.touches[0];
    if (!firstTouch) return;
    setHover(firstTouch.clientX, firstTouch.clientY);
  }
  function onMouseMove(e) { setHover(e.clientX, e.clientY); }
  function onMouseClick(e) { setClick(e.clientX, e.clientY); }

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