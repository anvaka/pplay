(function(e){function n(n){for(var r,o,a=n[0],u=n[1],s=n[2],l=0,f=[];l<a.length;l++)o=a[l],Object.prototype.hasOwnProperty.call(c,o)&&c[o]&&f.push(c[o][0]),c[o]=0;for(r in u)Object.prototype.hasOwnProperty.call(u,r)&&(e[r]=u[r]);d&&d(n);while(f.length)f.shift()();return i.push.apply(i,s||[]),t()}function t(){for(var e,n=0;n<i.length;n++){for(var t=i[n],r=!0,o=1;o<t.length;o++){var a=t[o];0!==c[a]&&(r=!1)}r&&(i.splice(n--,1),e=u(u.s=t[0]))}return e}var r={},o={app:0},c={app:0},i=[];function a(e){return u.p+"js/"+({}[e]||e)+"."+{"chunk-2c26030c":"c06f40dd","chunk-4949eea6":"97e1cc03","chunk-447470f0":"8411385f","chunk-59324178":"8bbcbce8"}[e]+".js"}function u(n){if(r[n])return r[n].exports;var t=r[n]={i:n,l:!1,exports:{}};return e[n].call(t.exports,t,t.exports,u),t.l=!0,t.exports}u.e=function(e){var n=[],t={"chunk-2c26030c":1,"chunk-447470f0":1,"chunk-59324178":1};o[e]?n.push(o[e]):0!==o[e]&&t[e]&&n.push(o[e]=new Promise((function(n,t){for(var r="css/"+({}[e]||e)+"."+{"chunk-2c26030c":"60fa4cef","chunk-4949eea6":"31d6cfe0","chunk-447470f0":"be32b711","chunk-59324178":"075c6641"}[e]+".css",c=u.p+r,i=document.getElementsByTagName("link"),a=0;a<i.length;a++){var s=i[a],l=s.getAttribute("data-href")||s.getAttribute("href");if("stylesheet"===s.rel&&(l===r||l===c))return n()}var f=document.getElementsByTagName("style");for(a=0;a<f.length;a++){s=f[a],l=s.getAttribute("data-href");if(l===r||l===c)return n()}var d=document.createElement("link");d.rel="stylesheet",d.type="text/css",d.onload=n,d.onerror=function(n){var r=n&&n.target&&n.target.src||c,i=new Error("Loading CSS chunk "+e+" failed.\n("+r+")");i.code="CSS_CHUNK_LOAD_FAILED",i.request=r,delete o[e],d.parentNode.removeChild(d),t(i)},d.href=c;var v=document.getElementsByTagName("head")[0];v.appendChild(d)})).then((function(){o[e]=0})));var r=c[e];if(0!==r)if(r)n.push(r[2]);else{var i=new Promise((function(n,t){r=c[e]=[n,t]}));n.push(r[2]=i);var s,l=document.createElement("script");l.charset="utf-8",l.timeout=120,u.nc&&l.setAttribute("nonce",u.nc),l.src=a(e);var f=new Error;s=function(n){l.onerror=l.onload=null,clearTimeout(d);var t=c[e];if(0!==t){if(t){var r=n&&("load"===n.type?"missing":n.type),o=n&&n.target&&n.target.src;f.message="Loading chunk "+e+" failed.\n("+r+": "+o+")",f.name="ChunkLoadError",f.type=r,f.request=o,t[1](f)}c[e]=void 0}};var d=setTimeout((function(){s({type:"timeout",target:l})}),12e4);l.onerror=l.onload=s,document.head.appendChild(l)}return Promise.all(n)},u.m=e,u.c=r,u.d=function(e,n,t){u.o(e,n)||Object.defineProperty(e,n,{enumerable:!0,get:t})},u.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},u.t=function(e,n){if(1&n&&(e=u(e)),8&n)return e;if(4&n&&"object"===typeof e&&e&&e.__esModule)return e;var t=Object.create(null);if(u.r(t),Object.defineProperty(t,"default",{enumerable:!0,value:e}),2&n&&"string"!=typeof e)for(var r in e)u.d(t,r,function(n){return e[n]}.bind(null,r));return t},u.n=function(e){var n=e&&e.__esModule?function(){return e["default"]}:function(){return e};return u.d(n,"a",n),n},u.o=function(e,n){return Object.prototype.hasOwnProperty.call(e,n)},u.p="",u.oe=function(e){throw console.error(e),e};var s=window["webpackJsonp"]=window["webpackJsonp"]||[],l=s.push.bind(s);s.push=n,s=s.slice();for(var f=0;f<s.length;f++)n(s[f]);var d=l;i.push([0,"chunk-vendors"]),t()})({0:function(e,n,t){e.exports=t("56d7")},"15da":function(e,n,t){function r(e){return e.match(/^https?:\/\/soundcloud\.com\//)}t("ac1f"),t("466d"),e.exports=r},"181c":function(e,n,t){function r(e,n,t){e.activeTexture(e.TEXTURE0+t),e.bindTexture(e.TEXTURE_2D,n)}function o(e,n){var t=e.createTexture(),r=0,o=e.RGBA,c=e.RGBA,i=e.UNSIGNED_BYTE;return e.bindTexture(e.TEXTURE_2D,t),e.texImage2D(e.TEXTURE_2D,r,o,c,i,n),e.texParameteri(e.TEXTURE_2D,e.TEXTURE_WRAP_S,e.CLAMP_TO_EDGE),e.texParameteri(e.TEXTURE_2D,e.TEXTURE_WRAP_T,e.CLAMP_TO_EDGE),e.texParameteri(e.TEXTURE_2D,e.TEXTURE_MIN_FILTER,e.LINEAR),t}function c(e,n){var t=e.createBuffer();return e.bindBuffer(e.ARRAY_BUFFER,t),e.bufferData(e.ARRAY_BUFFER,n,e.STATIC_DRAW),t}function i(e,n,t,r){e.bindBuffer(e.ARRAY_BUFFER,n),e.enableVertexAttribArray(t),e.vertexAttribPointer(t,r,e.FLOAT,!1,0,0)}function a(e,n,t){var r=e.createProgram(),o=u(e,e.VERTEX_SHADER,n),c=u(e,e.FRAGMENT_SHADER,t);if(e.attachShader(r,o),e.attachShader(r,c),e.linkProgram(r),!e.getProgramParameter(r,e.LINK_STATUS))throw new Error(e.getProgramInfoLog(r));var i,a={program:r,unload:v},s=e.getProgramParameter(r,e.ACTIVE_ATTRIBUTES);for(i=0;i<s;i++){var l=e.getActiveAttrib(r,i);a[l.name]=e.getAttribLocation(r,l.name)}var f=e.getProgramParameter(r,e.ACTIVE_UNIFORMS);for(i=0;i<f;i++){var d=e.getActiveUniform(r,i);a[d.name]=e.getUniformLocation(r,d.name)}return a;function v(){e.deleteProgram(r)}}function u(e,n,t){var r=e.createShader(n);if(e.shaderSource(r,t),e.compileShader(r),!e.getShaderParameter(r,e.COMPILE_STATUS))throw new Error(e.getShaderInfoLog(r));return r}t("d9e2"),t("b0c0"),e.exports={bindTexture:r,createBuffer:c,bindAttribute:i,createProgram:a,createShader:u,createTexture:o}},"1f64":function(e,n){e.exports=function(){return window.innerWidth<600}},"21da":function(e,n,t){t("99af");var r=t("b4af"),o=t("a4f1"),c=t("7c6e");function i(){var e=c.webgl2?"in":"varying";return"uniform sampler2D iChannel0, iChannel1, iChannel2, iChannel3;\nuniform vec2 iChannel0Res, iChannel1Res, iChannel2Res, iChannel3Res;\n\n// Current frame number, counted from launch of the program\nuniform float iFrame;\n\n// How many seconds passed since program launch\nuniform float iTime;\n\n// Device orientation angles `alpha`, `beta`, `gamma` and `absolute`\nuniform vec4 iOrientation;\n\n// Mouse (or touch) coordinates. `.xy` - current, `.zw` - last clicked.\n// Note: To translate coordinates to scene coordinates use\n// `screen2scene(iMouse.xy)` method.\nuniform vec4 iMouse;\n\n// Screen resolution\nuniform vec2 iResolution;\n\n// Current scene transform (`transformX`, `transformY`, `transformZ`)\nuniform vec3 iTransform;\n\n".concat(e," vec2 v_tex_pos;\n\nvec2 screen2scene(vec2 pos) {\n  pos /= iResolution.xy;\n  float ar = (iResolution.x/iResolution.y);\n  vec2 vt = 2.*(pos - iTransform.xy)/iTransform.z;\n  return vec2(ar*(vt.x - 1.), 1. - vt.y);\n}\n\n").concat(o,"\n").concat(c.webgl2?"":a(),"\n").concat(r,"\n")}function a(){return"\nfloat cosh(float val) {\n  float tmp = exp(val);\n  return (tmp + 1.0 / tmp) / 2.0;\n}\n \nfloat tanh(float val) {\n  float tmp = exp(val);\n  return (tmp - 1.0 / tmp) / (tmp + 1.0 / tmp);\n}\n \nfloat sinh(float val) {\n  float tmp = exp(val);\n  return (tmp - 1.0 / tmp) / 2.0;\n}\n\nvec2 cosh(vec2 val) {\n  vec2 tmp = exp(val);\n  return(tmp + 1.0 / tmp) / 2.0;\n}\n \nvec2 tanh(vec2 val) {\n  vec2 tmp = exp(val);\n  return (tmp - 1.0 / tmp) / (tmp + 1.0 / tmp);\n}\n \nvec2 sinh(vec2 val) {\n  vec2 tmp = exp(val);\n  return (tmp - 1.0 / tmp) / 2.0;\n}\n"}e.exports=function(e){var n=c.webgl2?"outputColor":"gl_FragColor",t="".concat(c.webgl2?"#version 300 es":"","\nprecision highp float;\n").concat(i(),"\n").concat(e,"\n").concat(c.webgl2?"out vec4 outputColor;":"","\n\nvoid main() {\n  float ar = iResolution.x / iResolution.y;\n  ").concat(n," = get_color(vec2(v_tex_pos.x * ar, v_tex_pos.y));\n}\n");return t},e.exports.getSharedPrefix=i},"264c":function(e,n,t){t("d9e2"),t("d3b7"),t("cfc3"),t("907a"),t("9a8c"),t("a975"),t("735e"),t("c1ac"),t("d139"),t("3a7b"),t("d5d6"),t("82f8"),t("e91f"),t("60bd"),t("5f96"),t("3280"),t("3fcc"),t("ca91"),t("25a1"),t("cd26"),t("3c5d"),t("2954"),t("649e"),t("219c"),t("170b"),t("b39a"),t("72f7");var r=t("7d05"),o=t("53bf"),c=t("f5ef"),i=t("181c"),a=t("3518"),u=t("8ca5"),s=t("7c6e"),l=t("97bb"),f=2500;function d(e){var n,t=l(e);if(!t)throw new Error("WebGL is not available");var d={currentX:0,currentY:0,clickX:0,clickY:0},v=0,m={alpha:0,beta:0,gamma:0,absolute:0},p={x:0,y:0,z:1},h=e.clientWidth,g=e.clientHeight,_=r(t.canvas,{controller:{applyTransform:O,getOwner:function(){return t.canvas}}});I();var b,w,E=!0,x=!0,y=!0,T=new Date;N();var C,R,A=a(s.getCode());t.enable(t.BLEND),t.blendFunc(t.SRC_ALPHA,t.ONE_MINUS_SRC_ALPHA),t.clearColor(0,0,0,1);var P=u(t),S={isActive:!0,codeEditorState:o(U),channelsState:P,goToOrigin:z,setActivityMonitorEnabled:F,dispose:B};return window.scene=S,S;function L(){t.clear(t.DEPTH_BUFFER_BIT|t.COLOR_BUFFER_BIT),b=0,k(),v+=1,D()}function k(){t.useProgram(C.program),E&&(E=!1,t.viewport(0,0,h,g),t.uniform2f(C.iResolution,h,g)),x&&(x=!1,t.uniform3f(C.iTransform,p.x,p.y,p.z)),P.render(C,v);var e=window.performance.now()-n;t.uniform1f(C.iTime,e/1e3),t.uniform1f(C.iFrame,v),t.uniform4f(C.iMouse,d.currentX,d.currentY,d.clickX,d.clickY),y&&(y=!1,t.uniform4f(C.iOrientation,m.alpha,m.beta,m.gamma,m.absolute)),t.drawArrays(t.TRIANGLES,0,6)}function D(){b||(b=requestAnimationFrame(L))}function U(e){var r=i.createProgram(t,A.vertexShader,e.code);C&&C.unload(),n=window.performance.now(),C=r,R=i.createBuffer(t,new Float32Array([0,0,1,0,0,1,0,1,1,0,1,1])),i.bindAttribute(t,R,C.a_pos,2),E=!0,x=!0,D(),c.fire("scene-ready",window.scene)}function z(){_.showRectangle({left:0,right:window.innerWidth,top:0,bottom:window.innerHeight}),O(_.getTransform())}function O(e){var n=e.x/h,t=e.y/g,r=e.scale;p.x=n,p.y=t,p.z=r,x=!0,s.saveTransform(n,t,r),D()}function I(){var e=s.getVisibleRectangle(h,g);e&&_.showRectangle(e)}function X(){var e=new Date;e-T>f&&(S.isActive=!1)}function F(e){e?w||(w=setInterval(X,2e3)):(clearInterval(w),w=!1,S.isActive=!0)}function M(){T=new Date,S.isActive=!0}function B(){_.dispose(),window.removeEventListener("resize",J),window.removeEventListener("mousemove",Y,!0),window.removeEventListener("mousedown",W,!0),window.removeEventListener("touchstart",j,!0),window.removeEventListener("touchmove",G,!0),window.removeEventListener("keydown",M,!0),window.removeEventListener("deviceorientation",q,!0),cancelAnimationFrame(b),F(!1),b=0}function N(){window.addEventListener("resize",J),window.addEventListener("mousemove",Y,!0),window.addEventListener("mousedown",W,!0),window.addEventListener("touchstart",j,!0),window.addEventListener("touchmove",G,!0),window.addEventListener("keydown",M,!0),window.addEventListener("deviceorientation",q,!0),s.hasCode()&&F(!0)}function j(e){M();var n=e.touches[0];n&&(V(n.clientX,n.clientY),H(n.clientX,n.clientY))}function q(e){y=!0,m.absolute=e.absolute,m.alpha=Math.PI*e.alpha/180,m.beta=Math.PI*e.beta/180,m.gamma=Math.PI*e.gamma/180}function G(e){M();var n=e.touches[0];n&&H(n.clientX,n.clientY)}function Y(e){H(e.clientX,e.clientY),M()}function W(e){V(e.clientX,e.clientY),M()}function H(e,n){d.currentX=e,d.currentY=n}function V(e,n){d.clickX=e,d.clickY=n}function J(){K(window.innerWidth,window.innerHeight)}function K(n,t){e.width=n,e.height=t,h=n,g=t,I(),E=!0,D()}}e.exports=d},3518:function(e,n,t){t("99af"),e.exports=c;var r=t("7c6e"),o=t("21da");function c(e){var n=r.webgl2?"in":"attribute",t=r.webgl2?"out":"varying";return{fragmentShader:o(e),vertexShader:"".concat(r.webgl2?"#version 300 es":"","\nprecision highp float;\nuniform sampler2D iChannel0, iChannel1, iChannel2, iChannel3;\nuniform vec2 iChannel0Res, iChannel1Res, iChannel2Res, iChannel3Res;\nuniform float iFrame;\nuniform float iTime;\nuniform vec4 iMouse;\nuniform vec2 iResolution;\nuniform vec3 iTransform;\nuniform vec4 iOrientation;\n\n").concat(n," vec2 a_pos;\n").concat(t," vec2 v_tex_pos;\n").concat(t," vec2 vPos;\n\nvoid main() {\n  vec2 vt = 2.*(a_pos - iTransform.xy)/iTransform.z;\n  v_tex_pos = vec2(vt.x - 1., 1. - vt.y);\n  vec2 vv = vec2(2. * a_pos.x - 1., 1. - 2.*a_pos.y);\n  vPos = a_pos;\n  gl_Position = vec4(vv, 0, 1);\n}    \n")}}},4020:function(e,n,t){t("d3b7"),t("99af"),e.exports=function(e,n){return n||(n={}),new Promise(t);function t(t,r){var o=new XMLHttpRequest;function c(e){e.lengthComputable&&n.progress({loaded:e.loaded,total:e.total,percent:e.loaded/e.total})}function i(){if(200===o.status){var c=o.response;"json"===n.responseType&&"string"===typeof c&&(c=JSON.parse(c)),t(c)}else r({err:"Unexpected status code ".concat(o.status," when calling ").concat(e),response:o.response,status:o.status})}function a(){r("Failed to download ".concat(e))}function u(){r("Cancelled download of ".concat(e))}"function"===typeof n.progress&&o.addEventListener("progress",c,!1),o.addEventListener("load",i,!1),o.addEventListener("error",a,!1),o.addEventListener("abort",u,!1),o.open("GET",e),n.responseType&&(o.responseType=n.responseType),o.send(null)}}},"410d":function(e,n,t){t("ac1f"),t("1276"),t("466d"),t("4de4"),t("d3b7"),t("b64b"),t("d9e2");var r=t("4020");function o(e,n){var t=JSON.parse(e),r=n.length>1&&n[1];r||(r=Object.keys(t.files).filter((function(e){return e.match(/\.glsl$/)}))[0]);var o=t.files[r];if(!o)throw new Error("Missing gist file "+n[0]+"/"+r);return o.content}e.exports=function(e){var n=e.split("/");return r("https://api.github.com/gists/".concat(n[0])).then((function(e){return o(e,n)})).catch((function(e){if(e&&e.response&&e.response.match(/rate limit/))return r("https://d2enmttf0dqrei.cloudfront.net/".concat(n[0])).then((function(e){return o(e,n)}))}))}},"53bf":function(e,n,t){var r=t("f5ef"),o=t("7c6e"),c=t("88fa");e.exports=function(e){r.on("glsl-parser-ready",v);var n,t=0,i=o.getCode();d();var a={getCode:s,setCode:l,dispose:u,code:i,error:"",errorDetail:"",isFloatError:!1};return a;function u(){r.off("glsl-parser-ready",v)}function s(){return o.getCode()}function l(e){e!==i?m(e).then((function(n){if(!n.cancelled){if(n&&n.error)return f(n.error),n;i=e,a.code=e,o.saveCode(e)}})):n&&n.error&&v()}function f(e){e&&e.error?(a.error=e.error,a.errorDetail=e.errorDetail,a.isFloatError=e.isFloatError):(a.error="",a.errorDetail="",a.isFloatError=!1)}function d(){var e=o.getCode();e?m(e).then((function(e){e.error&&(console.error("Failed to restore previous shader code: ",e.error),m(o.getDefaultCode()))})):m(o.getDefaultCode())}function v(e){return c(e||i).then((function(e){return n=e,f(n.error),n}))}function m(n){t+=1;var r=t;return v(n).then((function(n){if(r!==t)return n.cancelled=!0,n;if(n.error)return n;try{return e(n),n}catch(o){return{error:{error:o.message}}}}))}}},"56d7":function(e,n,t){t("e260"),t("e6cf"),t("cca6"),t("a79d");var r=t("264c"),o=t("7c6e"),c=t("f5ef"),i=t("97bb"),a=document.getElementById("scene-canvas");function u(e){var n=window.innerWidth,t=window.innerHeight;e.width=n,e.height=t;var r=i(e,{antialias:!1});r?(window.webGLEnabled=!0,o.ready?s():c.on("appstate-ready",s)):window.webGLEnabled=!1}function s(){var e=r(a);window.scene=e}a&&u(a),t.e("chunk-2c26030c").then(function(){t("df34")}.bind(null,t)).catch(t.oe)},"657e":function(e,n,t){t("d3b7"),t("159b"),t("b0c0");var r,o,c=t("f5ef"),i={check:function(e){return{code:e,log:{errorCount:0}}}};t.e("chunk-4949eea6").then(function(){var e=t("eb76"),n=e.compileIDE,i=t("21da"),a=i.getSharedPrefix,u=t("6a2f"),s={name:"wgl2",contents:u},l={name:"shared",contents:a()};r=n([s,l,{name:"input",contents:""}]),r.sources.forEach((function(e){"input"===e.name&&(o=e)})),c.fire("glsl-parser-ready")}.bind(null,t)).catch(t.oe),e.exports=function(e){return r?(o.tokens=null,o._lineOffsets=null,o.contents=e,r.updateState(),r):i.check(e)}},6610:function(e,n,t){t("d3b7"),t("3ca3"),t("ddb0"),t("ac1f"),t("1276"),t("4ec9"),t("159b"),t("a15b"),t("466d"),t("5319"),t("4d63"),t("c607"),t("2c3e"),t("25f0");var r=t("e503"),o="#include ",c="#define ",i={code:""};function a(e){var n=[],t=e.split("\n"),i=[],a=0,u=new Map;return t.forEach((function(e,n){a=n,e&&"#"===e[0]&&"v"!==e[1]?(i.push(""),l(e)):(u.size>0&&(e=f(e)),i.push(e))})),{getCode:s,pending:n};function s(){return i.join("\n")}function l(e){if(0===e.indexOf(o)){var t=e.substr(o.length),s=a;n.push(r(t).then((function(e){i[s]=e})))}else if(0===e.indexOf(c)){var l=e.match(/#define\s+([^\s].+)\s+(.+)$/);u.set(l[1],l[2])}}function f(e){return u.forEach((function(n,t){e=e.replace(new RegExp(t,"g"),n)})),e}}e.exports=function(e){if(!e)return new Promise((function(e){return e(i)}));var n=a(e);return n.pending.length>0?Promise.all(n.pending).then((function(){return n})).catch((function(e){return{error:{error:e}}})):new Promise((function(e){return e(n)}))}},"7c6e":function(e,n,t){t("ac1f"),t("00b4"),t("f00c"),t("a9e3");var r,o,c=t("9cf4"),i=t("f5ef"),a=t("1f64"),u=t("410d"),s=c({},{useSearch:!0}),l=t("8436"),f=l,d=s.get("gist");d?u(d).then((function(e){f=e,v.ready=!0,v.settingsPanel.collapsed=C(),i.fire("appstate-ready")})).catch((function(e){console.error(e),f=l,v.settingsPanel.loadError=e,v.settingsPanel.collapsed=!1,v.ready=!0,i.fire("appstate-ready")})):(r=!0,f=s.get("fc")||l);var v={settingsPanel:{collapsed:C(),codeLimitError:!1,loadError:null,audioWarning:!1},webgl2:!1,hideUI:void 0!==s.get("hide-ui"),ready:r,saveCode:T,hasCode:h,getCode:x,getDefaultCode:y,saveTransform:w,getVisibleRectangle:E,addChannel:g,removeChannel:_,getActiveChannels:b,setSoundIOSWarning:p,qs:s},m=/iPad|iPhone|iPod/.test(navigator.userAgent)&&!window.MSStream;function p(e){m&&(v.settingsPanel.audioWarning=e)}function h(){return f!==l}function g(e,n){s.set("i"+e,n)}function _(e){s.unset("i"+e)}function b(){for(var e=[],n=0;n<3;++n){var t=s.get("i"+n);void 0!==t&&e.push({unit:n,src:t})}return e}function w(e,n,t){o&&clearTimeout(o),o=setTimeout((function(){o=0,s.set({tx:e,ty:n,scale:t})}),300)}function E(e,n){var t=s.get("tx"),r=s.get("ty"),o=s.get("scale");if(Number.isFinite(t)||Number.isFinite(r)||Number.isFinite(o))return{left:-t*e/o,top:-r*n/o,right:-t*e/o+e/o,bottom:-r*n/o+n/o}}function x(){return f}function y(){return l}function T(e){e.length>1e3?(v.settingsPanel.codeLimitError=!0,s.unset("fc")):(v.settingsPanel.codeLimitError=!1,s.set({fc:e}),s.unset("gist")),f=e}function C(){return a()||h()}s.onChange((function(){i.fire("scene-ready",window.scene)})),e.exports=v},8436:function(e,n){e.exports="vec4 get_color(vec2 p) {\n  vec2 z = vec2(0.); float t = 0.;\n\n  for(int i = 0; i < 32; ++i) {\n    if (length(z) > 2.) break;\n    // main fractal loop. Change it:\n    z = c_mul(z, z) + p;\n    t = float(i);\n  }\n\n  return length(z) * vec4(t/64., t/32., t/24., 1.0);\n}"},"88fa":function(e,n,t){t("a15b");var r=t("657e"),o=t("6610"),c=t("21da"),i=t("7c6e");function a(e){var n=e.diagnostics[0],t=n.range,r=t.lineColumn(),o=t.source,c=o._lineOffsets[r.line],i=o.contents.substr(c,r.column);i+=o.contents.substring(t.start,t.end);var a="Line "+r.line+": ",l=n.text;return{error:a+i+"\n"+s(a.length)+s(r.column)+"^",errorDetail:l,isFloatError:u(l)}}function u(e){return e.indexOf('"int"')>-1&&e.indexOf('"float"')>-1}function s(e){return new Array(e+1).join(" ")}e.exports=function(e){var n=c(e);return o(n).then((function(n){if(n.error)return n;var t=n.getCode(),o=r(t);return o.code=t,o.main=e,o.log.errorCount&&!i.webgl2&&(o.error=a(o.log)),o}))}},"8ca5":function(e,n,t){t("d3b7"),t("6062"),t("3ca3"),t("ddb0"),t("159b"),t("d9e2"),t("a434"),t("ac1f"),t("466d"),t("dca8");var r=t("ac74"),o=t("181c"),c=t("7c6e"),i=t("ca6b"),a=t("15da");function u(e,n,t){var c,i,a,u=!0,s="iChannel"+t,l=s+"Res",f=Object.freeze({kind:"image",unit:t,load:m,dispose:v,render:d});return f;function d(e){c&&(u&&(u=!1),n.activeTexture(n.TEXTURE0+t),n.bindTexture(n.TEXTURE_2D,c),n.uniform1i(e[s],t),n.uniform2f(e[l],i,a))}function v(){c&&(n.deleteTexture(c),c=null)}function m(){return r(e).then((function(e){return c=o.createTexture(n,e),i=e.width,a=e.height,f}))}}function s(e,n){for(var t=0;t<e.length;++t)if(e[t].unit===n)return t;return-1}e.exports=function(e){var n=new Set,t=8,r=[],o=[],l={list:r,removeChannel:v,addChannel:m,render:d};return f(),l;function f(){var e=c.getActiveChannels();e&&e.forEach((function(e){m(e.src,e.unit)}))}function d(e,n){for(var t=0;t<o.length;++t)o[t].render(e,n)}function v(e){if(!n.has(e.unit))throw new Error("You are trying delete something that does not exist");var t=s(o,e.unit);if(-1===t)throw new Error("You are trying delete something that does not exist");o[t].dispose(),o.splice(t,1);var i=s(r,e.unit);r.splice(i,1),n.delete(e.unit),c.removeChannel(e.unit);var a=!1;o.forEach((function(e){"audio"===e.kind&&(a=!0)})),c.setSoundIOSWarning(a)}function m(t,s){if("string"!==typeof t)throw new Error("implement me");if(n.has(s))throw new Error("This channel is already taken");if(void 0===s&&(s=p()),void 0===s)throw new Error("All channels are busy");var l;if(a(t)||t.match(/\.mp3$/)?(l=i(t,e,s),c.setSoundIOSWarning(!0)):h(t)&&(l=u(t,e,s)),!l)throw new Error("not implemented");o.push(l),n.add(s);var f={kind:l.kind,name:"iChannel".concat(s),unit:s,error:null,state:"loading",src:t,model:l};r.push(f),l.load().then((function(){f.state="ready",c.addChannel(s,t)})).catch((function(e){f.state="error",f.error=e}))}function p(){for(var e=0;e<t;++e)if(!n.has(e))return e}function h(){return!0}}},"97bb":function(e,n,t){var r=t("7c6e");e.exports=function(e,n){var t;try{t=e.getContext("webgl2",n),t&&(r.webgl2=!0)}catch(o){console.error("Failed to get webgl2 context",o),t=null}return t||(t=e.getContext("webgl2",n)||e.getContext("experimental-webgl",n)),t}},a4f1:function(e,n){e.exports="// Performs bezier easing.\n// See http://cubic-bezier.com/#.17,.67,.83,.67 for details\nvec2 bezier(vec2 p0, vec2 p1, vec2 p2, vec2 p3, float t) {\n  float one_minus_t = 1. - t;\n  return one_minus_t * one_minus_t * one_minus_t * p0 + \n    3. * one_minus_t * one_minus_t * t * p1 + \n    3. * one_minus_t * t * t * p2 +\n    t * t * t * p3;\n}\n\n// Animates t, using control points p1 and p2.\n// It is very similar to CSS based cubic-bezier timing funciton.\nfloat bease(float t, vec2 p1, vec2 p2) {\n  vec2 p0 = vec2(0.);\n  vec2 p3 = vec2(1.);\n  vec2 res = bezier(p0, p1, p2, p3, t);\n  return res.y;\n}\n\n// Produces a uniform value between 0 and 1 over `framesCount` frames\nfloat timef(float framesCount) {\n  return mod(iFrame,framesCount)/framesCount;\n}\n\n// Performs bezier easing with two controls points at `vec2(0.42, 0)` and `vec2(1)`\nfloat bease(float t) {\n  return bease(t, vec2(0.42, 0), vec2(1));\n}"},ac74:function(e,n,t){function r(e){var n,t,r=new Image;return r.crossOrigin="",r.onload=c,r.onerror=o,r.src=e,new Promise((function(e,r){n=e,t=r}));function o(e){t(e)}function c(){n(r)}}t("d3b7"),e.exports=r},b4af:function(e,n){e.exports="// based on https://github.com/rust-num/num-complex/blob/master/src/lib.rs\n// Copyright 2013 The Rust Project Developers. MIT license\n// Ported to GLSL by Andrei Kashcha (github.com/anvaka), available under MIT license as well.\n\n\n// Returns a complex number z = 1 + i * 0.\nvec2 c_one() { return vec2(1., 0.); }\n\n// Returns a complex number z = 0 + i * 1.\nvec2 c_i() { return vec2(0., 1.); }\n\nfloat arg(vec2 c) {\n  return atan(c.y, c.x);\n}\n\n// Returns conjugate of a complex number.\nvec2 c_conj(vec2 c) {\n  return vec2(c.x, -c.y);\n}\n\nvec2 c_from_polar(float r, float theta) {\n  return vec2(r * cos(theta), r * sin(theta));\n}\n\nvec2 c_to_polar(vec2 c) {\n  return vec2(length(c), atan(c.y, c.x));\n}\n\n// Computes `e^(c)`, where `e` is the base of the natural logarithm.\nvec2 c_exp(vec2 c) {\n  return c_from_polar(exp(c.x), c.y);\n}\n\n\n// Raises a floating point number to the complex power `c`.\nvec2 c_exp(float base, vec2 c) {\n  return c_from_polar(pow(base, c.x), c.y * log(base));\n}\n\n// Computes the principal value of natural logarithm of `c`.\nvec2 c_ln(vec2 c) {\n  vec2 polar = c_to_polar(c);\n  return vec2(log(polar.x), polar.y);\n}\n\n// Returns the logarithm of `c` with respect to an arbitrary base.\nvec2 c_log(vec2 c, float base) {\n  vec2 polar = c_to_polar(c);\n  return vec2(log(polar.r), polar.y) / log(base);\n}\n\n// Computes the square root of complex number `c`.\nvec2 c_sqrt(vec2 c) {\n  vec2 p = c_to_polar(c);\n  return c_from_polar(sqrt(p.x), p.y/2.);\n}\n\n// Raises `c` to a floating point power `e`.\nvec2 c_pow(vec2 c, float e) {\n  vec2 p = c_to_polar(c);\n  return c_from_polar(pow(p.x, e), p.y*e);\n}\n\n// Raises `c` to a complex power `e`.\nvec2 c_pow(vec2 c, vec2 e) {\n  vec2 polar = c_to_polar(c);\n  return c_from_polar(\n     pow(polar.x, e.x) * exp(-e.y * polar.y),\n     e.x * polar.y + e.y * log(polar.x)\n  );\n}\n\n// Computes the complex product of `self * other`.\nvec2 c_mul(vec2 self, vec2 other) {\n    return vec2(self.x * other.x - self.y * other.y, \n                self.x * other.y + self.y * other.x);\n}\n\nvec2 c_div(vec2 self, vec2 other) {\n    float norm = length(other);\n    return vec2(self.x * other.x + self.y * other.y,\n                self.y * other.x - self.x * other.y)/(norm * norm);\n}\n\nvec2 c_sin(vec2 c) {\n  return vec2(sin(c.x) * cosh(c.y), cos(c.x) * sinh(c.y));\n}\n\nvec2 c_cos(vec2 c) {\n  // formula: cos(a + bi) = cos(a)cosh(b) - i*sin(a)sinh(b)\n  return vec2(cos(c.x) * cosh(c.y), -sin(c.x) * sinh(c.y));\n}\n\nvec2 c_tan(vec2 c) {\n  vec2 c2 = 2. * c;\n  return vec2(sin(c2.x), sinh(c2.y))/(cos(c2.x) + cosh(c2.y));\n}\n\nvec2 c_atan(vec2 c) {\n  // formula: arctan(z) = (ln(1+iz) - ln(1-iz))/(2i)\n  vec2 i = c_i();\n  vec2 one = c_one();\n  vec2 two = one + one;\n  if (c == i) {\n    return vec2(0., 1./1e-10);\n  } else if (c == -i) {\n    return vec2(0., -1./1e-10);\n  }\n\n  return c_div(\n    c_ln(one + c_mul(i, c)) - c_ln(one - c_mul(i, c)),\n    c_mul(two, i)\n  );\n}\n\nvec2 c_asin(vec2 c) {\n // formula: arcsin(z) = -i ln(sqrt(1-z^2) + iz)\n  vec2 i = c_i(); vec2 one = c_one();\n  return c_mul(-i, c_ln(\n    c_sqrt(c_one() - c_mul(c, c)) + c_mul(i, c)\n  ));\n}\n\nvec2 c_acos(vec2 c) {\n  // formula: arccos(z) = -i ln(i sqrt(1-z^2) + z)\n  vec2 i = c_i();\n\n  return c_mul(-i, c_ln(\n    c_mul(i, c_sqrt(c_one() - c_mul(c, c))) + c\n  ));\n}\n\nvec2 c_sinh(vec2 c) {\n  return vec2(sinh(c.x) * cos(c.y), cosh(c.x) * sin(c.y));\n}\n\nvec2 c_cosh(vec2 c) {\n  return vec2(cosh(c.x) * cos(c.y), sinh(c.x) * sin(c.y));\n}\n\nvec2 c_tanh(vec2 c) {\n  vec2 c2 = 2. * c;\n  return vec2(sinh(c2.x), sin(c2.y))/(cosh(c2.x) + cos(c2.y));\n}\n\nvec2 c_asinh(vec2 c) {\n  // formula: arcsinh(z) = ln(z + sqrt(1+z^2))\n  vec2 one = c_one();\n  return c_ln(c + c_sqrt(one + c_mul(c, c)));\n}\n\nvec2 c_acosh(vec2 c) {\n  // formula: arccosh(z) = 2 ln(sqrt((z+1)/2) + sqrt((z-1)/2))\n  vec2 one = c_one();\n  vec2 two = one + one;\n  return c_mul(two,\n      c_ln(\n        c_sqrt(c_div((c + one), two)) + c_sqrt(c_div((c - one), two))\n      ));\n}\n\nvec2 c_atanh(vec2 c) {\n  // formula: arctanh(z) = (ln(1+z) - ln(1-z))/2\n  vec2 one = c_one();\n  vec2 two = one + one;\n  if (c == one) {\n      return vec2(1./1e-10, vec2(0.));\n  } else if (c == -one) {\n      return vec2(-1./1e-10, vec2(0.));\n  }\n  return c_div(c_ln(one + c) - c_ln(one - c), two);\n}\n\n// Attempts to identify the gaussian integer whose product with `modulus`\n// is closest to `c`\nvec2 c_rem(vec2 c, vec2 modulus) {\n  vec2 c0 = c_div(c, modulus);\n  // This is the gaussian integer corresponding to the true ratio\n  // rounded towards zero.\n  vec2 c1 = vec2(c0.x - mod(c0.x, 1.), c0.y - mod(c0.y, 1.));\n  return c - c_mul(modulus, c1);\n}\n\nvec2 c_inv(vec2 c) {\n  float norm = length(c);\n\treturn vec2(c.x, -c.y) / (norm * norm);\n}\n"},bd95:function(e,n,t){t("d3b7"),e.exports=o;var r="oyOHfaO0Xhi6nqwntte71KmwsEQbCmCG";function o(e){return"undefined"===typeof SC?new Promise((function(e,n){var t=document.createElement("script");t.setAttribute("src","//connect.soundcloud.com/sdk.js"),t.onload=e,t.onerror=n,document.head.appendChild(t)})).then((function(){return o(e)})):new Promise((function(n,t){SC.initialize({client_id:r}),SC.get("/resolve",{url:e},(function(e){if(e.errors){for(var o="",c=0;c<e.errors.length;c++)o+=e.errors[c].error_message+".";o+="Make sure the URL has the correct format: https://soundcloud.com/user/title-of-the-track",t(o)}else{var i;if("playlist"===e.kind){var a=0;i=e.tracks[a].stream_url+"?client_id="+r}else i=e.stream_url+"?client_id="+r;n(i)}}))}))}},ca6b:function(e,n,t){t("d3b7"),t("5cc6"),t("907a"),t("9a8c"),t("a975"),t("735e"),t("c1ac"),t("d139"),t("3a7b"),t("d5d6"),t("82f8"),t("e91f"),t("60bd"),t("5f96"),t("3280"),t("3fcc"),t("ca91"),t("25a1"),t("cd26"),t("3c5d"),t("2954"),t("649e"),t("219c"),t("170b"),t("b39a"),t("72f7"),t("dca8"),t("ac1f"),t("466d"),t("d9e2");var r=t("15da"),o=t("bd95"),c=t("7c6e");function i(e,n,t){var i,u,s,l,f,d=1024,v="iChannel"+t,m=v+"Res",p=new Uint8Array(d),h=4,g=512,_=Object.freeze({kind:"audio",unit:t,load:b,dispose:T,render:C,initPlayer:w});return _;function b(){if(r(e))return o(e).then((function(e){return f=e})).then((function(){if(c.hideUI){var e=a();return w(e)}}));if(e.match(/\.mp3$/)){f=e;var n=a();return Promise.resolve(w(n))}throw new Error("non soundcloud files are not supported yet.")}function w(e){u=e,u.crossOrigin="anonymous",u.autoplay=!0;var t=new(window.AudioContext||window.webkitAudioContext);s=t.createAnalyser(),s.fftSize=d;var r=t.createMediaElementSource(u);r.connect(s),s.connect(t.destination),l=new Uint8Array(g*h*4),i=E(n.LINEAR,l,g,h),u.setAttribute("src",f),u.play(),u.removeEventListener("ended",x),u.addEventListener("ended",x),u.removeEventListener("play",y),u.addEventListener("play",y),u.removeEventListener("pause",x),u.addEventListener("pause",x)}function E(e,t,r,o){var c=n.createTexture();return n.bindTexture(n.TEXTURE_2D,c),n.texParameteri(n.TEXTURE_2D,n.TEXTURE_WRAP_S,n.CLAMP_TO_EDGE),n.texParameteri(n.TEXTURE_2D,n.TEXTURE_WRAP_T,n.CLAMP_TO_EDGE),n.texParameteri(n.TEXTURE_2D,n.TEXTURE_MIN_FILTER,e),n.texParameteri(n.TEXTURE_2D,n.TEXTURE_MAG_FILTER,e),t instanceof Uint8Array&&n.texImage2D(n.TEXTURE_2D,0,n.RGBA,r,o,0,n.RGBA,n.UNSIGNED_BYTE,t),c}function x(){}function y(){}function T(){i&&(n.deleteTexture(i),i=null)}function C(e,r){if(i){s.getByteFrequencyData(p);for(var o=d/2,c=r%2*o,a=(r+1)%2*o,f=0;f<o;++f){var _=4*(f+a),b=4*(f+c),w=p[f],E=l[b+1],x=l[b+2];l[_]=w,l[_+1]=.5*E+.5*w,l[_+2]=.9*x+.1*w}var y=c+2*o,T=a+2*o;for(f=0;f<o;f+=2){var C=(p[f]+p[f+1])/2,R=4*(f/2+T),A=4*(f/2+y),P=l[A+1],S=l[A+2];l[R]=C,l[R+1]=.5*(P+C),l[R+2]=.9*S+.1*C}var L=o/2;for(f=0;f<o-2;f+=2){C=.5*(l[4*(f+T)]+l[4*(f+T+1)]),R=4*(L+f/2+T),A=4*(L+f/2+y),P=l[A+1],S=l[A+2];l[R]=C,l[R+1]=.5*(P+C),l[R+2]=.9*S+.1*C}n.activeTexture(n.TEXTURE0+t),n.bindTexture(n.TEXTURE_2D,i),n.texImage2D(n.TEXTURE_2D,0,n.RGBA,g,h,0,n.RGBA,n.UNSIGNED_BYTE,l),n.uniform1i(e[v],t),n.uniform2f(e[m],u.currentTime,u.duration)}}}function a(){var e=document.querySelector("audio");return e||(e=document.createElement("audio"),e.preload=!0,e.autobuffer=!0,e.constrols="",e.style.visibility="hidden",document.body.appendChild(e),e)}e.exports=i},e503:function(e,n,t){t("4ec9"),t("d3b7"),t("3ca3"),t("ddb0"),t("498a");var r=new Map,o=t("4020");e.exports=function(e){if(!e)return Promise.reject("Missing link");var n=e.trim();if(!n)return Promise.reject("Missing link");var t=r.get(n);return t?Promise.resolve(t):o(e).then((function(n){return r.set(e,n),n}))}},f5ef:function(e,n,t){var r=t("00c7");e.exports=r({})}});
//# sourceMappingURL=app.a9066da1.js.map