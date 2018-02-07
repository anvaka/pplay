/**
 * This is work in progress. Mostly loads soundcloud sound stream and makes
 * it accessible via texture to a shared.
 * 
 * Read more here: https://github.com/anvaka/pplay#audio-channel
 */
var isSoundCloud = require('./isSoundCloud');
var loadSoundCloudStream = require('./loadSoundCloudStream');
var binHistory = require('./binHistory');
var appState = require('../appState');

module.exports = audioInput;

function audioInput(value, gl, unit) {
  var fftSize = 1024;
  var audioTexture;
  var channelName = 'iChannel' + unit;
  var resName = channelName + 'Res';
  var player;
  var analyser;
  var frequencyData = new Uint8Array(fftSize);

  var height = 4; // How many rows we have.
  var width = 512; // 512 frequencies.

  // Two rows, 512 columns each. Each column is a frequency value;
  // If iFrame is odd, then:
  //  - first row stores previous frame audio data and
  //  - second row stores this frame audio data
  // Otherwise:
  //  - first row stores this frame audio data
  //  - second row store last frame data.
  // 
  // Because frequencies are store as rgba values:
  //  - r - is current frequency value (range 0..255)
  //  - g - is avg frequency value (range 0..255)
  //  - b - is long avg frequency value (range 0..255)
  //  - a - unused at the moment
  var audioData;
  var streamUrl;

  var api = Object.freeze({
    kind: 'audio',
    unit,
    load,
    dispose,
    render,
    initPlayer
  });

  return api;

  function load() {
    if (isSoundCloud(value)) {
      return loadSoundCloudStream(value)
        .then(url => streamUrl = url)
        .then(() => {
          if (appState.hideUI) {
            // in this mode, there is no vue app to initialize audio. Do it ourselves
            var player = getOrMakePlayerEl();
            return initPlayer(player);
          }
        });
    }
    throw new Error('non soundcloud files are not supported yet.');
  }

  function initPlayer(playerEl) {
    player = playerEl;
    player.crossOrigin = 'anonymous';
    player.autoplay = true;

    var audioCtx = new (window.AudioContext || window.webkitAudioContext);
    analyser = audioCtx.createAnalyser();
    analyser.fftSize = fftSize;

    var source = audioCtx.createMediaElementSource(player);
    source.connect(analyser);
    analyser.connect(audioCtx.destination);

    audioData = new Uint8Array(width * height * 4); 
    audioTexture = createTexture(gl.LINEAR, audioData, width, height);

    player.setAttribute('src', streamUrl);
    player.play();
    
    player.removeEventListener('ended', onPlayerEnded);
    player.addEventListener('ended', onPlayerEnded);

    player.removeEventListener('play', onPlayerStarted);
    player.addEventListener('play', onPlayerStarted);

    player.removeEventListener('pause', onPlayerEnded);
    player.addEventListener('pause', onPlayerEnded);
  }

  function createTexture(filter, data, width, height) {
    var texture = gl.createTexture();
    gl.bindTexture(gl.TEXTURE_2D, texture);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, filter);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, filter);
    if (data instanceof Uint8Array) {
        gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, width, height, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
    } 
    return texture;
  }

  function onPlayerEnded() {
  }

  function onPlayerStarted() {
  }

  function dispose() {
    if (audioTexture) {
      gl.deleteTexture(audioTexture);
      audioTexture = null;
      // TODO: Do I need to disconnect?
    }
  }

  function render(program, frameNumber) {
    if (!audioTexture) return;

    analyser.getByteFrequencyData(frequencyData);
    //for (var i = 0; i < frequencyData.length; ++i) frequencyData[i] = 1;
    var max = fftSize/2;

    // We are going to alternate between first and second row to
    // store current/previous frequency data
    var prevPosition = (frameNumber % 2) * max;
    var currentPosition = ((frameNumber + 1) % 2) * max;

    for (var i = 0; i < max; ++i) {
      var ci = (i + currentPosition) * 4;
      var previ = (i + prevPosition) * 4;

      var immediateValue = frequencyData[i];

      var avgValue = audioData[previ + 1];
      var longAvg = audioData[previ + 2];
      audioData[ci] = immediateValue;
      audioData[ci + 1] = avgValue * 0.5 + immediateValue * 0.5;
      audioData[ci + 2] = longAvg * 0.9 + immediateValue * 0.1;
    }

    // TODO: This can be moved into upper array.
    var prevAgg = prevPosition + 2 * max;
    var currentAgg = currentPosition + 2 * max;
    // now perform aggregation
    for (var i = 0; i < max; i += 2) {
      var p = (frequencyData[i] + frequencyData[i + 1])/2;
      var aggOffset = (i/2 + currentAgg) * 4; // aggregation takes only first half
      var pAggOffset = (i/2 + prevAgg) * 4; 

      var aggAvgValue = audioData[pAggOffset + 1];
      var aggLongAvg = audioData[pAggOffset + 2];

      audioData[aggOffset] = p;
      audioData[aggOffset + 1] = (aggAvgValue + p) * 0.5;
      audioData[aggOffset + 2] = aggLongAvg * 0.9 + p * 0.1;
    }

    // aggregate aggregation. Note, this builds hierarchies of aggregation.
    // [0..255] - built by previous loop, and contains avg between two source frequencies
    // [256..256 + 128] - contains average between four source frequencies
    // [384 .. 384 + 64] - averages between 8 source frequencies, and so on.
    // The `(last element) - 1` of the array will be an overall average.
    var halfMax = max/2;
    for (var i = 0; i < max - 2; i += 2) {
      var p = (audioData[(i + currentAgg) * 4] + audioData[(i + currentAgg + 1) * 4])*0.5;
      var aggOffset = (halfMax + i/2 + currentAgg) * 4;
      var pAggOffset = (halfMax + i/2 + prevAgg) * 4;

      var aggAvgValue = audioData[pAggOffset + 1];
      var aggLongAvg = audioData[pAggOffset + 2];

      audioData[aggOffset] = p;
      audioData[aggOffset + 1] = (aggAvgValue + p) * 0.5;
      audioData[aggOffset + 2] = aggLongAvg * 0.9 + p * 0.1;
    }

    // We can also compute these in the shader
    // var immediateRelative = Math.abs(longAvg) < 0.001 ? 1 : immediateValue/longAvg;
    // var avgRelative = Math.abs(longAvg) < 0.001 ? 1 : avgValue / longAvg;

    gl.activeTexture(gl.TEXTURE0 + unit);
    gl.bindTexture(gl.TEXTURE_2D, audioTexture);
    gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, width, height, 0, gl.RGBA, gl.UNSIGNED_BYTE, audioData);
    gl.uniform1i(program[channelName], unit);

    gl.uniform2f(program[resName], player.currentTime, player.duration);
  }
}

function getOrMakePlayerEl() {
  var playerEl = document.querySelector('audio');
  if (playerEl) return playerEl;
  playerEl = document.createElement('audio');
  playerEl.preload = true;
  playerEl.autobuffer = true;
  playerEl.constrols = '';
  // TODO: Better solution?
  playerEl.style.visibility = 'hidden'

  document.body.appendChild(playerEl);
  return playerEl;
}