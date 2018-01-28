# Pixel Play

This website allows you to play with pixels on the screen using WebGL.
You write just one function: `f(coordinate) => color` and it renders
the scene. You can pan and zoom on the scene, similar to Google Maps:

[![demo](https://github.com/anvaka/pplay/wiki/images/panzoom-fractal.gif)](https://anvaka.github.io/pplay/?tx=-0.8535190710676193&ty=-1.0798801998311962&scale=2.8714300654759977&fc=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20float%20t%20%3D%200.%3B%0A%20%20vec2%20z%20%3D%20p%3B%0A%20%20vec2%20c%20%3D%20vec2%280.30379%2C%200.33834%29%3B%0A%20%20float%20frames%20%3D%20600.%3B%0A%20%20float%20a%20%3D%203.14*%202.*0.1%3B%2F%2F%20*%20bease%28mod%28iFrame%2C%20frames%29%2Fframes%29%3B%0A%20%20c%20%3D%20vec2%28p.x*cos%28a%29%20-%20p.y%20*%20sin%28a%29%2C%20p.y*cos%28a%29%20%2B%20p.x%20*%20sin%28a%29%29%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20c_sqrt%28c%29%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28c_tan%28z%29%29%20*%20vec4%28t%20*%20vec3%281.%2F64.%2C%201.%2F32.%2C%201.%2F24.%29%2C%201.0%29%3B%0A%7D&code=vec4%20get_color%28vec2%20p%29%20%7B%0A%20%20float%20t%20%3D%200.%3B%0A%20%20vec2%20z%20%3D%20p%3B%0A%20%20vec2%20c%20%3D%20vec2%280.30379%2C%200.33834%29%3B%0A%20%20float%20frames%20%3D%20600.%3B%0A%20%20float%20a%20%3D%203.14*%202.*0.1%3B%2F%2F%20*%20bease%28mod%28iFrame%2C%20frames%29%2Fframes%29%3B%0A%20%20c%20%3D%20vec2%28p.x*cos%28a%29%20-%20p.y%20*%20sin%28a%29%2C%20p.y*cos%28a%29%20%2B%20p.x%20*%20sin%28a%29%29%3B%0A%0A%20%20for%28int%20i%20%3D%200%3B%20i%20%3C%2032%3B%20%2B%2Bi%29%20%7B%0A%20%20%20%20if%20%28length%28z%29%20%3E%202.%29%20break%3B%0A%20%20%20%20z%20%3D%20c_mul%28z%2C%20z%29%20%2B%20c_sqrt%28c%29%3B%0A%20%20%20%20t%20%3D%20float%28i%29%3B%0A%20%20%7D%0A%0A%20%20return%20length%28c_tan%28z%29%29%20*%20vec4%28t%20*%20vec3%281.%2F64.%2C%201.%2F32.%2C%201.%2F24.%29%2C%201.0%29%3B%0A%7D)

Once you like what you've created - you can simply copy the link and
share it with the world (e.g. [/r/pplay](https://www.reddit.com/r/pplay/)).

# Example

# Extended functionality

Pixel play comes with small library of functions and variables.

## External variables

Variables are modeled after shadertoy.com conventions:

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

Each complex number here is 2d vector (`vec2` type). Standard multiplication/division rules cannot
be applied to complex numbers, so we have a helper function: `c_mul(z1, z2)` and `c_div(z0, z1)` 
multiplies and divides two complex numbers.

Other trigonometry functions available with prefix `c_`. (e.g. `c_sin(z)`, `c_cos(z)`, `c_tanh(z)`, and so on).

You can find list of all available functions [here](https://github.com/anvaka/pplay/blob/master/src/util/shaders/complex.glsl).


## Easing

For animation convenience I've added cubic Bezier easing function, modelled after `cubic-bezier` CSS
property. 


## Local build

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8889
npm start
```