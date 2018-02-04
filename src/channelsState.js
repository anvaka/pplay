var loadImage = require('./util/loadImage');
var glUtils = require('./util/gl-utils');
var appState = require('./appState');
var audioInput = require('./channels/audioInput');
var isSoundCloud = require('./channels/isSoundCloud');

module.exports = function (gl) {
  var takenUnits = new Set();
  var MAX_UNITS_COUNT = 8;

  // TODO: need to have internal list, so that vue does not interfere with performance
  var viewModels = [];
  var models = [];
  var api = {
    list: viewModels,
    removeChannel,
    addChannel,
    render
  };

  restoreState();

  return api;

  function restoreState() {
    var activeChannels = appState.getActiveChannels();
    if (!activeChannels) return;
    activeChannels.forEach(channelInfo => {
      addChannel(channelInfo.src, channelInfo.unit);
    });
  }

  function render(program, frameNumber) {
    for (var i = 0; i < models.length; ++i) {
      models[i].render(program, frameNumber);
    }
  }

  function removeChannel(channel) {
    if (!takenUnits.has(channel.unit)) throw new Error('You are trying delete something that does not exist');

    var modelIndex = getIndexOfModelWithUnit(models, channel.unit);
    if (modelIndex === -1) throw new Error('You are trying delete something that does not exist');

    models[modelIndex].dispose();
    models.splice(modelIndex, 1);

    var viewModelIndex = getIndexOfModelWithUnit(viewModels, channel.unit);
    viewModels.splice(viewModelIndex, 1);
    takenUnits.delete(channel.unit);
    appState.removeChannel(channel.unit);


    var hasAudio = false;
    models.forEach(m => { 
      if (m.kind === 'audio') hasAudio = true;
    })
    appState.setSoundIOSWarning(hasAudio);
  }

  function addChannel(src, unit) {
    if (typeof src !== 'string') throw new Error('implement me');

    // Client knows where they want to bind. Respect that, unless it's already taken:
    if (takenUnits.has(unit)) throw new Error('This channel is already taken');

    // if they don't care about the channel - pick first available:
    if (unit === undefined) unit = getAvailableUnit();

    // If we still don't have it, then...
    if (unit === undefined) throw new Error('All channels are busy');

    // TODO: I still haven't figured out a lot. This is a mess.
    // Think of it as if it was a gradient descent to optimal solution, and the code below is step 0.
    var input;
    if (isSoundCloud(src)) {
      input = audioInput(src, gl, unit);
      appState.setSoundIOSWarning(true);
    } else if (isImage(src)) {
      input = imageInput(src, gl, unit);
    } 

    if (!input) throw new Error('not implemented');
    models.push(input);
    takenUnits.add(unit);

    var inputViewModel = {
      kind: input.kind,
      name: `iChannel${unit}`,
      unit,
      error: null,
      state: 'loading',
      src: src,
      model: input
    };
    viewModels.push(inputViewModel); 
    input.load().then(() => {
      inputViewModel.state = 'ready'
      appState.addChannel(unit, src);
    }).catch(err => {
      inputViewModel.state = 'error'
      inputViewModel.error = err;
    });
  }

  function getAvailableUnit() {
    for (var i = 0; i < MAX_UNITS_COUNT; ++i) {
      if (!takenUnits.has(i)) return i;
    }
  }

  function isImage(/* value */) {
    // TODO: Implement me.
    return true;
  }
}

function imageInput(value, gl, unit) {
  var needsBinding = true;
  var texture, width, height;
  var channelName = 'iChannel' + unit;
  var resName = channelName + 'Res';

  var api = Object.freeze({
    kind: 'image',
    unit,
    load,
    dispose,
    render
  });

  return api;

  function render(program, frameNumber) {
    if (!texture) return;

    if (needsBinding) {
      needsBinding = false;
    }
    gl.activeTexture(gl.TEXTURE0 + unit);
    gl.bindTexture(gl.TEXTURE_2D, texture);
    // TODO: This probably could be optimized. E.g. re-read only when program has changed?
    gl.uniform1i(program[channelName], unit);
    gl.uniform2f(program[resName], width, height);
  }

  function dispose() {
    if (texture) {
      gl.deleteTexture(texture);
      texture = null;
    } 
  }

  function load() {
    return loadImage(value).then(image => {
      texture = glUtils.createTexture(gl, image);
      width = image.width;
      height = image.height;
      return api;
    });
  }
}

function getIndexOfModelWithUnit(arr, modelUnit) {
  for (var i = 0; i < arr.length; ++i) {
    if (arr[i].unit === modelUnit) return i;
  }

  return -1;
}