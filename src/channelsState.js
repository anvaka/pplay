var eventify = require('ngraph.events');
var loadImage = require('./util/loadImage');
var glUtils = require('./util/gl-utils');

module.exports = function (gl) {
  var takenUnits = new Set();
  var MAX_UNITS_COUNT = 8;

  // TODO: need to have internal list, so that vue does not interfere with performance
  var viewModels = [];
  var models = [];
  var api = eventify({
    list: viewModels,
    removeChannel,
    addChannel,
    render
  });

  return api;

  function render(program) {
    for (var i = 0; i < models.length; ++i) {
      models[i].render(program);
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
  }

  function addChannel(src) {
    if (typeof src !== 'string') throw new Error('implement me');
    var unit = getAvailableUnit();
    if (unit === undefined) throw new Error('All channels are busy');

    if (isImage(src)) {
      // TODO: I still haven't figured out a lot. This is a mess.
      // Think of it as if it was a gradient descent to optimal solution, and the code below is step 0.
      var input = imageInput(src, gl, unit);
      var inputViewModel = {
        kind: 'image',
        name: `iChannel${unit}`,
        unit,
        error: null,
        state: 'loading',
        src: src,
        model: input
      };
      viewModels.push(inputViewModel); 
      models.push(input);
      takenUnits.add(unit);
      input.load().then(() => {
        inputViewModel.state = 'ready'
      }).catch(err => {
        inputViewModel.state = 'error'
        inputViewModel.error = err;
      });
    } 
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
    unit,
    load,
    dispose,
    render
  });

  return api;

  function render(program) {
    if (!texture) return;

    if (needsBinding) {
      gl.activeTexture(gl.TEXTURE0 + unit);
      gl.bindTexture(gl.TEXTURE_2D, texture);
      gl.uniform1i(program[channelName], unit);
      gl.uniform2f(program[resName], width, height);

      needsBinding = false;
    }
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