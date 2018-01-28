var complexLibrary = require('./complex.glsl');
var bezier = require('./bezier.glsl');

module.exports = function getFragmentCode(main) {
  var fragmentShader = `
precision highp float;
uniform float iFrame;
uniform float iTime;
uniform vec4 iMouse;
uniform vec3 u_transform;
uniform vec2 iResolution;
varying vec2 v_tex_pos;

vec2 screen2scene(vec2 pos) {
  pos /= iResolution.xy;
  float ar = (iResolution.x/iResolution.y);
  vec2 vt = 2.*(pos - u_transform.xy)/u_transform.z;
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