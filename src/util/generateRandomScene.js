module.exports = generateRandomScene;

var singleArgument = [
  '', '', '', '', '', '',
  'c_sin',
  'c_cos',
];

// Tested on my old mobile device, it doesn't like some functions.
// So, going to limit generator:
var likelySlowDevice = window.innerWidth * window.innerHeight < 350 * 600;

if (!likelySlowDevice) {
  singleArgument = singleArgument.concat(['c_tan', 'c_tan', 'c_atan', 'c_conj', 'c_exp'])
}

var pArgFunctions = [
  '', '', '',
  'c_sin', 'c_ln', 'c_sqrt'
];

var length_func = [
  '', '', '', '', '', '', '', '',
  'c_tan', 'c_atan', 'c_tanh',
  'c_sin', 'c_asin', 'c_sinh',
  'c_exp', 'c_ln'
]
//'c_ln''c_inv', 'c_sinh', 'c_tanh', 'c_asinh', 'c_acosh'

var dualArgs = [
  function mul(a, b) { return `c_mul(${a}, ${b})`}
];

function randomPicker(arr) {
  if (arr.length === 1) return arr[0];

  var index = Math.round(Math.random() * arr.length);
  if (index > arr.length - 1) index = arr.length - 1;

  return arr[index];
}

function applyArgument(func, arg) {
  return func ? `${func}(${arg})` : arg;
}

function random() { return Math.random(); }
function prob(p) { return random() < p; }

function getRotation() {
  var rotationProbability = 0.5;
  var pointRotationProb = 0.5;
  var argRotationProb = .9;

  if (!prob(rotationProbability)) return;

  var frameRate = 600;
  var frameDef = `  float frames = ${frameRate}.;
  float a = 3.14* 2. * bease(mod(iFrame, frames)/frames);
`;

  if (prob(pointRotationProb)) {
    frameDef += `  c = vec2(p.x*cos(a) - p.y * sin(a), p.y*cos(a) + p.x * sin(a));`
    argRotationProb = 0.2
  }

  return {
    frameDef,
    rotateZ(arg) {
      if (prob(argRotationProb)) {
        argRotationProb = 0.1;
        var suffix = prob(0.8) ? 'sin(a)' : 'a';
        return `${arg} * ${suffix}`;
      }
      return arg;
    }
  }
}

function generateRandomScene() {
  var firstArg = applyArgument(randomPicker(singleArgument), 'z');
  var secondArg = applyArgument(randomPicker(singleArgument), 'z');
  var pArg = applyArgument(randomPicker(pArgFunctions), 'c');
  var combiner = randomPicker(dualArgs);
  var lines = [
'vec4 get_color(vec2 p) {',
'  float t = 0.;'
  ]
  var invertZ = prob(0.2);
  if(prob(0.4)) {
    lines.push(`  vec2 z = p;`);
    lines.push(`  vec2 c = vec2(${(random()).toFixed(5)}, ${random().toFixed(5)});`)
  } else {
    if (invertZ) {
      // some video cards don't like to invert 0.
      lines.push(`  vec2 z = vec2(1.);`);
    } else {
      lines.push(`  vec2 z = vec2(0.);`);
    }
    lines.push(`  vec2 c = p;`);
  }
  var rotation = getRotation();
  if (rotation) {
    lines.push(rotation.frameDef);
    firstArg = rotation.rotateZ(firstArg);
    secondArg = rotation.rotateZ(secondArg);
  }

  var zLine = combiner(firstArg, secondArg);
  if (invertZ && canInv(zLine)) zLine = `c_inv(${zLine})`;
  if (prob(0.1)) pArg = `c_inv(${pArg})`;

  lines.push(`
  for(int i = 0; i < 32; ++i) {
    if (length(z) > 2.) break;
    z = ${zLine} + ${pArg};
    t = float(i);
  }`);
  var lLine =  applyArgument(randomPicker(length_func), 'z');
  var colors = [
    't * vec3(1./64., 1./32., 1./24.)',
    't * vec3(1./64., 1./32., 1./16.)',
    // 't * vec3(1./14., 1./42., 1./22.)',
    // 't * vec3(1./32., 1./64., 1./24.)',
    // 't * vec3(1./32., 1./48., 1./24.)'
  ];
  var selectedColor = randomPicker(colors);

lines.push(`
  return vec4(length(${lLine}) * ${selectedColor}, 1.0);
}`);
  return lines.join('\n');
}

function canInv(zLine) {
  // For some reason these function are not working well with c_inv
  return zLine.indexOf('tan') === -1 &&
        zLine.indexOf('sin') === -1;
}