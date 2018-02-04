# Pixel Play

This website allows you to play with pixels on the screen using WebGL.
All you need to do is fill in a function that takes a point and returns its color:

`f(coordinate) => color` 

You can immediately see the scene, pan and zoom around (as if it was Google Maps):

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
often produces very different and beautiful fractals.

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

# Query string limit

By default your code is saved in the query string. However, if it exceeds `1,000` characters
it cannot be saved (as browsers do not support long query strings). This shouldn't be a problem if you 
don't want to share your code.

But if you want to share what you've created you will need to save your code with `.glsl` extension
on https://gist.github.com/ and then update the query string of the PixelPlay:

1. Delete `fc` query argument (if present)
2. Add `gist=gistId`

When you save a gist it will give you the url like this: https://gist.github.com/anvaka/0f11251039eb366630bc7ca08ce0eefd 
- those numbers are your `gistId`. The final url will look like this: 

[https://anvaka.github.io/pplay/?gist=**0f11251039eb366630bc7ca08ce0eefd**&tx=0.284&ty=0.284&scale=0.471](https://anvaka.github.io/pplay/?gist=0f11251039eb366630bc7ca08ce0eefd&tx=0.284&ty=0.284&scale=0.471)

# Audio channel

It is possible to make audio channel accessible to a shader. I'm still not sure what is the best way to model
this (your suggestions are appreciated!), but here is how it is constructed now.

Each of the `512` columns in the texture row represent a frequency, encoded in `rgba` format:

* `r` - immediate frequency value
* `g` - average frequency value (calculated as `g = prev_g * 0.5 + r * 0.5`)
* `b` - "long" average frequency value (calculated as `b = 0.9 * prev_b + r * 0.1`)
* `a` - is not used at the moment.

Immediate value is usually very "spiky", while `b` is smoothed out.

First two rows of the texture alternate between current and previous rendering frame. On odd frame number
row `0` represent current audio buffer, and `1` is previous buffer. On even frame number this is inverse (
current audio signal will be in the row `1`, while previous signal is in the row `0`). This alternation is
done to preserve CPU cycles and not move data unnecessarily. 

Rows `3` and `4` are also alternating between current and previous frame, but they serve as aggregation
mechanism:

* Columns `0 .. 255` store average value of frequency pairs. I.e. `column(i) = (freq[i] + freq[i + 1])/2`
* Columns `256 .. 383` store average value of average pairs in the first `256` columns. I.e.
`column(256 + i/2) = column(i) + column(i + 1) `
* .. and so on ..

For example, consider the following row of original frequencies:

```
Original row:    2    2    1    3    4    6    1    3
 Aggregation:       2         2         5         2
```

As you can see, we only need four elements to store aggregated pairs of the first row, so, let's use remaining
columns in the aggregation row, to aggregate aggregations:

```
       Aggregation:      2         2         5         2
Aggregation (cont):            2                 3.5
Aggregation (cont):                  2.75
```

Or, if we flatten aggregation row out:

```
Original row:    2    2    1    3    4    6    1    3
 Aggregation:    2    2    5    2    2   3.5  2.75 nil
```

This aggregation row is created to avoid summation and cycles in the shader. If you need to know average volume
of the sound, you can just look at second to the last value, you don't need to 

```
(2 + 2 + 1 + 3 + 4 + 6 + 1 + 3)/8 = 2.75
```

You just look at the second to the last column in the aggregation row. Here is a snippet to fetch audio frequency
at a given column/row:

``` glsl
vec4 getBandValue(float bandId, float row) {
  // assuming sound is bound to `iChannel0`
  return texture2D(iChannel0, vec2((bandId + 0.5)/512., (row + 0.5)/4.));
}
// then you can use it like so:

// This takes current frequency value in bin 42.
vec4 imm = getBandValue(42., mod(iFrame + 1., 2.));
// This takes previous frame frequency value in bin 42.
vec4 imm_prev = getBandValue(42., mod(iFrame, 2.));

// To get average volume of the current frame:
vec4 avg_Volume = getBandValue(510., mod(iFrame + 1., 2.) + 2.);

// To get average aggregated low frequency of the current frame (bass)
// 498. = 512. - 2. - 4. - 8.
vec4 avg_bass = getBandValue(498., mod(iFrame + 1., 2.) + 2.);
```

Here is an example of the three histograms:

[![histogram](https://github.com/anvaka/pplay/wiki/images/histogram.png)](https://anvaka.github.io/pplay/?tx=0.33865800703733256&ty=0.7389200405624718&scale=0.0015274641589542984&fc=vec4%20getBandValue%28float%20bandId%2C%20float%20row%29%20%7B%0A%20%20return%20texture2D%28iChannel0%2C%20vec2%28%28bandId%20%2B%200.5%29%2F512.%2C%20%28row%20%2B%200.5%29%2F4.%29%29%3B%0A%7D%0A%0Afloat%20sdRect%28vec2%20uv%2C%20vec2%20tl%2C%20vec2%20br%29%20%7B%0A%20%20%20%20vec2%20d%20%3D%20max%28tl-uv%2C%20uv-br%29%3B%0A%20%20%20%20return%20length%28max%28vec2%280.0%29%2C%20d%29%29%20%2B%20min%280.0%2C%20max%28d.x%2C%20d.y%29%29%3B%0A%7D%0A%0Afloat%20getHisto%28vec2%20p%2C%20float%20x%2C%20vec4%20imm%29%20%7B%0A%20%20float%20h1%20%3D%201.-sdRect%28p%2C%20vec2%28x%2C%200.%29%2C%20vec2%28x%2C%20256.*imm.r%29%29%3B%0A%20%20float%20h2%20%3D%201.-sdRect%28p%2C%20vec2%28x%2C%20280.%29%2C%20vec2%28x%2C%20280.%2B%20256.*imm.g%29%29%3B%0A%20%20float%20h3%20%3D%201.-sdRect%28p%2C%20vec2%28x%2C%20280.*2.%29%2C%20vec2%28x%2C%20280.*2.%2B%20256.*imm.b%29%29%3B%0A%20%20return%20h1%20*%20h2%20*%20h3%3B%0A%7D%0A%0Avec4%20get_color%28vec2%20p%29%20%7B%0A%20%20if%20%28p.x%20%3C%200.%20%7C%7C%20p.x%20%3E%202.*512.%29%20return%20vec4%280.%29%3B%0A%20%20float%20x%20%3D%20fract%28p.x%2F512.%29%20*%20512.%3B%0A%20%20vec4%20imm%20%3D%20getBandValue%28x%2C%20mod%28iFrame%20%2B%201.%2C%202.%29%29%3B%0A%20%20vec4%20agg%20%3D%20getBandValue%28x%2C%20mod%28iFrame%20%2B%201.%2C%202.%29%20%2B%202.%29%3B%0A%20%20%0A%20%20float%20h%20%3D%201.-getHisto%28vec2%28p.x%2C%20p.y%29%2C%20x%2C%20imm%29%20*%0A%20%20%20%20getHisto%28vec2%28p.x%2C%20p.y%29%2C%20x%20%2B%20512.%2C%20agg%29%3B%0A%0A%20%20return%20vec4%28h%2C%20h%2C%20h%2C%201.%29%3B%0A%7D&i0=https%3A%2F%2Fsoundcloud.com%2Ftomday%2Ftom-day-who-we-want-to-be)

* The first row is a smoothed, long average (`b` component).
* The second row is an average value (`g` component);
* The last row is immediate value (`r` component)

From left to right the histograms represent average value of the previous histogram:

```
original <- avg <- avg of avg <- avg of avg of avg ...
```

If you are using a desktop computer, you can click on the image above to open it and
see interactive play. Why desktop? Because of the following caveat:

## Caveat

Keep in mind, that Apple does not support audio element analysis in iOS. 

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