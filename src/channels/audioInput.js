var isSoundCloud = require('./isSoundCloud');
var loadSoundCloudStream = require('./loadSoundCloudStream');
var glUtil = require('../util/gl-utils');

module.exports = audioInput;

function audioInput(value, gl, unit) {
  var fftSize = 1024;
  var audioTexture;
  var isPlaying = false;
  var needsBinding = true;
  var audioFrame = 0;
  var avgVolume = 0;
  var loValues = 0;
  var width, height;
  var channelName = 'iChannel' + unit;
  var resName = channelName + 'Res';
  var analyser;
  var movingAverage = new Float32Array(fftSize);
  var frequencyData = new Uint8Array(fftSize);
  var timeData = new Uint8Array(fftSize);
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
      return loadSoundCloudStream(value).then(url => streamUrl = url);
    }
    throw new Error('non soundcloud files are not supported yet.');
  }

  function initPlayer(player) {
    player.crossOrigin = 'anonymous';


    var audioCtx = new (window.AudioContext || window.webkitAudioContext);
    analyser = audioCtx.createAnalyser();
    analyser.fftSize = fftSize;

    var source = audioCtx.createMediaElementSource(player);
    source.connect(analyser);
    analyser.connect(audioCtx.destination);

    height = 2;
    width = 512;
    audioData = new Uint8Array(width * height * 4); //analyser.frequencyBinCount);
    console.log(analyser.frequencyBinCount)
    audioTexture = createTexture(gl.LINEAR, audioData, width, height);

    player.setAttribute('src', streamUrl);
    player.play();
    
    player.removeEventListener('ended', onPlayerEnded)
    player.addEventListener('ended', onPlayerEnded)

    player.removeEventListener('play', onPlayerStarted)
    player.addEventListener('play', onPlayerStarted)

    player.removeEventListener('pause', onPlayerEnded)
    player.addEventListener('pause', onPlayerEnded)
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
    // gl.bindTexture(gl.TEXTURE_2D, null);
    return texture;
  }

  function onPlayerEnded() {
    isPlaying = false;
  }

  function onPlayerStarted() {
    audioFrame = 0;
    isPlaying = true;
  }

  function dispose() {

  }

  function render(program) {
    if (!audioTexture) return;

    analyser.getByteFrequencyData(frequencyData);
    analyser.getByteTimeDomainData(timeData);

    var totalVolume = 0;
    var totalLoValues = 0;
    var loLimit = 20;
    for (var i = 0; i < fftSize/2; ++i) {
      var i4 = i * 4;
      var f = frequencyData[i];
      totalVolume += f/255;
      if (75 < i && i < 75 + loLimit) {
        totalLoValues += f/255;
      }
      audioData[i4 + 0]  = f;
      audioData[i4 + 1]  = (audioData[i4 + 1] * 4 + f)/5;
      audioData[i4 + 2]  = (audioData[i4 + 2] * 9 + f)/10;
      audioData[i4 + 3]  = (audioData[i4 + 3] * 49 +f)/50;

      var i2 = 2 * i4;
      var t = timeData[i];
      audioData[i2 + 0]  = t;
      audioData[i2 + 1]  = (audioData[i2 + 1] * 4 + t)/5;
      audioData[i2 + 2]  = (audioData[i2 + 2] * 9 + t)/10;
      audioData[i2 + 3]  = (audioData[i2 + 3] * 49 +t)/50;
    }

    gl.activeTexture(gl.TEXTURE0 + unit);
    gl.bindTexture(gl.TEXTURE_2D, audioTexture);
    gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, width, height, 0, gl.RGBA, gl.UNSIGNED_BYTE, audioData);
    gl.uniform1i(program[channelName], unit);

    avgVolume = (avgVolume * 3 + 0.5*totalVolume/fftSize)/4;
    loValues = (loValues * 4 + 0.5*totalLoValues/loLimit)/5;
    gl.uniform2f(program[resName],  loValues, avgVolume);
  }
}