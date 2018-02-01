var complexLibrary = require('./complex.glsl');
var bezier = require('./bezier.glsl');

module.exports = function getFragmentCode(main) {
  var fragmentShader = `
precision highp float;
uniform sampler2D iChannel0, iChannel1, iChannel2, iChannel3;
uniform vec2 iChannel0Res, iChannel1Res, iChannel2Res, iChannel3Res;
uniform float iFrame;
uniform float iTime;
uniform vec4 iOrientation;
uniform vec4 iMouse;
uniform vec3 iTransform;
uniform vec2 iResolution;
varying vec2 v_tex_pos;

vec2 screen2scene(vec2 pos) {
  pos /= iResolution.xy;
  float ar = (iResolution.x/iResolution.y);
  vec2 vt = 2.*(pos - iTransform.xy)/iTransform.z;
  return vec2(ar*(vt.x - 1.), 1. - vt.y);
}

${bezier}
${complexLibrary}
${main}

void main() {
  float ar = iResolution.x / iResolution.y;
  gl_FragColor = get_color(vec2(v_tex_pos.x * ar, v_tex_pos.y));
}
`;
return fragmentShader;
}