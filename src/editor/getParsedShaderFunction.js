/**
 * This module parses user defined shader code.
 */

const checkGLSL = require('./parserServer.js');
var pragmaParse = require('./pragmaParser');
var getFragmentCode = require('../util/shaders/getFragmentCode');
const appState = require('../appState');

/**
 * Given a string, verifies that it is a valid glsl code,
 * and then returns code + log.
 * 
 * @param {String} shaderCode 
 */
module.exports = function getParsedShaderFunction(shaderCode) {
  var libAndCode = getFragmentCode(shaderCode);

  return pragmaParse(libAndCode).then(pragmaParseResult => {
    if (pragmaParseResult.error) {
      return pragmaParseResult;
    }

    var parsedCode = pragmaParseResult.getCode();

    var parserResult = checkGLSL(parsedCode); //{ globals: complexGlobals });
    parserResult.code = parsedCode;
    parserResult.main = shaderCode;

    if (parserResult.log.errorCount && !appState.webgl2) parserResult.error = parserError(parserResult.log);

    return parserResult;
  });
}

function parserError(log) {
  let diag = log.diagnostics[0];
  // TODO probably need to check kind (errors are 0, warnings are 1)
  let firstError = diag.range;
  let lineColumn = firstError.lineColumn();
  let source = firstError.source;
  let offset = source._lineOffsets[lineColumn.line]
  let line = source.contents.substr(offset,  lineColumn.column);
  line += source.contents.substring(firstError.start, firstError.end);
  let prefix = 'Line ' + lineColumn.line + ': ';
  let diagText = diag.text;
  return {
    error: 
      prefix + line + '\n' +
      whitespace(prefix.length) + whitespace(lineColumn.column) + '^',
    errorDetail: diagText,
    isFloatError: isFloatError(diagText)
  };
}

function isFloatError(diagText) {
  return diagText.indexOf('"int"') > -1 &&
    diagText.indexOf('"float"')  > -1;
}

function whitespace(length) {
  return new Array(length + 1).join(' ');
}
