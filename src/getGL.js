var appState = require('./appState');

module.exports = function getGL(canvas, ctxOptions) {
  var gl;
  try {
    gl = canvas.getContext('webgl2', ctxOptions);
    // yeah, this is bad (mixing side effects here)..
    if (gl) appState.webgl2 = true;
  } catch (err) {
    console.error('Failed to get webgl2 context', err)
    gl = null;
  }
  if (!gl) {
    // try webgl1:
    gl = canvas.getContext('webgl2', ctxOptions) || 
      canvas.getContext('experimental-webgl', ctxOptions);
  }

  return gl;
}