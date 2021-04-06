var complexLibrary = require('./complex.glsl');
var bezier = require('./bezier.glsl');
const appState = require('../../appState');

module.exports = function getFragmentCode(main) {
  const varying = appState.webgl2 ? 'in' : 'varying';
  const output = appState.webgl2 ? 'outputColor' : 'gl_FragColor';
  var fragmentShader = `${appState.webgl2 ? '#version 300 es' : ''}
precision highp float;
uniform sampler2D iChannel0, iChannel1, iChannel2, iChannel3;
uniform vec2 iChannel0Res, iChannel1Res, iChannel2Res, iChannel3Res;
uniform float iFrame;
uniform float iTime;
uniform vec4 iOrientation;
uniform vec4 iMouse;
uniform vec3 iTransform;
uniform vec2 iResolution;
${varying} vec2 v_tex_pos;

vec2 screen2scene(vec2 pos) {
  pos /= iResolution.xy;
  float ar = (iResolution.x/iResolution.y);
  vec2 vt = 2.*(pos - iTransform.xy)/iTransform.z;
  return vec2(ar*(vt.x - 1.), 1. - vt.y);
}

${bezier}
${appState.webgl2 ? '' : getHyperbolicFunctions()}
${complexLibrary}
${main}
${appState.webgl2 ? 'out vec4 outputColor;' : ''}

void main() {
  float ar = iResolution.x / iResolution.y;
  ${output} = get_color(vec2(v_tex_pos.x * ar, v_tex_pos.y));
}
`;
return fragmentShader;
}

function getHyperbolicFunctions() {
  // These are supported in webgl2, but not in webgl1
  return `
float cosh(float val) {
  float tmp = exp(val);
  return (tmp + 1.0 / tmp) / 2.0;
}
 
float tanh(float val) {
  float tmp = exp(val);
  return (tmp - 1.0 / tmp) / (tmp + 1.0 / tmp);
}
 
float sinh(float val) {
  float tmp = exp(val);
  return (tmp - 1.0 / tmp) / 2.0;
}

vec2 cosh(vec2 val) {
  vec2 tmp = exp(val);
  return(tmp + 1.0 / tmp) / 2.0;
}
 
vec2 tanh(vec2 val) {
  vec2 tmp = exp(val);
  return (tmp - 1.0 / tmp) / (tmp + 1.0 / tmp);
}
 
vec2 sinh(vec2 val) {
  vec2 tmp = exp(val);
  return (tmp - 1.0 / tmp) / 2.0;
}
`
}