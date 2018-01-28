module.exports = generateRandomScene;

var singleArgument = [
  '', '', '',
  'c_tan',
  'c_sin',
  'c_cos', 'c_tan', 'c_atan', 'c_conj', 'c_exp', 'c_sqrt', 'c_asin', 'c_acos'
];

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
  var pointRotationProb = 0.02;
  var argRotationProb = .9;

  if (!prob(rotationProbability)) return;

  var frameRate = 600;
  var frameDef = `  float frames = ${frameRate}.;
  float a = 3.14* 2. * mod(iFrame, frames)/frames;
`;

  if (prob(pointRotationProb)) {
    frameDef += `  p = vec2(p.x*cos(a) - p.y * sin(a), p.y*cos(a) + p.x * sin(a));`
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
  var pArg = applyArgument(randomPicker(pArgFunctions), 'p');
  var combiner = randomPicker(dualArgs);
  var lines = [
'vec4 get_color(vec2 p) {',
'  vec2 z = vec2(0.); float t;'
  ]
  var rotation = getRotation();
  if (rotation) {
    lines.push(rotation.frameDef);
    firstArg = rotation.rotateZ(firstArg);
    secondArg = rotation.rotateZ(secondArg);
  }

  var zLine = combiner(firstArg, secondArg);

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
  return length(${lLine}) * vec4(${selectedColor}, 1.0);
}`);
  return lines.join('\n');
}