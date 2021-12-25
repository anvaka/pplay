var bus = require('../bus');

// This is naive parser that is being used until the real `glsl-parser`
// is loaded asynchronously. This parser assumes there are no errors
// TODO: maybe I should be more careful here?
var glslParser = {
  check(code) {
    return {
      code,
      log: {
        errorCount: 0
      }
    };
  }
};

let ide, inputSource;

// glsl-parser is ~179KB uncompressed, we don't want to wait until it is downloaded.
// So we load it asynchronously...
// TODO: Replace this with a real module:
require.ensure('wgl2npm/dist/src/exports/ide.js', () => {
  // ... and replace the naive parser with the real one, when ready.
  let {compileIDE} = require('wgl2npm/dist/src/exports/ide.js');
  const {getSharedPrefix} = require('../util/shaders/getFragmentCode.js');
  const wglAPI = require('../util/shaders/wgl2.glsl');

  // TODO: Add either WebGL2 or WebGL1 to the imported tokens
  const wgl2 = {name: 'wgl2', contents: wglAPI};
  const shared = {name: 'shared', contents: getSharedPrefix()};
  ide = compileIDE([wgl2, shared, {name: 'input', contents: ''} ]);
  ide.sources.forEach(s => {
    if (s.name === 'input') inputSource = s; 
  });

  // notify interested parties, so that they can recheck code if they wish.
  bus.fire('glsl-parser-ready'); 
});

module.exports = function checkGLSL(code) {
  if (ide) {
    inputSource.tokens = null;
    inputSource._lineOffsets = null;
    inputSource.contents = code;
    ide.updateState();
    return ide;
  }

  return glslParser.check(code);
}