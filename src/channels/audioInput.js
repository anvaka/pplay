var isSoundCloud = require('./isSoundCloud');
var loadSoundCloudStream = require('./loadSoundCloudStream');
var binHistory = require('./binHistory');

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
  var frequencyHistory = createBinHistoryArray(); // array of binHistory.
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

  function createBinHistoryArray() {
    var result = [];
    for (var i = 0; i < fftSize/2; ++i) {
      result.push(binHistory());
    }
    return result;
  }

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
    audioData = new Uint8Array(width * height * 4); 
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

    var max = fftSize/2;
    var maxBands = 4;
    var totalVolume = 0;
    // Sum up immediate sound
    for (var band = 0; band < maxBands; ++band) {
      var bandSize = Math.floor(max/maxBands);
      var bandSum = 0;
      for (var i = band * bandSize; i < (band + 1) * bandSize; ++i) {
        bandSum += frequencyData[i];
      }

      // This is our immediate value for the band.
      var immediateValue = Math.round(bandSum/bandSize);

      var avgValue = audioData[band * 4 + 1];
      // Let's do temporal blending.

      // TODO: Do I need to adjust to frame rate?
      var rate = 0.5; // (immediateValue > avgValue ? 0.2 : 0.5);
      avgValue = avgValue * rate + immediateValue * (1 - rate);
      
      rate = 0.9;
      var longAvg = audioData[band * 4 + 2];
      longAvg = longAvg * rate + immediateValue * (1 - rate);

      audioData[band * 4 + 0] = immediateValue;
      audioData[band * 4 + 1] = Math.round(avgValue);
      audioData[band * 4 + 2] = Math.round(longAvg);

      // also get bass/mid/treble levels *relative to the past*
      var immediateRelative = Math.abs(longAvg) < 0.001 ? 1 : immediateValue/longAvg;
      var avgRelative = Math.abs(longAvg) < 0.001 ? 1 : avgValue / longAvg;

      //audioData[band * 4 + 3] = avgRelative * 128;
      audioData[band * 4 + 3] = immediateRelative * 128;
      // audioData[(band + maxBands) * 4 + 0] = immediateValue;
      // audioData[(band + maxBands) * 4 + 1] = immediateValue;
    }


    gl.activeTexture(gl.TEXTURE0 + unit);
    gl.bindTexture(gl.TEXTURE_2D, audioTexture);
    gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, width, height, 0, gl.RGBA, gl.UNSIGNED_BYTE, audioData);
    gl.uniform1i(program[channelName], unit);

    var avgBass = countFrequencies(0, 5);
    var avgMedium = countFrequencies(200, 201);
    avgVolume = (avgVolume * 3 + 0.5*totalVolume/fftSize)/4;
    gl.uniform2f(program[resName], avgBass, avgMedium);
  }

  function countFrequencies(from, to){
    if (to >= fftSize/2) {
      to = (fftSize/2 - 1);
      from = to - (from - to);
    }
    var total = 0;
    for (var i = from; i < to; ++i) {
      total += frequencyHistory[i].getFrequencyRatio(frequencyData[i]);
    }
    total /= (to - from);
    return Math.round(255*total);
  }
}