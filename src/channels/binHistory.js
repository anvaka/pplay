/**
 * Very fast moving ratio calculator.
 */
module.exports = createBinHistory;

function createBinHistory(historySize) {
  var min = Number.POSITIVE_INFINITY;
  var max = Number.NEGATIVE_INFINITY;
  historySize = historySize || 100;
  var history = new Uint8Array(historySize);
  var lastIndex = -1;
  var needsReindex = true;

  return {
    addSample,
    getFrequencyRatio
  };

  function addSample(value) {
    lastIndex += 1;
    if (lastIndex === history.length) {
      lastIndex = 0;
    }
    var replace = history[lastIndex];
    if (replace === min || replace === max) needsReindex = true;
    history[lastIndex] = value;
  }

  function getFrequencyRatio(currentValue) {
    if (needsReindex) reIndex();

    if (max === min) return 0;
    return (currentValue - min)/(max - min);
  }

  function reIndex() {
    min = Number.POSITIVE_INFINITY;
    max = Number.NEGATIVE_INFINITY;
    for (var i = 0; i < historySize; ++i) {
      var v = history[i];
      if (v < min) min = v;
      if (v > max) max = v;
    }
    needsReindex = false;
  }
}