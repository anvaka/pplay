module.exports = loadImage;

function loadImage(src) {
  var resolveImage, rejectImage;

  var image = new Image();
  image.crossOrigin = '';

  image.onload = imageLoaded;
  image.onerror = reportError;
  image.src = src;

  return new Promise((resolve, reject) => {
    resolveImage = resolve;
    rejectImage = reject; 
  });

  function reportError(err) { rejectImage(err); }
  function imageLoaded() { resolveImage(image); }
}