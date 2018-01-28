# Pixel Play

This website allows you to play with pixels on the screen using WebGL.
You write just one function: `f(coordinate) => color` and it renders
the scene. You can pan and zoom on the scene, similar to Google Maps:

![demo](https://github.com/anvaka/pplay/wiki/images/panzoom-fractal.gif)

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