var bus = require('../bus');
var appState = require('../appState');
var getParsedShaderFunction = require('./getParsedShaderFunction');

/**
 * A text editor state for the shader. Manages shader
 * program compilation and error reporting state.
 *
 * @param {Function} updateCode - a callback that is called then code is validated
 * and found to be correct.
 */
module.exports = function createShaderCodeState(updateCode) {
  bus.on('glsl-parser-ready', parseCode);
  var currentShaderVersion = 0;

  // What is the current code?
  var currentShaderCode = appState.getCode();

  // For delayed parsing result verification (e.g. when vue is loaded it
  // can request us to see if there were any errors)
  var parserResult;

  loadCodeFromAppState();

  var api = {
    getCode,
    setCode,
    dispose,

    // These properties are for UI only
    code: currentShaderCode,
    error: '',
    errorDetail: '',
    isFloatError: false 
  };

  return api;

  function dispose() {
    bus.off('glsl-parser-ready', parseCode);
  }

  function getCode() {
    return appState.getCode();
  }

  function setCode(shaderCode) {
    if (shaderCode === currentShaderCode) {
      // If code hasn't changed, let's make sure that there was no previous
      // error
      if (parserResult && parserResult.error) {
        // And if there was error, let's revalidate code:
        parseCode();
      }
      return;
    } 

    trySetNewCode(shaderCode).then((result) => {
      if (result.cancelled) return;

      if (result && result.error) {
        updateErrorInfo(result.error);
        return result;
      }

      currentShaderCode = shaderCode;
      api.code = shaderCode;
      appState.saveCode(shaderCode);
    });
  }

  function updateErrorInfo(parserResult) {
    if (parserResult && parserResult.error) {
      api.error = parserResult.error;
      api.errorDetail = parserResult.errorDetail;
      api.isFloatError = parserResult.isFloatError;
    } else {
      api.error = '';
      api.errorDetail = '';
      api.isFloatError = false;
    }
  }

  function loadCodeFromAppState() {
    let persistedCode = appState.getCode();
    if (persistedCode) {
      trySetNewCode(persistedCode).then(result => {
        if (!result.error) return; // This means we set correctly;
        // If we get here - something went wrong. see the console
        console.error('Failed to restore previous shader code: ', result.error);
        // Let's use default code
        trySetNewCode(appState.getDefaultCode());
      });
    } else {
      // we want a default code
      trySetNewCode(appState.getDefaultCode());
    }
  }

  function parseCode(customCode) {
    return getParsedShaderFunction(customCode || currentShaderCode)
      .then(currentResult => {
        parserResult = currentResult
        updateErrorInfo(parserResult.error);
        return parserResult;
      });
  }

  function trySetNewCode(shaderCode) {
    currentShaderVersion += 1;
    var capturedVersion = currentShaderVersion;
    // step 1 - run through parser
    return parseCode(shaderCode).then((parserResult) => {
      if (capturedVersion !== currentShaderVersion) {
        parserResult.cancelled = true;
        // a newer request was issued. Ignore these results.
        return parserResult;
      }

      if (parserResult.error) {
        return parserResult;
      }
      // step 2 - run through real webgl
      try {
        updateCode(parserResult);
        return parserResult;
      } catch (e) {
        return {
          error: {
            error: e.message
          }
        }
      }
    });
  }
}