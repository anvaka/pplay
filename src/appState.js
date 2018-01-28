var queryState = require('query-state');
var bus = require('./bus');
var isSmallScreen = require('./util/isSmallScreen');

var qs = queryState({}, { useSearch: true, });

var currentState = qs.get();

var defaultFractal = require('./util/shaders/main.glsl');

var pendingSaveCallback;
var settingsPanel = {
  collapsed: isSmallScreen(),
};

module.exports = {
  settingsPanel,
  getQS() { return qs; },
  saveCode,
  getCode,
  getDefaultCode,

  saveTransform,
  getVisibleRectangle
}

function saveTransform(tx, ty, scale){
  if (pendingSaveCallback) {
    clearTimeout(pendingSaveCallback);
  }

  pendingSaveCallback = setTimeout(() => {
    pendingSaveCallback = 0;
    qs.set({ tx, ty,scale });
  }, 300);
}

function getVisibleRectangle(sceneWidth, sceneHeight) {
  var tx = qs.get('tx');
  var ty = qs.get('ty');
  var scale = qs.get('scale');
  if (!(Number.isFinite(tx) || Number.isFinite(ty) || Number.isFinite(scale))) return;

  return ({
    left: -tx * sceneWidth/scale,
    top: -ty * sceneHeight/scale,
    right: -tx * sceneWidth/scale + sceneWidth/scale,
    bottom: -ty * sceneHeight/scale + sceneHeight/scale,
  })
}

qs.onChange(function() {
  bus.fire('scene-ready', window.scene);
});

function getCode() {
  var fCode = qs.get('fc');
  if (fCode) return fCode;

  return defaultFractal;
}

function getDefaultCode() {
  return defaultFractal;
}

function saveCode(code) {
  qs.set({fc: code});
  currentState.code = code;
}

function defined(number) {
  return Number.isFinite(number);
}

function clamp(x, min, max) {
  return x < min ? min :
        (x > max) ? max : x;
}
