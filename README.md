# Pixel Play

This website allows you to play with pixels on the screen using WebGL.
You write just one function: `f(coordinate) => color` and it renders
the scene. You can pan and zoom on the scene, similar to Google Maps:

[![demo](https://github.com/anvaka/pplay/wiki/images/panzoom-fractal.gif)](https://anvaka.github.io/pplay/?tx=-0.8535190710676193&ty=-1.0798801998311962&scale=2.8714300654759977&fc=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20float%20t%20%3D%200.%3B%0A%20%20vec2%20z%20%3D%20p%3B%0A%20%20vec2%20c%20%3D%20vec2%280.30379%2C%200.33834%29%3B%0A%20%20float%20frames%20%3D%20600.%3B%0A%20%20float%20a%20%3D%203.14*%202.*0.1%3B%2F%2F%20*%20bease%28mod%28iFrame%2C%20frames%29%2Fframes%29%3B%0A%20%20c%20%3D%20vec2%28p.x*cos%28a%29%20-%20p.y%20*%20sin%28a%29%2C%20p.y*cos%28a%29%20%2B%20p.x%20*%20sin%28a%29%29%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20c_sqrt%28c%29%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28c_tan%28z%29%29%20*%20vec4%28t%20*%20vec3%281.%2F64.%2C%201.%2F32.%2C%201.%2F24.%29%2C%201.0%29%3B%0A%7D&code=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20float%20t%20%3D%200.%3B%0A%20%20vec2%20z%20%3D%20p%3B%0A%20%20vec2%20c%20%3D%20vec2%280.30379%2C%200.33834%29%3B%0A%20%20float%20frames%20%3D%20600.%3B%0A%20%20float%20a%20%3D%203.14*%202.*0.1%3B%2F%2F%20*%20bease%28mod%28iFrame%2C%20frames%29%2Fframes%29%3B%0A%20%20c%20%3D%20vec2%28p.x*cos%28a%29%20-%20p.y%20*%20sin%28a%29%2C%20p.y*cos%28a%29%20%2B%20p.x%20*%20sin%28a%29%29%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20c_sqrt%28c%29%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28c_tan%28z%29%29%20*%20vec4%28t%20*%20vec3%281.%2F64.%2C%201.%2F32.%2C%201.%2F24.%29%2C%201.0%29%3B%0A%7D)

Once you like what you've created - you can simply copy the link and
share it with the world (e.g. [/r/pplay](https://www.reddit.com/r/pplay/)).

# Example

If you click "Randomize" button, the website will generate a fractal.

![randomize demo](https://github.com/anvaka/pplay/wiki/images/randomize-demo.gif)

It is very easy to generate a fractal with just couple lines. All you need to do
is update a sum inside the loop.

``` glsl
vec4 get_color(vec2 p) {
  float t = 0.;
  vec2 z = vec2(0.);
  vec2 c = p;

  for(int i = 0; i < 32; ++i) {
    if (length(z) > 2.) break;
    // Change this line to get a new fractal
    z = c_mul(z, z) + c;
    t = float(i);
  }

  return length((z)) * vec4(t * vec3(1./64., 1./32., 1./24.), 1.0);
}
```

Changing initial condition (variable `c`) or the final color code (where we return `vec4`)
often yields very different and beautiful fractals.

Here are just a few examples. Click on any image above to explore fractal and try to find
any difference between code - it is going to be very small.

[![zz](https://github.com/anvaka/pplay/wiki/images/zz.png)](https://anvaka.github.io/pplay/?tx=0&ty=0&scale=1&fc=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20vec2%20z%20%3D%20vec2%280.%29%3B%20float%20t%20%3D%200.%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20%2F%2F%20main%20fractal%20loop.%20Change%20it%3A%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20p%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28z%29%20*%20vec4%28t%2F64.%2C%20t%2F32.%2C%20t%2F24.%2C%201.0%29%3B%0A%7D&code=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20vec2%20z%20%3D%20vec2%280.%29%3B%20float%20t%20%3D%200.%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20%2F%2F%20main%20fractal%20loop.%20Change%20it%3A%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20p%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28tanh%28z%29%29%20*%20vec4%28t%2F64.%2C%20t%2F32.%2C%20t%2F24.%2C%201.0%29%3B%0A%7D)
[![zz_tanh](https://github.com/anvaka/pplay/wiki/images/zz_tan.png)](https://anvaka.github.io/pplay/?tx=0&ty=0&scale=1&fc=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20vec2%20z%20%3D%20vec2%280.%29%3B%20float%20t%20%3D%200.%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20%2F%2F%20main%20fractal%20loop.%20Change%20it%3A%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20p%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28c_tanh%28z%29%29%20*%20vec4%28t%2F64.%2C%20t%2F32.%2C%20t%2F24.%2C%201.0%29%3B%0A%7D&code=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20vec2%20z%20%3D%20vec2%280.%29%3B%20float%20t%20%3D%200.%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20%2F%2F%20main%20fractal%20loop.%20Change%20it%3A%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20p%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28tanh%28z%29%29%20*%20vec4%28t%2F64.%2C%20t%2F32.%2C%20t%2F24.%2C%201.0%29%3B%0A%7D)
[![zz_p_mul](https://github.com/anvaka/pplay/wiki/images/zz_p_mul.png)](https://anvaka.github.io/pplay/?tx=0&ty=0&scale=1&fc=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20vec2%20z%20%3D%20vec2%280.%29%3B%20float%20t%20%3D%200.%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20%2F%2F%20main%20fractal%20loop.%20Change%20it%3A%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20c_mul%28p%2C%20p%29%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28z%29%20*%20vec4%28t%2F64.%2C%20t%2F32.%2C%20t%2F24.%2C%201.0%29%3B%0A%7D&code=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20vec2%20z%20%3D%20vec2%280.%29%3B%20float%20t%20%3D%200.%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20%2F%2F%20main%20fractal%20loop.%20Change%20it%3A%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20c_mul%28p%2C%20p%29%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28%28z%29%29%20*%20vec4%28t%2F64.%2C%20t%2F32.%2C%20t%2F24.%2C%201.0%29%3B%0A%7D)
[![zz_inv_sin](https://github.com/anvaka/pplay/wiki/images/zz_inv_sin.png)](https://anvaka.github.io/pplay/?tx=0.30868306209760044&ty=0.34084580370748535&scale=0.35196627769233657&fc=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20vec2%20z%20%3D%20vec2%280.%29%3B%20float%20t%20%3D%200.%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20%2F%2F%20main%20fractal%20loop.%20Change%20it%3A%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20c_inv%28p%29%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28c_sin%28z%29%29%20*%20vec4%28t%2F64.%2C%20t%2F32.%2C%20t%2F24.%2C%201.0%29%3B%0A%7D&code=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20vec2%20z%20%3D%20vec2%280.%29%3B%20float%20t%20%3D%200.%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20%2F%2F%20main%20fractal%20loop.%20Change%20it%3A%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20c_inv%28p%29%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28c_sin%28z%29%29%20*%20vec4%28t%2F64.%2C%20t%2F32.%2C%20t%2F24.%2C%201.0%29%3B%0A%7D)


## Not only fractals

To be honest, this is a very generic tool. All it does is that one function. Take a coordinate of a point,
and output a color.

Coordinate of a point is given by variable `vec2 p`, so you can get `p.x`, and `p.y`.

The color is returned from the main function `return vec4(r, g, b, a)` - each component of this vector corresponds
to color, and ranges between `0` and `1`. 

Given this information, we can change the output to anything we want:

[![live edit](https://github.com/anvaka/pplay/wiki/images/editing-shader.gif)](https://anvaka.github.io/pplay/?tx=0.6891274578933951&ty=0.4525028178934065&scale=0.07161783487552006&fc=vec4%20get_color%28vec2%20p%29%20%7B%0A%0A%20%20return%20sin%28p.x%29*cos%28p.y%29%20*%20%0A%2F%2F%20%20%20%20sin%28iFrame%20*%200.05%29*%0A%20%20%20%20vec4%280.1%2C%200.2%2C%200.4%2C%201.%29%3B%0A%7D&code=vec4%20get_color%28vec2%20p%29%20%7B%0A%0A%20%20return%20sin%28p.x%29*cos%28p.y%29%20*%20%0A%2F%2F%20%20%20%20sin%28iFrame%20*%200.05%29*%0A%20%20%20%20vec4%280.1%2C%200.2%2C%200.4%2C%201.%29%3B%0A%7D)

Here we first set color to a blue-ish color `vec4(0.1, 0.2, 0.4, 1.)`, and then mixed it with coordinates of a point.

I have also used a special variable called `iFrame` - it is always equal to the current frame number (increases
with time). So we can use a periodic function like `sin` to get animation. You can find more special variables below

# Extended functionality

Pixel play comes with small library of functions and variables.

## External variables

Variables are modeled after shadertoy.com conventions and are available for you to use in your code:

``` glsl
// Current frame number, counted from launch of the program
uniform float iFrame;

// How many seconds passed since program launch
uniform float iTime;

// Mouse (or touch) coordinates. `.xy` - current, `.zw` - last clicked.
// Note: To translate coordinates to scene coordinates use 
// screen2scene(iMouse.xy) -> vec2 method.
uniform vec4 iMouse;

// screen resolution
uniform vec2 iResolution;
```

## Complex numbers math

Each complex number is a 2d vector (`vec2` type). Standard GLSL multiplication/division rules cannot
be applied to complex numbers, so we have a helper function: `c_mul(z1, z2)` and `c_div(z0, z1)` 
multiplies and divides two complex numbers.

Other trigonometric functions are available with prefix `c_`. (e.g. `c_sin(z)`, `c_cos(z)`, `c_tanh(z)`, and so on).

You can find the list of them all [here](https://github.com/anvaka/pplay/blob/master/src/util/shaders/complex.glsl).

# Thanks

Thank you for reading this!

I hope you find this project useful and fun to play with. Please don't forget to share what you find or learn.

## Local build

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8889
npm start
```


# License
MIT