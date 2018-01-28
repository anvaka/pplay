module.exports = createShaders;

var getFragmentCode = require('./shaders/getFragmentCode');

function createShaders(main) {
  return {
    fragmentShader: getFragmentCode(main),
    vertexShader: `
precision highp float;
attribute vec2 a_pos;

uniform float iFrame;
uniform float iTime;
uniform vec4 iMouse;
uniform vec2 iResolution;
uniform vec3 u_transform;

varying vec2 v_tex_pos;

void main() {
  vec2 vt = 2.*(a_pos - u_transform.xy)/u_transform.z;
  v_tex_pos = vec2(vt.x - 1., 1. - vt.y);
  vec2 vv = vec2(2. * a_pos.x - 1., 1. - 2.*a_pos.y);
  gl_Position = vec4(vv, 0, 1);
}    
`
  }
}