var fetchGLSL = require('./fetchGLSL.js');

var pragmaInclude = '#include ';
var defineInclude = '#define ';
var nullCode = { code: '' }

/**
 * Naively parses glsl code and tries to replace all `#pragma` statements
 * with empty string. Gives structured collection of pragma statements back
 * 
 * @param {String} code 
 */
module.exports = function makePragmaParser(code) {
  if (!code) return new Promise(resolve => resolve(nullCode));

  var parsedLines = processLineByLine(code);
  if (parsedLines.pending.length > 0) {
    return Promise.all(parsedLines.pending).then(() => parsedLines)
      .catch(error => { return {error: {error}}; });
  }

  return new Promise(resolve => resolve(parsedLines));
}

function processLineByLine(code) {
  var pending = []
  var lines = code.split('\n');
  var outputLines = [];
  var currentIndex = 0;
  var substitutes = new Map();

  lines.forEach((line, index) => {
    currentIndex = index;
    if (line && line[0] === '#') {
      outputLines.push('');
      processPragma(line);
    } else {
      if (substitutes.size > 0) {
        line = replaceDefines(line);
      }
      outputLines.push(line);
    }
  });

  return {
    getCode,
    pending
  };

  function getCode() {
    return outputLines.join('\n');
  }

  function processPragma(line) {
    if (line.indexOf(pragmaInclude) === 0) {
      var include = line.substr(pragmaInclude.length);
      var insertIndex = currentIndex;
      pending.push(fetchGLSL(include).then(code => {
        outputLines[insertIndex] = code
      }))
    } else if (line.indexOf(defineInclude) === 0) {
      var matches = line.match(/#define\s+([^\s].+)\s+(.+)$/)
      substitutes.set(matches[1], matches[2]);
    }
  }

  function replaceDefines(line) {
    // Note: this is very fragile, I know. Feel free to improve it.
    substitutes.forEach((replacement, key) => {
      line = line.replace(new RegExp(key, 'g'), replacement);
    });
    return line;
  }
}