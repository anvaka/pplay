module.exports = createShaders;

var getFragmentCode = require('./shaders/getFragmentCode');

function createShaders(main) {
  return {
    fragmentShader: getFragmentCode(main),
    vertexShader: `
precision highp float;
attribute vec2 a_pos;
uniform sampler2D iChannel0, iChannel1, iChannel2, iChannel3;
uniform vec2 iChannel0Res, iChannel1Res, iChannel2Res, iChannel3Res;
uniform float iFrame;
uniform float iTime;
uniform vec4 iMouse;
uniform vec2 iResolution;
uniform vec3 iTransform;
uniform vec4 iOrientation;

varying vec2 v_tex_pos;
varying vec2 vPos;

void main() {
  vec2 vt = 2.*(a_pos - iTransform.xy)/iTransform.z;
  v_tex_pos = vec2(vt.x - 1., 1. - vt.y);
  vec2 vv = vec2(2. * a_pos.x - 1., 1. - 2.*a_pos.y);
  vPos = a_pos;
  gl_Position = vec4(vv, 0, 1);
}    
`
  }
}