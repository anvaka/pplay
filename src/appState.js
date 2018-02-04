/**
 * Okay, this file is a bit messy. Its primary responsibility
 * is to provide application state to scene and vue app. But it's
 * hard to define what application state mean in a clear way.
 * 
 * For our purposes I consider anything stored in the query string to be
 * an application state
 */
var queryState = require('query-state');
var bus = require('./bus');
var isSmallScreen = require('./util/isSmallScreen');
var loadGist = require('./util/loadGist');

// This will load current state from the query string.
var qs = queryState({}, { useSearch: true, });

var defaultCode = require('./util/shaders/main.glsl');
var currentCode = defaultCode; 

var appStateReady;
var protoGist = qs.get('gist');
if (protoGist) {
  loadGist(protoGist).then((code) => {
    currentCode = code;
    appState.ready = true;
    appState.settingsPanel.collapsed = isSettingsPanelCollapsedInitially();
    bus.fire('appstate-ready');
  }).catch(err => {
    console.error(err);
    currentCode = defaultCode; 
    appState.settingsPanel.loadError = err;
    appState.settingsPanel.collapsed = false;
    appState.ready = true;
    bus.fire('appstate-ready');
  });
} else {
  appStateReady = true

  currentCode = qs.get('fc') || defaultCode;
}

// When user drags the scene, we don't want to immediately update the
// query string. Some browsers would not respond well to high intensity.
// Instead we debounce events (setTimeout, and clearTimeout if new events comes
// before previously scheduled timeout is executed)
var pendingSaveCallback;

var appState = {
  settingsPanel: {
    // By default we will not show settings panel on small screen, or if
    // there was a code in the query string - we just assume people want to
    // see the result. If they are curious - they would click "show editor" button
    collapsed: isSettingsPanelCollapsedInitially(),
    codeLimitError: false,
    loadError: null,
    audioWarning: false,
  },
    // If this one is present, the no UI will ever be shown. Good for iframe embedding
  hideUI: qs.get('hide-ui') !== undefined,
  ready: appStateReady,
  /**
   * Request to save current code into query string
   */
  saveCode,

  /**
   * Checks whether query string has code.
   */
  hasCode,

  /**
   * Gets current code. Returns default code if no current code is present.
   */
  getCode,

  /**
   * Returns our default code
   */
  getDefaultCode,

  /**
   * Saves scene transform.
   */
  saveTransform,

  /**
   * Returns visible rectangle in screen coordinates.
   */
  getVisibleRectangle,

  // Channel persistence
  addChannel,
  removeChannel,
  getActiveChannels,
  setSoundIOSWarning
}

var isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;

function setSoundIOSWarning(isActive) {
  if (!isIOS) return; // Only for iOS
  appState.settingsPanel.audioWarning = isActive;
}

function hasCode() {
  return currentCode !== defaultCode;
}

function addChannel(unit, src) {
  qs.set('i' + unit, src);
}

function removeChannel(unit) {
  qs.unset('i' + unit);
}

function getActiveChannels() {
  var active = [];
  for(var unit = 0; unit < 3; ++unit) {
    var src = qs.get('i' + unit);
    if (src !== undefined) active.push({unit, src});
  }

  return active;
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
  // This is need to back propagate properties when query string changes.
  bus.fire('scene-ready', window.scene);
});

function getCode() { return currentCode; }

function getDefaultCode() { return defaultCode; }

function saveCode(code) {
  if (code.length > 1000) {
    appState.settingsPanel.codeLimitError = true;
    qs.unset('fc')
  } else {
    appState.settingsPanel.codeLimitError = false;
    qs.set({fc: code});
    qs.unset('gist');
  }
  currentCode = code;
}

function isSettingsPanelCollapsedInitially() {
  return isSmallScreen() || hasCode();
}

module.exports = appState;