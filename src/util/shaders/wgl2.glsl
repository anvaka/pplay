import {
// Converts a quantity specified in degrees into radians. The return value is `π  * degrees / 180`
float radians(float degrees);

// Converts a quantity specified in degrees into radians. The return value is `π  * degrees / 180`
vec2 radians(vec2 degrees);

// Converts a quantity specified in degrees into radians. The return value is `π  * degrees / 180`
vec3 radians(vec3 degrees);

// Converts a quantity specified in degrees into radians. The return value is `π  * degrees / 180`
vec4 radians(vec4 degrees);

// Converts a quantity specified in radians into degrees. The return value is `180 * radians / π`
float degrees(float radians);

// Converts a quantity specified in radians into degrees. The return value is `180 * radians / π`
vec2 degrees(vec2 radians);

// Converts a quantity specified in radians into degrees. The return value is `180 * radians / π`
vec3 degrees(vec3 radians);

// Converts a quantity specified in radians into degrees. The return value is `180 * radians / π`
vec4 degrees(vec4 radians);

// `sin` returns the trigonometric sine of `angle`.
float sin(float angle);

// `sin` returns the trigonometric sine of `angle`.
vec2 sin(vec2 angle);

// `sin` returns the trigonometric sine of `angle`.
vec3 sin(vec3 angle);

// `sin` returns the trigonometric sine of `angle`.
vec4 sin(vec4 angle);

// `cos` returns the trigonometric cosine of `angle`.
float cos(float angle);

// `cos` returns the trigonometric cosine of `angle`.
vec2 cos(vec2 angle);

// `cos` returns the trigonometric cosine of `angle`.
vec3 cos(vec3 angle);

// `cos` returns the trigonometric cosine of `angle`.
vec4 cos(vec4 angle);

// `tan` returns the trigonometric tangent of `angle`.
float tan(float angle);

// `tan` returns the trigonometric tangent of `angle`.
vec2 tan(vec2 angle);

// `tan` returns the trigonometric tangent of `angle`.
vec3 tan(vec3 angle);

// `tan` returns the trigonometric tangent of `angle`.
vec4 tan(vec4 angle);

// Returns the arcsine of a parameter. The range of values is -π/2 to π/2.
float asin(float x);

// Returns the arcsine of a parameter. The range of values is -π/2 to π/2.
vec2 asin(vec2 x);

// Returns the arcsine of a parameter. The range of values is -π/2 to π/2.
vec3 asin(vec3 x);

// Returns the arcsine of a parameter. The range of values is -π/2 to π/2.
vec4 asin(vec4 x);

// Returns the arccosine of a parameter. The range of values is 0 to π.
float acos(float x);

// Returns the arccosine of a parameter. The range of values is 0 to π.
vec2 acos(vec2 x);

// Returns the arccosine of a parameter. The range of values is 0 to π.
vec3 acos(vec3 x);

// Returns the arccosine of a parameter. The range of values is 0 to π.
vec4 acos(vec4 x);

// Returns the angle whose trigonometric arctangent is `y/x`.
// The signs of `y` and `x` are used to determine the quadrant that the angle lies in. 
// The value returned by atan in this case is in the range `[-π, π]`. The result is undefined if `x = 0`
float atan(float y, float x);

// Returns the angle whose trigonometric arctangent is `y/x`.
// The signs of `y` and `x` are used to determine the quadrant that the angle lies in. 
// The value returned by atan in this case is in the range `[-π, π]`. The result is undefined if `x = 0`
vec2 atan(vec2 y, vec2 x);

// Returns the angle whose trigonometric arctangent is `y/x`.
// The signs of `y` and `x` are used to determine the quadrant that the angle lies in. 
// The value returned by atan in this case is in the range `[-π, π]`. The result is undefined if `x = 0`
vec3 atan(vec3 y, vec3 x);

// Returns the angle whose trigonometric arctangent is `y/x`.
// The signs of `y` and `x` are used to determine the quadrant that the angle lies in. 
// The value returned by atan in this case is in the range `[-π, π]`. The result is undefined if `x = 0`
vec4 atan(vec4 y, vec4 x);

// Returns the angle whose tangent is `y_over_x`. The range of values is -π/2 to π/2.
float atan(float y_over_x);

// Returns the angle whose tangent is `y_over_x`. The range of values is -π/2 to π/2.
vec2 atan(vec2 y_over_x);

// Returns the angle whose tangent is `y_over_x`. The range of values is -π/2 to π/2.
vec3 atan(vec3 y_over_x);

// Returns the angle whose tangent is `y_over_x`. The range of values is -π/2 to π/2.
vec4 atan(vec4 y_over_x);

// Returns the hyperbolic sine of a parameter. The hyperbolic sine of x is computed as `(exp(x) - exp(-x)) / 2`
float sinh(float x);

// Returns the hyperbolic sine of a parameter. The hyperbolic sine of x is computed as `(exp(x) - exp(-x)) / 2`
vec2 sinh(vec2 x);

// Returns the hyperbolic sine of a parameter. The hyperbolic sine of x is computed as `(exp(x) - exp(-x)) / 2`
vec3 sinh(vec3 x);

// Returns the hyperbolic sine of a parameter. The hyperbolic sine of x is computed as `(exp(x) - exp(-x)) / 2`
vec4 sinh(vec4 x);

// Returns the hyperbolic cosine of a parameter. The hyperbolic cosine of x is computed as `(exp(x) + exp(-x)) / 2`
float cosh(float x);

// Returns the hyperbolic cosine of a parameter. The hyperbolic cosine of x is computed as `(exp(x) + exp(-x)) / 2`
vec2 cosh(vec2 x);

// Returns the hyperbolic cosine of a parameter. The hyperbolic cosine of x is computed as `(exp(x) + exp(-x)) / 2`
vec3 cosh(vec3 x);

// Returns the hyperbolic cosine of a parameter. The hyperbolic cosine of x is computed as `(exp(x) + exp(-x)) / 2`
vec4 cosh(vec4 x);

// Returns the hyperbolic tangent of a parameter. The hyperbolic tangent of x is computed as `sinh(x) / cosh(x)`
float tanh(float x);

// Returns the hyperbolic tangent of a parameter. The hyperbolic tangent of x is computed as `sinh(x) / cosh(x)`
vec2 tanh(vec2 x);

// Returns the hyperbolic tangent of a parameter. The hyperbolic tangent of x is computed as `sinh(x) / cosh(x)`
vec3 tanh(vec3 x);

// Returns the hyperbolic tangent of a parameter. The hyperbolic tangent of x is computed as `sinh(x) / cosh(x)`
vec4 tanh(vec4 x);

// Returns the hyperbolic arcsine of a parameter. The inverse of `sinh`
float asinh(float x);

// Returns the hyperbolic arcsine of a parameter. The inverse of `sinh`
vec2 asinh(vec2 x);

// Returns the hyperbolic arcsine of a parameter. The inverse of `sinh`
vec3 asinh(vec3 x);

// Returns the hyperbolic arcsine of a parameter. The inverse of `sinh`
vec4 asinh(vec4 x);

// Returns the arc hyperbolic cosine of `x`. THe non-negative inverse of `cosh`. The result is undefined if `x < 1`
float acosh(float x);

// Returns the arc hyperbolic cosine of `x`. THe non-negative inverse of `cosh`. The result is undefined if `x < 1`
vec2 acosh(vec2 x);

// Returns the arc hyperbolic cosine of `x`. THe non-negative inverse of `cosh`. The result is undefined if `x < 1`
vec3 acosh(vec3 x);

// Returns the arc hyperbolic cosine of `x`. THe non-negative inverse of `cosh`. The result is undefined if `x < 1`
vec4 acosh(vec4 x);

// Returns the hyperbolic arctangent of `x`. The inverse of `tanh`. The result is undefined if `abs(x) >= 1`
float atanh(float x);

// Returns the hyperbolic arctangent of `x`. The inverse of `tanh`. The result is undefined if `abs(x) >= 1`
vec2 atanh(vec2 x);

// Returns the hyperbolic arctangent of `x`. The inverse of `tanh`. The result is undefined if `abs(x) >= 1`
vec3 atanh(vec3 x);

// Returns the hyperbolic arctangent of `x`. The inverse of `tanh`. The result is undefined if `abs(x) >= 1`
vec4 atanh(vec4 x);

// Returns the value of `x` raised to the `y` power. The result is undefined if `x < 0` or if `x == 0` and `y <= 0`
float pow(float x, float y);

// Returns the value of `x` raised to the `y` power. The result is undefined if `x < 0` or if `x == 0` and `y <= 0`
vec2 pow(vec2 x, vec2 y);

// Returns the value of `x` raised to the `y` power. The result is undefined if `x < 0` or if `x == 0` and `y <= 0`
vec3 pow(vec3 x, vec3 y);

// Returns the value of `x` raised to the `y` power. The result is undefined if `x < 0` or if `x == 0` and `y <= 0`
vec4 pow(vec4 x, vec4 y);

// Returns the value of `e` raised to the power of `x`
float exp(float x);

// Returns the value of `e` raised to the power of `x`
vec2 exp(vec2 x);

// Returns the value of `e` raised to the power of `x`
vec3 exp(vec3 x);

// Returns the value of `e` raised to the power of `x`
vec4 exp(vec4 x);

// Returns the natural logarithm (base `e`) of `x`. I.e. the value `y` which satisfies `x = e^y. The result is undefined if `x <= 0`.
float log(float x);

// Returns the natural logarithm (base `e`) of `x`. I.e. the value `y` which satisfies `x = e^y. The result is undefined if `x <= 0`.
vec2 log(vec2 x);

// Returns the natural logarithm (base `e`) of `x`. I.e. the value `y` which satisfies `x = e^y. The result is undefined if `x <= 0`.
vec3 log(vec3 x);

// Returns the natural logarithm (base `e`) of `x`. I.e. the value `y` which satisfies `x = e^y. The result is undefined if `x <= 0`.
vec4 log(vec4 x);

// Returns 2 raised to the power of `x`. I.e. `2^x`
float exp2(float x);

// Returns 2 raised to the power of `x`. I.e. `2^x`
vec2 exp2(vec2 x);

// Returns 2 raised to the power of `x`. I.e. `2^x`
vec3 exp2(vec3 x);

// Returns 2 raised to the power of `x`. I.e. `2^x`
vec4 exp2(vec4 x);

// Returns the base 2 logarithm of `x`. I.e. the value `y` which satisfies `x = 2^y. The result is undefined if `x <= 0`.
float log2(float x);

// Returns the base 2 logarithm of `x`. I.e. the value `y` which satisfies `x = 2^y. The result is undefined if `x <= 0`.
vec2 log2(vec2 x);

// Returns the base 2 logarithm of `x`. I.e. the value `y` which satisfies `x = 2^y. The result is undefined if `x <= 0`.
vec3 log2(vec3 x);

// Returns the base 2 logarithm of `x`. I.e. the value `y` which satisfies `x = 2^y. The result is undefined if `x <= 0`.
vec4 log2(vec4 x);

// `sqrt` returns the square root of $x$, i.e.
// the value $\sqrt { x }$. The result is undefined if $x < 0$.
float sqrt(float x);

// `sqrt` returns the square root of $x$, i.e.
// the value $\sqrt { x }$. The result is undefined if $x < 0$.
vec2 sqrt(vec2 x);

// `sqrt` returns the square root of $x$, i.e.
// the value $\sqrt { x }$. The result is undefined if $x < 0$.
vec3 sqrt(vec3 x);

// `sqrt` returns the square root of $x$, i.e.
// the value $\sqrt { x }$. The result is undefined if $x < 0$.
vec4 sqrt(vec4 x);

// Returns the inverse square root of `x`. I.e. the value 1/sqrt(x). The result is undefined if `x <= 0`.
float inversesqrt(float x);

// Returns the inverse square root of `x`. I.e. the value 1/sqrt(x). The result is undefined if `x <= 0`.
vec2 inversesqrt(vec2 x);

// Returns the inverse square root of `x`. I.e. the value 1/sqrt(x). The result is undefined if `x <= 0`.
vec3 inversesqrt(vec3 x);

// Returns the inverse square root of `x`. I.e. the value 1/sqrt(x). The result is undefined if `x <= 0`.
vec4 inversesqrt(vec4 x);

// `abs` returns `x` if `x` >= 0, otherwise
// returns -`x`.
float abs(float x);

// `abs` returns `x` if `x` >= 0, otherwise
// returns -`x`.
vec2 abs(vec2 x);

// `abs` returns `x` if `x` >= 0, otherwise
// returns -`x`.
vec3 abs(vec3 x);

// `abs` returns `x` if `x` >= 0, otherwise
// returns -`x`.
vec4 abs(vec4 x);

// `abs` returns `x` if `x` >= 0, otherwise
// returns -`x`.
int abs(int x);

// `abs` returns `x` if `x` >= 0, otherwise
// returns -`x`.
ivec2 abs(ivec2 x);

// `abs` returns `x` if `x` >= 0, otherwise
// returns -`x`.
ivec3 abs(ivec3 x);

// `abs` returns `x` if `x` >= 0, otherwise
// returns -`x`.
ivec4 abs(ivec4 x);

// Returns the sign of `x`. I.e. -1 if `x < 0`, 0 if `x == 0`, 1 if `x > 0`
float sign(float x);

// Returns the sign of `x`. I.e. -1 if `x < 0`, 0 if `x == 0`, 1 if `x > 0`
vec2 sign(vec2 x);

// Returns the sign of `x`. I.e. -1 if `x < 0`, 0 if `x == 0`, 1 if `x > 0`
vec3 sign(vec3 x);

// Returns the sign of `x`. I.e. -1 if `x < 0`, 0 if `x == 0`, 1 if `x > 0`
vec4 sign(vec4 x);

// Returns the sign of `x`. I.e. -1 if `x < 0`, 0 if `x == 0`, 1 if `x > 0`
int sign(int x);

// Returns the sign of `x`. I.e. -1 if `x < 0`, 0 if `x == 0`, 1 if `x > 0`
ivec2 sign(ivec2 x);

// Returns the sign of `x`. I.e. -1 if `x < 0`, 0 if `x == 0`, 1 if `x > 0`
ivec3 sign(ivec3 x);

// Returns the sign of `x`. I.e. -1 if `x < 0`, 0 if `x == 0`, 1 if `x > 0`
ivec4 sign(ivec4 x);

// `floor` returns a value equal to the nearest integer that is less than or equal to `x`.
float floor(float x);

// `floor` returns a value equal to the nearest integer that is less than or equal to `x`.
vec2 floor(vec2 x);

// `floor` returns a value equal to the nearest integer that is less than or equal to `x`.
vec3 floor(vec3 x);

// `floor` returns a value equal to the nearest integer that is less than or equal to `x`.
vec4 floor(vec4 x);

// `trunc` returns a value equal to the nearest integer to `x`
// whose absolute value is not larger than the absolute value of `x`.
float trunc(float x);

// `trunc` returns a value equal to the nearest integer to `x`
// whose absolute value is not larger than the absolute value of `x`.
vec2 trunc(vec2 x);

// `trunc` returns a value equal to the nearest integer to `x`
// whose absolute value is not larger than the absolute value of `x`.
vec3 trunc(vec3 x);

// `trunc` returns a value equal to the nearest integer to `x`
// whose absolute value is not larger than the absolute value of `x`.
vec4 trunc(vec4 x);

// `round` returns a value equal to the nearest integer to `x`.
// The fraction 0.5 will round in a direction chosen by the implementation, usually in the direction that is
// fastest. This includes the possibility that `round`(`x`) returns the
// same value as `roundEven`(`x`)
// for all values of `x`.
float round(float x);

// `round` returns a value equal to the nearest integer to `x`.
// The fraction 0.5 will round in a direction chosen by the implementation, usually in the direction that is
// fastest. This includes the possibility that `round`(`x`) returns the
// same value as `roundEven`(`x`)
// for all values of `x`.
vec2 round(vec2 x);

// `round` returns a value equal to the nearest integer to `x`.
// The fraction 0.5 will round in a direction chosen by the implementation, usually in the direction that is
// fastest. This includes the possibility that `round`(`x`) returns the
// same value as `roundEven`(`x`)
// for all values of `x`.
vec3 round(vec3 x);

// `round` returns a value equal to the nearest integer to `x`.
// The fraction 0.5 will round in a direction chosen by the implementation, usually in the direction that is
// fastest. This includes the possibility that `round`(`x`) returns the
// same value as `roundEven`(`x`)
// for all values of `x`.
vec4 round(vec4 x);

// `roundEven` returns a value equal to the nearest integer to `x`.
// The fractional part of 0.5 will round toward the nearest even integer.
// For example, both 3.5 and 4.5 will round to 4.0.
float roundEven(float x);

// `roundEven` returns a value equal to the nearest integer to `x`.
// The fractional part of 0.5 will round toward the nearest even integer.
// For example, both 3.5 and 4.5 will round to 4.0.
vec2 roundEven(vec2 x);

// `roundEven` returns a value equal to the nearest integer to `x`.
// The fractional part of 0.5 will round toward the nearest even integer.
// For example, both 3.5 and 4.5 will round to 4.0.
vec3 roundEven(vec3 x);

// `roundEven` returns a value equal to the nearest integer to `x`.
// The fractional part of 0.5 will round toward the nearest even integer.
// For example, both 3.5 and 4.5 will round to 4.0.
vec4 roundEven(vec4 x);

// `ceil` returns a value equal to the nearest integer that is
// greater than or equal to `x`.
float ceil(float x);

// `ceil` returns a value equal to the nearest integer that is
// greater than or equal to `x`.
vec2 ceil(vec2 x);

// `ceil` returns a value equal to the nearest integer that is
// greater than or equal to `x`.
vec3 ceil(vec3 x);

// `ceil` returns a value equal to the nearest integer that is
// greater than or equal to `x`.
vec4 ceil(vec4 x);

// `fract` returns the fractional part of `x`. This
// is calculated as `x` - `floor`(`x`).
float fract(float x);

// `fract` returns the fractional part of `x`. This
// is calculated as `x` - `floor`(`x`).
vec2 fract(vec2 x);

// `fract` returns the fractional part of `x`. This
// is calculated as `x` - `floor`(`x`).
vec3 fract(vec3 x);

// `fract` returns the fractional part of `x`. This
// is calculated as `x` - `floor`(`x`).
vec4 fract(vec4 x);

// `mod` returns the value of `x` modulo
// `y`. This is computed as `x` - `y` *
// `floor`(`x`/`y`).
float mod(float x, float y);

// `mod` returns the value of `x` modulo
// `y`. This is computed as `x` - `y` *
// `floor`(`x`/`y`).
vec2 mod(vec2 x, float y);

// `mod` returns the value of `x` modulo
// `y`. This is computed as `x` - `y` *
// `floor`(`x`/`y`).
vec3 mod(vec3 x, float y);

// `mod` returns the value of `x` modulo
// `y`. This is computed as `x` - `y` *
// `floor`(`x`/`y`).
vec4 mod(vec4 x, float y);

// `mod` returns the value of `x` modulo
// `y`. This is computed as `x` - `y` *
// `floor`(`x`/`y`).
vec2 mod(vec2 x, vec2 y);

// `mod` returns the value of `x` modulo
// `y`. This is computed as `x` - `y` *
// `floor`(`x`/`y`).
vec3 mod(vec3 x, vec3 y);

// `mod` returns the value of `x` modulo
// `y`. This is computed as `x` - `y` *
// `floor`(`x`/`y`).
vec4 mod(vec4 x, vec4 y);

// `modf` separates a floating point value `x`
// into its integer and fractional parts. The fractional part of the number is returned
// from the function and the integer part (as a floating point quantity) is returned
// in the output parameter `i`.
float modf(float x, out float i);

// `modf` separates a floating point value `x`
// into its integer and fractional parts. The fractional part of the number is returned
// from the function and the integer part (as a floating point quantity) is returned
// in the output parameter `i`.
vec2 modf(vec2 x, out vec2 i);

// `modf` separates a floating point value `x`
// into its integer and fractional parts. The fractional part of the number is returned
// from the function and the integer part (as a floating point quantity) is returned
// in the output parameter `i`.
vec3 modf(vec3 x, out vec3 i);

// `modf` separates a floating point value `x`
// into its integer and fractional parts. The fractional part of the number is returned
// from the function and the integer part (as a floating point quantity) is returned
// in the output parameter `i`.
vec4 modf(vec4 x, out vec4 i);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
float min(float x, float y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
vec2 min(vec2 x, vec2 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
vec3 min(vec3 x, vec3 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
vec4 min(vec4 x, vec4 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
vec2 min(vec2 x, float y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
vec3 min(vec3 x, float y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
vec4 min(vec4 x, float y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
int min(int x, int y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
ivec2 min(ivec2 x, ivec2 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
ivec3 min(ivec3 x, ivec3 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
ivec4 min(ivec4 x, ivec4 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
ivec2 min(ivec2 x, int y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
ivec3 min(ivec3 x, int y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
ivec4 min(ivec4 x, int y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
uint min(uint x, uint y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
uvec2 min(uvec2 x, uvec2 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
uvec3 min(uvec3 x, uvec3 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
uvec4 min(uvec4 x, uvec4 y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
uvec2 min(uvec2 x, uint y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
uvec3 min(uvec3 x, uint y);

// `min` returns the minimum of the two parameters. It
// returns `y` if `y` is less than
// `x`, otherwise it returns `x`.
uvec4 min(uvec4 x, uint y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
float max(float x, float y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
vec2 max(vec2 x, vec2 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
vec3 max(vec3 x, vec3 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
vec4 max(vec4 x, vec4 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
vec2 max(vec2 x, float y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
vec3 max(vec3 x, float y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
vec4 max(vec4 x, float y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
int max(int x, int y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
ivec2 max(ivec2 x, ivec2 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
ivec3 max(ivec3 x, ivec3 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
ivec4 max(ivec4 x, ivec4 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
ivec2 max(ivec2 x, int y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
ivec3 max(ivec3 x, int y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
ivec4 max(ivec4 x, int y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
uint max(uint x, uint y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
uvec2 max(uvec2 x, uvec2 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
uvec3 max(uvec3 x, uvec3 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
uvec4 max(uvec4 x, uvec4 y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
uvec2 max(uvec2 x, uint y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
uvec3 max(uvec3 x, uint y);

// `max` returns the maximum of the two parameters. It
// returns `y` if `y` is greater than
// `x`, otherwise it returns `x`.
uvec4 max(uvec4 x, uint y);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
float clamp(float x, float minVal, float maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
vec2 clamp(vec2 x, vec2 minVal, vec2 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
vec3 clamp(vec3 x, vec3 minVal, vec3 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
vec4 clamp(vec4 x, vec4 minVal, vec4 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
vec2 clamp(vec2 x, float minVal, float maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
vec3 clamp(vec3 x, float minVal, float maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
vec4 clamp(vec4 x, float minVal, float maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
int clamp(int x, int minVal, int maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
ivec2 clamp(ivec2 x, ivec2 minVal, ivec2 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
ivec3 clamp(ivec3 x, ivec3 minVal, ivec3 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
ivec4 clamp(ivec4 x, ivec4 minVal, ivec4 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
ivec2 clamp(ivec2 x, int minVal, int maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
ivec3 clamp(ivec3 x, int minVal, int maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
ivec4 clamp(ivec4 x, int minVal, int maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
uint clamp(uint x, uint minVal, uint maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
uvec2 clamp(uvec2 x, uvec2 minVal, uvec2 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
uvec3 clamp(uvec3 x, uvec3 minVal, uvec3 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
uvec4 clamp(uvec4 x, uvec4 minVal, uvec4 maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
uvec2 clamp(uvec2 x, uint minVal, uint maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
uvec3 clamp(uvec3 x, uint minVal, uint maxVal);

// Clamps `x` to the range `[min, max]`. Computed as `min(max(x, minVal), maxVal)`
uvec4 clamp(uvec4 x, uint minVal, uint maxVal);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
float mix(float x, float y, float a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec2 mix(vec2 x, vec2 y, vec2 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec3 mix(vec3 x, vec3 y, vec3 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec4 mix(vec4 x, vec4 y, vec4 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec2 mix(vec2 x, vec2 y, float a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec3 mix(vec3 x, vec3 y, float a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec4 mix(vec4 x, vec4 y, float a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
float mix(float x, float y, bool a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec2 mix(vec2 x, vec2 y, bool a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec3 mix(vec3 x, vec3 y, bool a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec4 mix(vec4 x, vec4 y, bool a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
float mix(float x, float y, bvec2 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec2 mix(vec2 x, vec2 y, bvec2 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec3 mix(vec3 x, vec3 y, bvec2 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec4 mix(vec4 x, vec4 y, bvec2 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
float mix(float x, float y, bvec3 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec2 mix(vec2 x, vec2 y, bvec3 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec3 mix(vec3 x, vec3 y, bvec3 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec4 mix(vec4 x, vec4 y, bvec3 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
float mix(float x, float y, bvec4 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec2 mix(vec2 x, vec2 y, bvec4 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec3 mix(vec3 x, vec3 y, bvec4 a);

// Returns the linear interpolation between `x` and `y` at `a`. I.e. `x * (1 - a) + y * a`
vec4 mix(vec4 x, vec4 y, bvec4 a);

// Returns 0 if `x < edge`, otherwise 1. I.e. `x < edge ? 0 : 1`
float step(float edge, float x);

// Returns 0 if `x < edge`, otherwise 1. I.e. `x < edge ? 0 : 1`
vec2 step(vec2 edge, vec2 x);

// Returns 0 if `x < edge`, otherwise 1. I.e. `x < edge ? 0 : 1`
vec3 step(vec3 edge, vec3 x);

// Returns 0 if `x < edge`, otherwise 1. I.e. `x < edge ? 0 : 1`
vec4 step(vec4 edge, vec4 x);

// Returns 0 if `x < edge`, otherwise 1. I.e. `x < edge ? 0 : 1`
vec2 step(float edge, vec2 x);

// Returns 0 if `x < edge`, otherwise 1. I.e. `x < edge ? 0 : 1`
vec3 step(float edge, vec3 x);

// Returns 0 if `x < edge`, otherwise 1. I.e. `x < edge ? 0 : 1`
vec4 step(float edge, vec4 x);

// Performs smooth Hermite interpolation between 0 and 1 when `edge0 < x < edge1`
// `smoothstep` is equivalent to: 
// 
// ```
// genType t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
// return t * t * (3.0 - 2.0 * t);
// ```
float smoothstep(float edge0, float edge1, float x);

// Performs smooth Hermite interpolation between 0 and 1 when `edge0 < x < edge1`
// `smoothstep` is equivalent to: 
// 
// ```
// genType t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
// return t * t * (3.0 - 2.0 * t);
// ```
vec2 smoothstep(vec2 edge0, vec2 edge1, vec2 x);

// Performs smooth Hermite interpolation between 0 and 1 when `edge0 < x < edge1`
// `smoothstep` is equivalent to: 
// 
// ```
// genType t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
// return t * t * (3.0 - 2.0 * t);
// ```
vec3 smoothstep(vec3 edge0, vec3 edge1, vec3 x);

// Performs smooth Hermite interpolation between 0 and 1 when `edge0 < x < edge1`
// `smoothstep` is equivalent to: 
// 
// ```
// genType t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
// return t * t * (3.0 - 2.0 * t);
// ```
vec4 smoothstep(vec4 edge0, vec4 edge1, vec4 x);

// Performs smooth Hermite interpolation between 0 and 1 when `edge0 < x < edge1`
// `smoothstep` is equivalent to: 
// 
// ```
// genType t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
// return t * t * (3.0 - 2.0 * t);
// ```
vec2 smoothstep(float edge0, float edge1, vec2 x);

// Performs smooth Hermite interpolation between 0 and 1 when `edge0 < x < edge1`
// `smoothstep` is equivalent to: 
// 
// ```
// genType t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
// return t * t * (3.0 - 2.0 * t);
// ```
vec3 smoothstep(float edge0, float edge1, vec3 x);

// Performs smooth Hermite interpolation between 0 and 1 when `edge0 < x < edge1`
// `smoothstep` is equivalent to: 
// 
// ```
// genType t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
// return t * t * (3.0 - 2.0 * t);
// ```
vec4 smoothstep(float edge0, float edge1, vec4 x);

// For each element `i` of the result, `isnan` returns `true` if `x[i]` is positive or negative floating point `NaN`, and `false` otherwise.
// NaNs may not be supported by the implementation, in which case `isnan` returns `false`.
bool isnan(float x);

// For each element `i` of the result, `isnan` returns `true` if `x[i]` is positive or negative floating point `NaN`, and `false` otherwise.
// NaNs may not be supported by the implementation, in which case `isnan` returns `false`.
bvec2 isnan(vec2 x);

// For each element `i` of the result, `isnan` returns `true` if `x[i]` is positive or negative floating point `NaN`, and `false` otherwise.
// NaNs may not be supported by the implementation, in which case `isnan` returns `false`.
bvec3 isnan(vec3 x);

// For each element `i` of the result, `isnan` returns `true` if `x[i]` is positive or negative floating point `NaN`, and `false` otherwise.
// NaNs may not be supported by the implementation, in which case `isnan` returns `false`.
bvec4 isnan(vec4 x);

// For each element `i` of the result, `isinf` returns `true` if `x[i]` is positive or negative floating point `Infinity`, and `false` otherwise.
bool isinf(float x);

// For each element `i` of the result, `isinf` returns `true` if `x[i]` is positive or negative floating point `Infinity`, and `false` otherwise.
bvec2 isinf(vec2 x);

// For each element `i` of the result, `isinf` returns `true` if `x[i]` is positive or negative floating point `Infinity`, and `false` otherwise.
bvec3 isinf(vec3 x);

// For each element `i` of the result, `isinf` returns `true` if `x[i]` is positive or negative floating point `Infinity`, and `false` otherwise.
bvec4 isinf(vec4 x);

// `floatBitsToInt` and `floatBitsToUint` return the encoding
// of their floating-point parameters as highp `int` or `uint`, respectively. The
// floating-point bit-level representation is preserved. For mediump and lowp, the value is first
// converted to highp floating point and the encoding of that value is returned.
int floatBitsToInt(float x);

// `floatBitsToInt` and `floatBitsToUint` return the encoding
// of their floating-point parameters as highp `int` or `uint`, respectively. The
// floating-point bit-level representation is preserved. For mediump and lowp, the value is first
// converted to highp floating point and the encoding of that value is returned.
ivec2 floatBitsToInt(vec2 x);

// `floatBitsToInt` and `floatBitsToUint` return the encoding
// of their floating-point parameters as highp `int` or `uint`, respectively. The
// floating-point bit-level representation is preserved. For mediump and lowp, the value is first
// converted to highp floating point and the encoding of that value is returned.
ivec3 floatBitsToInt(vec3 x);

// `floatBitsToInt` and `floatBitsToUint` return the encoding
// of their floating-point parameters as highp `int` or `uint`, respectively. The
// floating-point bit-level representation is preserved. For mediump and lowp, the value is first
// converted to highp floating point and the encoding of that value is returned.
ivec4 floatBitsToInt(vec4 x);

// `floatBitsToInt` and `floatBitsToUint` return the encoding
// of their floating-point parameters as highp `int` or `uint`, respectively. The
// floating-point bit-level representation is preserved. For mediump and lowp, the value is first
// converted to highp floating point and the encoding of that value is returned.
uint floatBitsToUint(float x);

// `floatBitsToInt` and `floatBitsToUint` return the encoding
// of their floating-point parameters as highp `int` or `uint`, respectively. The
// floating-point bit-level representation is preserved. For mediump and lowp, the value is first
// converted to highp floating point and the encoding of that value is returned.
uvec2 floatBitsToUint(vec2 x);

// `floatBitsToInt` and `floatBitsToUint` return the encoding
// of their floating-point parameters as highp `int` or `uint`, respectively. The
// floating-point bit-level representation is preserved. For mediump and lowp, the value is first
// converted to highp floating point and the encoding of that value is returned.
uvec3 floatBitsToUint(vec3 x);

// `floatBitsToInt` and `floatBitsToUint` return the encoding
// of their floating-point parameters as highp `int` or `uint`, respectively. The
// floating-point bit-level representation is preserved. For mediump and lowp, the value is first
// converted to highp floating point and the encoding of that value is returned.
uvec4 floatBitsToUint(vec4 x);

// `intBitsToFloat` and `uintBitsToFloat` return the encoding
// passed in parameter `x` as a highp floating-point value. If the encoding of
// a NaN is passed in `x`, it will not signal and the resulting value will
// be undefined. If the encoding of a floating point infinity is passed in parameter `x`,
// the resulting floating-point value is the corresponding (positive or negative) floating
// point infinity. For lowp and mediump, the value is first converted to the corresponding signed or
// unsigned highp integer and then reinterpreted as a highp floating point value as before.
float intBitsToFloat(float x);

// `intBitsToFloat` and `uintBitsToFloat` return the encoding
// passed in parameter `x` as a highp floating-point value. If the encoding of
// a NaN is passed in `x`, it will not signal and the resulting value will
// be undefined. If the encoding of a floating point infinity is passed in parameter `x`,
// the resulting floating-point value is the corresponding (positive or negative) floating
// point infinity. For lowp and mediump, the value is first converted to the corresponding signed or
// unsigned highp integer and then reinterpreted as a highp floating point value as before.
vec2 intBitsToFloat(vec2 x);

// `intBitsToFloat` and `uintBitsToFloat` return the encoding
// passed in parameter `x` as a highp floating-point value. If the encoding of
// a NaN is passed in `x`, it will not signal and the resulting value will
// be undefined. If the encoding of a floating point infinity is passed in parameter `x`,
// the resulting floating-point value is the corresponding (positive or negative) floating
// point infinity. For lowp and mediump, the value is first converted to the corresponding signed or
// unsigned highp integer and then reinterpreted as a highp floating point value as before.
vec3 intBitsToFloat(vec3 x);

// `intBitsToFloat` and `uintBitsToFloat` return the encoding
// passed in parameter `x` as a highp floating-point value. If the encoding of
// a NaN is passed in `x`, it will not signal and the resulting value will
// be undefined. If the encoding of a floating point infinity is passed in parameter `x`,
// the resulting floating-point value is the corresponding (positive or negative) floating
// point infinity. For lowp and mediump, the value is first converted to the corresponding signed or
// unsigned highp integer and then reinterpreted as a highp floating point value as before.
vec4 intBitsToFloat(vec4 x);

// `intBitsToFloat` and `uintBitsToFloat` return the encoding
// passed in parameter `x` as a highp floating-point value. If the encoding of
// a NaN is passed in `x`, it will not signal and the resulting value will
// be undefined. If the encoding of a floating point infinity is passed in parameter `x`,
// the resulting floating-point value is the corresponding (positive or negative) floating
// point infinity. For lowp and mediump, the value is first converted to the corresponding signed or
// unsigned highp integer and then reinterpreted as a highp floating point value as before.
float uintBitsToFloat(float x);

// `intBitsToFloat` and `uintBitsToFloat` return the encoding
// passed in parameter `x` as a highp floating-point value. If the encoding of
// a NaN is passed in `x`, it will not signal and the resulting value will
// be undefined. If the encoding of a floating point infinity is passed in parameter `x`,
// the resulting floating-point value is the corresponding (positive or negative) floating
// point infinity. For lowp and mediump, the value is first converted to the corresponding signed or
// unsigned highp integer and then reinterpreted as a highp floating point value as before.
vec2 uintBitsToFloat(vec2 x);

// `intBitsToFloat` and `uintBitsToFloat` return the encoding
// passed in parameter `x` as a highp floating-point value. If the encoding of
// a NaN is passed in `x`, it will not signal and the resulting value will
// be undefined. If the encoding of a floating point infinity is passed in parameter `x`,
// the resulting floating-point value is the corresponding (positive or negative) floating
// point infinity. For lowp and mediump, the value is first converted to the corresponding signed or
// unsigned highp integer and then reinterpreted as a highp floating point value as before.
vec3 uintBitsToFloat(vec3 x);

// `intBitsToFloat` and `uintBitsToFloat` return the encoding
// passed in parameter `x` as a highp floating-point value. If the encoding of
// a NaN is passed in `x`, it will not signal and the resulting value will
// be undefined. If the encoding of a floating point infinity is passed in parameter `x`,
// the resulting floating-point value is the corresponding (positive or negative) floating
// point infinity. For lowp and mediump, the value is first converted to the corresponding signed or
// unsigned highp integer and then reinterpreted as a highp floating point value as before.
vec4 uintBitsToFloat(vec4 x);

// Returns the length of a vector. I.e. the square root of the sum of the squares of all components.
float length(float x);

// Returns the length of a vector. I.e. the square root of the sum of the squares of all components.
float length(vec2 x);

// Returns the length of a vector. I.e. the square root of the sum of the squares of all components.
float length(vec3 x);

// Returns the length of a vector. I.e. the square root of the sum of the squares of all components.
float length(vec4 x);

// Returns the distance between two vectors. I.e. `length(p0 - p1)`
float distance(float p0, float p1);

// Returns the distance between two vectors. I.e. `length(p0 - p1)`
float distance(vec2 p0, vec2 p1);

// Returns the distance between two vectors. I.e. `length(p0 - p1)`
float distance(vec3 p0, vec3 p1);

// Returns the distance between two vectors. I.e. `length(p0 - p1)`
float distance(vec4 p0, vec4 p1);

// Returns the dot product of two vectors. I.e. `x[0] * y[0] + x[1] * y[1] + ...`
float dot(float x, float y);

// Returns the dot product of two vectors. I.e. `x[0] * y[0] + x[1] * y[1] + ...`
float dot(vec2 x, vec2 y);

// Returns the dot product of two vectors. I.e. `x[0] * y[0] + x[1] * y[1] + ...`
float dot(vec3 x, vec3 y);

// Returns the dot product of two vectors. I.e. `x[0] * y[0] + x[1] * y[1] + ...`
float dot(vec4 x, vec4 y);

// Returns the cross product of two vectors. I.e. `(x[1] * y[2] - x[2] * y[1], x[2] * y[0] - x[0] * y[2], x[0] * y[1] - x[1] * y[0])`
vec3 cross(vec3 x, vec3 y);

// `normalize` returns a vector with the same direction as its parameter, `v`, but with length 1.
float normalize(float v);

// `normalize` returns a vector with the same direction as its parameter, `v`, but with length 1.
vec2 normalize(vec2 v);

// `normalize` returns a vector with the same direction as its parameter, `v`, but with length 1.
vec3 normalize(vec3 v);

// `normalize` returns a vector with the same direction as its parameter, `v`, but with length 1.
vec4 normalize(vec4 v);

// `faceforward` orients a vector to point away from a surface as defined by its normal.
// If `dot(Nref, I) < 0`, then `faceforward` returns `N`, otherwise it returns `-N`
float faceforward(float N, float I, float Nref);

// `faceforward` orients a vector to point away from a surface as defined by its normal.
// If `dot(Nref, I) < 0`, then `faceforward` returns `N`, otherwise it returns `-N`
vec2 faceforward(vec2 N, vec2 I, vec2 Nref);

// `faceforward` orients a vector to point away from a surface as defined by its normal.
// If `dot(Nref, I) < 0`, then `faceforward` returns `N`, otherwise it returns `-N`
vec3 faceforward(vec3 N, vec3 I, vec3 Nref);

// `faceforward` orients a vector to point away from a surface as defined by its normal.
// If `dot(Nref, I) < 0`, then `faceforward` returns `N`, otherwise it returns `-N`
vec4 faceforward(vec4 N, vec4 I, vec4 Nref);

// For a given incident vector `I` and surface normal `N` `reflect` returns
// the reflection direction calculated as ``I` - 2.0 * dot(`N`, `I`) * `N``.
// `N` should be normalized in order to achieve the desired result.
float reflect(float I, float N);

// For a given incident vector `I` and surface normal `N` `reflect` returns
// the reflection direction calculated as ``I` - 2.0 * dot(`N`, `I`) * `N``.
// `N` should be normalized in order to achieve the desired result.
vec2 reflect(vec2 I, vec2 N);

// For a given incident vector `I` and surface normal `N` `reflect` returns
// the reflection direction calculated as ``I` - 2.0 * dot(`N`, `I`) * `N``.
// `N` should be normalized in order to achieve the desired result.
vec3 reflect(vec3 I, vec3 N);

// For a given incident vector `I` and surface normal `N` `reflect` returns
// the reflection direction calculated as ``I` - 2.0 * dot(`N`, `I`) * `N``.
// `N` should be normalized in order to achieve the desired result.
vec4 reflect(vec4 I, vec4 N);

// For a given incident vector `I`, surface normal `N` and ratio of
// indices of refraction, `eta`, `refract` returns the refraction vector,
// `R`.
// `R` is calculated as:
// 
// ```glsl
//    k = 1.0 - eta * eta * (1.0 - dot(N, I) * dot(N, I));
// if (k < 0.0)
// R = genType(0.0);       // or genDType(0.0)
// else
// R = eta * I - (eta * dot(N, I) + sqrt(k)) * N;
// ```
//
// The input parameters `I` and `N` should be normalized in order to achieve the desired result.
float refract(float I, float N, float eta);

// For a given incident vector `I`, surface normal `N` and ratio of
// indices of refraction, `eta`, `refract` returns the refraction vector,
// `R`.
// `R` is calculated as:
// 
// ```glsl
//    k = 1.0 - eta * eta * (1.0 - dot(N, I) * dot(N, I));
// if (k < 0.0)
// R = genType(0.0);       // or genDType(0.0)
// else
// R = eta * I - (eta * dot(N, I) + sqrt(k)) * N;
// ```
//
// The input parameters `I` and `N` should be normalized in order to achieve the desired result.
vec2 refract(vec2 I, vec2 N, float eta);

// For a given incident vector `I`, surface normal `N` and ratio of
// indices of refraction, `eta`, `refract` returns the refraction vector,
// `R`.
// `R` is calculated as:
// 
// ```glsl
//    k = 1.0 - eta * eta * (1.0 - dot(N, I) * dot(N, I));
// if (k < 0.0)
// R = genType(0.0);       // or genDType(0.0)
// else
// R = eta * I - (eta * dot(N, I) + sqrt(k)) * N;
// ```
//
// The input parameters `I` and `N` should be normalized in order to achieve the desired result.
vec3 refract(vec3 I, vec3 N, float eta);

// For a given incident vector `I`, surface normal `N` and ratio of
// indices of refraction, `eta`, `refract` returns the refraction vector,
// `R`.
// `R` is calculated as:
// 
// ```glsl
//    k = 1.0 - eta * eta * (1.0 - dot(N, I) * dot(N, I));
// if (k < 0.0)
// R = genType(0.0);       // or genDType(0.0)
// else
// R = eta * I - (eta * dot(N, I) + sqrt(k)) * N;
// ```
//
// The input parameters `I` and `N` should be normalized in order to achieve the desired result.
vec4 refract(vec4 I, vec4 N, float eta);

// `outerProduct` treats the first parameter `c` as a column
// vector (matrix with one column) and the second parameter `r` as a row vector
// (matrix with one row) and does a linear algebraic matrix multiply `c` * `r`,
// yielding a matrix whose number of rows is the number of components in `c` and
// whose number of columns is the number of components in `r`.
mat2 outerProduct(vec2 c, vec2 r);

// `outerProduct` treats the first parameter `c` as a column
// vector (matrix with one column) and the second parameter `r` as a row vector
// (matrix with one row) and does a linear algebraic matrix multiply `c` * `r`,
// yielding a matrix whose number of rows is the number of components in `c` and
// whose number of columns is the number of components in `r`.
mat3 outerProduct(vec3 c, vec3 r);

// `outerProduct` treats the first parameter `c` as a column
// vector (matrix with one column) and the second parameter `r` as a row vector
// (matrix with one row) and does a linear algebraic matrix multiply `c` * `r`,
// yielding a matrix whose number of rows is the number of components in `c` and
// whose number of columns is the number of components in `r`.
mat4 outerProduct(vec4 c, vec4 r);


// `transpose` returns the transpose of the matrix `m`.
mat2 transpose(mat2 m);

// `transpose` returns the transpose of the matrix `m`.
mat3 transpose(mat3 m);

// `transpose` returns the transpose of the matrix `m`.
mat4 transpose(mat4 m);

// `determinant` returns the determinant of the matrix `m`.
float determinant(mat2 m);

// `determinant` returns the determinant of the matrix `m`.
float determinant(mat3 m);

// `determinant` returns the determinant of the matrix `m`.
float determinant(mat4 m);

// `inverse` returns the inverse of the matrix `m`. The values in the
// returned matrix are undefined if `m` is singular or poorly-conditioned (nearly singular).
mat2 inverse(mat2 m);

// `inverse` returns the inverse of the matrix `m`. The values in the
// returned matrix are undefined if `m` is singular or poorly-conditioned (nearly singular).
mat3 inverse(mat3 m);

// `inverse` returns the inverse of the matrix `m`. The values in the
// returned matrix are undefined if `m` is singular or poorly-conditioned (nearly singular).
mat4 inverse(mat4 m);

// `lessThan` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] < `y`[_i_].
bvec2 lessThan(vec2 x, vec2 y);

// `lessThan` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] < `y`[_i_].
bvec3 lessThan(vec3 x, vec3 y);

// `lessThan` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] < `y`[_i_].
bvec4 lessThan(vec4 x, vec4 y);

// `lessThanEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] =< `y`[_i_].
bvec2 lessThanEqual(vec2 x, vec2 y);

// `lessThanEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] =< `y`[_i_].
bvec3 lessThanEqual(vec3 x, vec3 y);

// `lessThanEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] =< `y`[_i_].
bvec4 lessThanEqual(vec4 x, vec4 y);

// `greaterThan` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] > `y`[_i_].
bvec2 greaterThan(vec2 x, vec2 y);

// `greaterThan` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] > `y`[_i_].
bvec3 greaterThan(vec3 x, vec3 y);

// `greaterThan` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] > `y`[_i_].
bvec4 greaterThan(vec4 x, vec4 y);

// `greaterThanEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] >= `y`[_i_].
bvec2 greaterThanEqual(vec2 x, vec2 y);

// `greaterThanEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] >= `y`[_i_].
bvec3 greaterThanEqual(vec3 x, vec3 y);

// `greaterThanEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] >= `y`[_i_].
bvec4 greaterThanEqual(vec4 x, vec4 y);

// `equal` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] == `y`[_i_].
bvec2 equal(vec2 x, vec2 y);

// `equal` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] == `y`[_i_].
bvec3 equal(vec3 x, vec3 y);

// `equal` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] == `y`[_i_].
bvec4 equal(vec4 x, vec4 y);

// `notEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] != `y`[_i_].
bvec2 notEqual(vec2 x, vec2 y);

// `notEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] != `y`[_i_].
bvec3 notEqual(vec3 x, vec3 y);

// `notEqual` returns a boolean vector in which each element _i_ is computed
// as `x`[_i_] != `y`[_i_].
bvec4 notEqual(vec4 x, vec4 y);

// `any` returns true if any element of `x` is true and false otherwise.
// It is functionally equivalent to:
// 
// ```glsl
//    bool any(bvec x)       // bvec can be bvec2, bvec3 or bvec4
// {
// bool result = false;
// int i;
// for (i = 0; i < x.length(); ++i)
// {
// result |= x[i];
// }
// return result;
// }
// ```
//
bool any(bvec2 x);

// `any` returns true if any element of `x` is true and false otherwise.
// It is functionally equivalent to:
// 
// ```glsl
//    bool any(bvec x)       // bvec can be bvec2, bvec3 or bvec4
// {
// bool result = false;
// int i;
// for (i = 0; i < x.length(); ++i)
// {
// result |= x[i];
// }
// return result;
// }
// ```
//
bool any(bvec3 x);

// `any` returns true if any element of `x` is true and false otherwise.
// It is functionally equivalent to:
// 
// ```glsl
//    bool any(bvec x)       // bvec can be bvec2, bvec3 or bvec4
// {
// bool result = false;
// int i;
// for (i = 0; i < x.length(); ++i)
// {
// result |= x[i];
// }
// return result;
// }
// ```
//
bool any(bvec4 x);

// `all` returns true if all elements of `x` are true and false otherwise.
// It is functionally equivalent to:
// 
// ```glsl
//    bool all(bvec x)       // bvec can be bvec2, bvec3 or bvec4
// {
// bool result = true;
// int i;
// for (i = 0; i < x.length(); ++i)
// {
// result &amp;= x[i];
// }
// return result;
// }
// ```
//
bool all(bvec2 x);

// `all` returns true if all elements of `x` are true and false otherwise.
// It is functionally equivalent to:
// 
// ```glsl
//    bool all(bvec x)       // bvec can be bvec2, bvec3 or bvec4
// {
// bool result = true;
// int i;
// for (i = 0; i < x.length(); ++i)
// {
// result &amp;= x[i];
// }
// return result;
// }
// ```
//
bool all(bvec3 x);

// `all` returns true if all elements of `x` are true and false otherwise.
// It is functionally equivalent to:
// 
// ```glsl
//    bool all(bvec x)       // bvec can be bvec2, bvec3 or bvec4
// {
// bool result = true;
// int i;
// for (i = 0; i < x.length(); ++i)
// {
// result &amp;= x[i];
// }
// return result;
// }
// ```
//
bool all(bvec4 x);

// `not` logically inverts the boolean vector `x`. It returns
// a new boolean vector for which each element _i_ is computed as `!`x`[`i`]`.
bvec2 not(bvec2 x);

// `not` logically inverts the boolean vector `x`. It returns
// a new boolean vector for which each element _i_ is computed as `!`x`[`i`]`.
bvec3 not(bvec3 x);

// `not` logically inverts the boolean vector `x`. It returns
// a new boolean vector for which each element _i_ is computed as `!`x`[`i`]`.
bvec4 not(bvec4 x);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec2 textureSize(sampler2D sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec2 textureSize(isampler2D sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec2 textureSize(usampler2D sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec3 textureSize(sampler3D sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec3 textureSize(isampler3D sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec3 textureSize(usampler3D sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec2 textureSize(samplerCube sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec2 textureSize(isamplerCube sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec2 textureSize(usamplerCube sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec2 textureSize(sampler2DShadow sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec2 textureSize(samplerCubeShadow sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec3 textureSize(sampler2DArray sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec3 textureSize(isampler2DArray sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec3 textureSize(usampler2DArray sampler, int lod);

// `textureSize` returns the dimensions of level `lod` (if present)
// of the texture bound to `sampler`. The components in the return value are filled in,
// in order, with the width, height and depth of the texture. For the array forms, the last component of the
// return value is the number of layers in the texture array. The return values are returned as highp ints.
ivec3 textureSize(sampler2DArrayShadow sampler, int lod);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
vec4 texture(sampler2D sampler, vec2 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
ivec4 texture(isampler2D sampler, vec2 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
uvec4 texture(usampler2D sampler, vec2 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
vec4 texture(sampler2D sampler, vec2 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
ivec4 texture(isampler2D sampler, vec2 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
uvec4 texture(usampler2D sampler, vec2 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
vec4 texture(sampler3D sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
ivec4 texture(isampler3D sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
uvec4 texture(usampler3D sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
vec4 texture(sampler3D sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
ivec4 texture(isampler3D sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
uvec4 texture(usampler3D sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
vec4 texture(samplerCube sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
ivec4 texture(isamplerCube sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
uvec4 texture(usamplerCube sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
vec4 texture(samplerCube sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
ivec4 texture(isamplerCube sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
uvec4 texture(usamplerCube sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// When compare is present, it is used as Dsub and the array layer is specified in `P.w`
// When compare is not present, the last component of `P` is used as Dsub and the array
// layer is specified in the second to last component of `P`.
float texture(sampler2DShadow sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// When compare is present, it is used as Dsub and the array layer is specified in `P.w`
// When compare is not present, the last component of `P` is used as Dsub and the array
// layer is specified in the second to last component of `P`.
float texture(sampler2DShadow sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// When compare is present, it is used as Dsub and the array layer is specified in `P.w`
// When compare is not present, the last component of `P` is used as Dsub and the array
// layer is specified in the second to last component of `P`.
float texture(samplerCubeShadow sampler, vec4 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// When compare is present, it is used as Dsub and the array layer is specified in `P.w`
// When compare is not present, the last component of `P` is used as Dsub and the array
// layer is specified in the second to last component of `P`.
float texture(samplerCubeShadow sampler, vec4 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
vec4 texture(sampler2DArray sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
ivec4 texture(isampler2DArray sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
uvec4 texture(usampler2DArray sampler, vec3 P, float bias);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
vec4 texture(sampler2DArray sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
ivec4 texture(isampler2DArray sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// The array layer comes from the last component of `P`
uvec4 texture(usampler2DArray sampler, vec3 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// When compare is present, it is used as Dsub and the array layer is specified in `P.w`
// When compare is not present, the last component of `P` is used as Dsub and the array
// layer is specified in the second to last component of `P`.
float texture(sampler2DArrayShadow sampler, vec4 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// When compare is present, it is used as Dsub and the array layer is specified in `P.w`
// When compare is not present, the last component of `P` is used as Dsub and the array
// layer is specified in the second to last component of `P`.
float texture(isampler2DArrayShadow sampler, vec4 P);

// `texture` samples texels from the texture bound to `sampler` at texture coordinate `P`.
// An optional bias, specified in `bias` is included in the level-of-detail computation that
// is used to choose mipmap(s) from which to sample.
// 
// When compare is present, it is used as Dsub and the array layer is specified in `P.w`
// When compare is not present, the last component of `P` is used as Dsub and the array
// layer is specified in the second to last component of `P`.
float texture(usampler2DArrayShadow sampler, vec4 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
vec4 textureProj(sampler2D sampler, vec3 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
ivec4 textureProj(isampler2D sampler, vec3 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
uvec4 textureProj(usampler2D sampler, vec3 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
vec4 textureProj(sampler2D sampler, vec3 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
ivec4 textureProj(isampler2D sampler, vec3 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
uvec4 textureProj(usampler2D sampler, vec3 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
vec4 textureProj(sampler2D sampler, vec4 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
ivec4 textureProj(isampler2D sampler, vec4 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
uvec4 textureProj(usampler2D sampler, vec4 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
vec4 textureProj(sampler2D sampler, vec4 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
ivec4 textureProj(isampler2D sampler, vec4 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
uvec4 textureProj(usampler2D sampler, vec4 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
vec4 textureProj(sampler3D sampler, vec4 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
ivec4 textureProj(isampler3D sampler, vec4 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
uvec4 textureProj(usampler3D sampler, vec4 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
vec4 textureProj(sampler3D sampler, vec4 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
ivec4 textureProj(isampler3D sampler, vec4 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `texture`.
uvec4 textureProj(usampler3D sampler, vec4 P);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// The resulting 3rd component of `P` in the shadow forms is used as Dref
// After these values are computed, the texture lookup proceeds as in `texture`.
float textureProj(sampler2DShadow sampler, vec4 P, float bias);

// `textureProj` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// The resulting 3rd component of `P` in the shadow forms is used as Dref
// After these values are computed, the texture lookup proceeds as in `texture`.
float textureProj(sampler2DShadow sampler, vec4 P);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
vec4 textureLod(sampler2D sampler, vec2 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
ivec4 textureLod(isampler2D sampler, vec2 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
uvec4 textureLod(usampler2D sampler, vec2 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
vec4 textureLod(sampler3D sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
ivec4 textureLod(isampler3D sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
uvec4 textureLod(usampler3D sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
vec4 textureLod(samplerCube sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
ivec4 textureLod(isamplerCube sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
uvec4 textureLod(usamplerCube sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
float textureLod(sampler2DShadow sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
vec4 textureLod(sampler2DArray sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
ivec4 textureLod(isampler2DArray sampler, vec3 P, float lod);

// Performs a texture lookup at coordinate `P` from the texture bound to sampler with an explicit level-of-detail as specified in `lod`.
uvec4 textureLod(usampler2DArray sampler, vec3 P, float lod);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
vec4 textureOffset(sampler2D sampler, vec2 P, ivec2 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
ivec4 textureOffset(isampler2D sampler, vec2 P, ivec2 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
uvec4 textureOffset(usampler2D sampler, vec2 P, ivec2 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
vec4 textureOffset(sampler2D sampler, vec2 P, ivec2 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
ivec4 textureOffset(isampler2D sampler, vec2 P, ivec2 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
uvec4 textureOffset(usampler2D sampler, vec2 P, ivec2 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
vec4 textureOffset(sampler3D sampler, vec3 P, ivec3 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
ivec4 textureOffset(isampler3D sampler, vec3 P, ivec3 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
uvec4 textureOffset(usampler3D sampler, vec3 P, ivec3 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
vec4 textureOffset(sampler3D sampler, vec3 P, ivec3 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
ivec4 textureOffset(isampler3D sampler, vec3 P, ivec3 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
uvec4 textureOffset(usampler3D sampler, vec3 P, ivec3 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
float textureOffset(sampler2DShadow sampler, vec3 P, ivec2 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
float textureOffset(sampler2DShadow sampler, vec3 P, ivec2 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
vec4 textureOffset(sampler2DArray sampler, vec3 P, ivec2 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
ivec4 textureOffset(isampler2DArray sampler, vec3 P, ivec2 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
uvec4 textureOffset(usampler2DArray sampler, vec3 P, ivec2 offset, float bias);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
vec4 textureOffset(sampler2DArray sampler, vec3 P, ivec2 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
ivec4 textureOffset(isampler2DArray sampler, vec3 P, ivec2 offset);

// `textureOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an additional offset, specified in texels in `offset`
// that will be applied to the (u, v, w) texture coordinates before looking up each texel.
// The offset value must be a constant expression. A limited range of offset values are supported;
// the minimum and maximum offset values are implementation-dependent and may be determined
// by querying `GL_MIN_PROGRAM_TEXEL_OFFSET` and `GL_MAX_PROGRAM_TEXEL_OFFSET`,
// respectively.
// Note that `offset` does not apply to the layer coordinate for texture arrays. Also note
// that offsets are not supported for cube maps.
uvec4 textureOffset(usampler2DArray sampler, vec3 P, ivec2 offset);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
vec4 texelFetch(sampler2D sampler, ivec2 P, int lod);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
ivec4 texelFetch(isampler2D sampler, ivec2 P, int lod);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
uvec4 texelFetch(usampler2D sampler, ivec2 P, int lod);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
vec4 texelFetch(sampler3D sampler, ivec3 P, int lod);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
ivec4 texelFetch(isampler3D sampler, ivec3 P, int lod);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
uvec4 texelFetch(usampler3D sampler, ivec3 P, int lod);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
vec4 texelFetch(sampler2DArray sampler, ivec3 P, int lod);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
ivec4 texelFetch(isampler2DArray sampler, ivec3 P, int lod);

// `texelFetch` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched.
uvec4 texelFetch(usampler2DArray sampler, ivec3 P, int lod);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
vec4 texelFetchOffset(sampler2D sampler, ivec2 P, int lod, ivec2 offset);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
ivec4 texelFetchOffset(isampler2D sampler, ivec2 P, int lod, ivec2 offset);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
uvec4 texelFetchOffset(usampler2D sampler, ivec2 P, int lod, ivec2 offset);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
vec4 texelFetchOffset(sampler3D sampler, ivec3 P, int lod, ivec3 offset);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
ivec4 texelFetchOffset(isampler3D sampler, ivec3 P, int lod, ivec3 offset);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
uvec4 texelFetchOffset(usampler3D sampler, ivec3 P, int lod, ivec3 offset);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
vec4 texelFetchOffset(sampler2DArray sampler, ivec3 P, int lod, ivec2 offset);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
ivec4 texelFetchOffset(isampler2DArray sampler, ivec3 P, int lod, ivec2 offset);

// `texelFetchOffset` performs a lookup of a single texel from texture coordinate `P`
// in the texture bound to `sampler`. Before fetching the texel, the offset specified in `offset`
// is added to `P`. `offset` must be a constant expression. The array layer is specified in the last component of
// `P` for array forms. The `lod` parameter (if present) specifies the level-of-detail
// from which the texel will be fetched. The `sample` parameter specifies which sample within the texel will be
// returned when reading from a multi-sample texure.
uvec4 texelFetchOffset(usampler2DArray sampler, ivec3 P, int lod, ivec2 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
vec4 textureProjOffset(sampler2D sampler, vec3 P, ivec2 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
ivec4 textureProjOffset(isampler2D sampler, vec3 P, ivec2 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
uvec4 textureProjOffset(usampler2D sampler, vec3 P, ivec2 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
vec4 textureProjOffset(sampler2D sampler, vec3 P, ivec2 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
ivec4 textureProjOffset(isampler2D sampler, vec3 P, ivec2 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
uvec4 textureProjOffset(usampler2D sampler, vec3 P, ivec2 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
vec4 textureProjOffset(sampler2D sampler, vec4 P, ivec2 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
ivec4 textureProjOffset(isampler2D sampler, vec4 P, ivec2 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
uvec4 textureProjOffset(usampler2D sampler, vec4 P, ivec2 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
vec4 textureProjOffset(sampler2D sampler, vec4 P, ivec2 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
ivec4 textureProjOffset(isampler2D sampler, vec4 P, ivec2 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
uvec4 textureProjOffset(usampler2D sampler, vec4 P, ivec2 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
vec4 textureProjOffset(sampler3D sampler, vec4 P, ivec3 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
ivec4 textureProjOffset(isampler3D sampler, vec4 P, ivec3 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
uvec4 textureProjOffset(usampler3D sampler, vec4 P, ivec3 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
vec4 textureProjOffset(sampler3D sampler, vec4 P, ivec3 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
ivec4 textureProjOffset(isampler3D sampler, vec4 P, ivec3 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
uvec4 textureProjOffset(usampler3D sampler, vec4 P, ivec3 offset);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// The resulting 3rd component of `P` in the shadow forms is used as Dref
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
float textureProjOffset(sampler2DShadow sampler, vec4 P, ivec2 offset, float bias);

// `textureProjOffset` performs a texture lookup with projection.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// The resulting 3rd component of `P` in the shadow forms is used as Dref
// After these values are computed, the texture lookup proceeds as in `textureOffset`,
// with the `offset` used to offset the computed texture coordinates.
float textureProjOffset(sampler2DShadow sampler, vec4 P, ivec2 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
vec4 textureLodOffset(sampler2D sampler, vec2 P, float lod, ivec2 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
ivec4 textureLodOffset(isampler2D sampler, vec2 P, float lod, ivec2 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
uvec4 textureLodOffset(usampler2D sampler, vec2 P, float lod, ivec2 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
vec4 textureLodOffset(sampler3D sampler, vec3 P, float lod, ivec3 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
ivec4 textureLodOffset(isampler3D sampler, vec3 P, float lod, ivec3 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
uvec4 textureLodOffset(usampler3D sampler, vec3 P, float lod, ivec3 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
float textureLodOffset(sampler2DShadow sampler, vec3 P, float lod, ivec2 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
vec4 textureLodOffset(sampler2DArray sampler, vec3 P, float lod, ivec2 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
ivec4 textureLodOffset(isampler2DArray sampler, vec3 P, float lod, ivec2 offset);

// `textureLodOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with an explicit level-of-detail as specified in `lod`.
// Behavior is the same as in `textureLod` except that before
// sampling, `offset` is added to `P`.
uvec4 textureLodOffset(usampler2DArray sampler, vec3 P, float lod, ivec2 offset);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
vec4 textureProjLod(sampler2D sampler, vec3 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
ivec4 textureProjLod(isampler2D sampler, vec3 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
uvec4 textureProjLod(usampler2D sampler, vec3 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
vec4 textureProjLod(sampler2D sampler, vec4 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
ivec4 textureProjLod(isampler2D sampler, vec4 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
uvec4 textureProjLod(usampler2D sampler, vec4 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
vec4 textureProjLod(sampler3D sampler, vec4 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
ivec4 textureProjLod(isampler3D sampler, vec4 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
uvec4 textureProjLod(usampler3D sampler, vec4 P, float lod);

// `textureProjLod` performs a texture lookup with projection from an explicitly specified level-of-detail.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// The resulting 3rd component of `P` in the shadow forms is used as Dref
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled
float textureProjLod(sampler2DShadow sampler, vec4 P, float lod);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
vec4 textureProjLodOffset(sampler2D sampler, vec3 P, float lod, ivec2 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
ivec4 textureProjLodOffset(isampler2D sampler, vec3 P, float lod, ivec2 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
uvec4 textureProjLodOffset(usampler2D sampler, vec3 P, float lod, ivec2 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
vec4 textureProjLodOffset(sampler2D sampler, vec4 P, float lod, ivec2 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
ivec4 textureProjLodOffset(isampler2D sampler, vec4 P, float lod, ivec2 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
uvec4 textureProjLodOffset(usampler2D sampler, vec4 P, float lod, ivec2 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
vec4 textureProjLodOffset(sampler3D sampler, vec4 P, float lod, ivec3 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
ivec4 textureProjLodOffset(isampler3D sampler, vec4 P, float lod, ivec3 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
uvec4 textureProjLodOffset(usampler3D sampler, vec4 P, float lod, ivec3 offset);

// `textureProjLodOffset` performs a texture lookup with projection from an explicitly specified 
// level-of-detail with an offset applied to the texture coordinates before sampling.
// The texture coordinates consumed from `P`, not including the last component of `P`,
// are divided by the last component of `P`.
// The resulting 3rd component of `P` in the shadow forms is used as Dref
// After these values are computed, the texture lookup proceeds as in `textureLod`,
// with `lod` used to specify the level-of-detail from which the texture will be sampled 
// and `offset` used to specify the offset, in texels, to be applied to the texture coordinates before sampling.
float textureProjLodOffset(sampler2DShadow sampler, vec4 P, float lod, ivec2 offset);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
vec4 textureGrad(sampler2D sampler, vec2 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
ivec4 textureGrad(isampler2D sampler, vec2 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
uvec4 textureGrad(usampler2D sampler, vec2 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
vec4 textureGrad(sampler3D sampler, vec3 P, vec3 dPdx, vec3 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
ivec4 textureGrad(isampler3D sampler, vec3 P, vec3 dPdx, vec3 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
uvec4 textureGrad(usampler3D sampler, vec3 P, vec3 dPdx, vec3 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
vec4 textureGrad(samplerCube sampler, vec3 P, vec3 dPdx, vec3 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
ivec4 textureGrad(isamplerCube sampler, vec3 P, vec3 dPdx, vec3 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
uvec4 textureGrad(usamplerCube sampler, vec3 P, vec3 dPdx, vec3 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
float textureGrad(sampler2DShadow sampler, vec3 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
float textureGrad(samplerCubeShadow sampler, vec4 P, vec3 dPdx, vec3 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
vec4 textureGrad(sampler2DArray sampler, vec3 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
ivec4 textureGrad(isampler2DArray sampler, vec3 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
uvec4 textureGrad(usampler2DArray sampler, vec3 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
float textureGrad(sampler2DArrayShadow sampler, vec4 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
float textureGrad(isampler2DArrayShadow sampler, vec4 P, vec2 dPdx, vec2 dPdy);

// Performs a texture lookup at coordinate `P` from the texture bound to `sampler` with explicit
// texture coordinate gradients as specified in `dPdx` and `dPdy`
float textureGrad(usampler2DArrayShadow sampler, vec4 P, vec2 dPdx, vec2 dPdy);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
vec4 textureGradOffset(sampler2D sampler, vec2 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
ivec4 textureGradOffset(isampler2D sampler, vec2 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
uvec4 textureGradOffset(usampler2D sampler, vec2 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
vec4 textureGradOffset(sampler3D sampler, vec3 P, vec3 dPdx, vec3 dPdy, ivec3 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
ivec4 textureGradOffset(isampler3D sampler, vec3 P, vec3 dPdx, vec3 dPdy, ivec3 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
uvec4 textureGradOffset(usampler3D sampler, vec3 P, vec3 dPdx, vec3 dPdy, ivec3 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
float textureGradOffset(sampler2DShadow sampler, vec3 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
vec4 textureGradOffset(sampler2DArray sampler, vec3 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
ivec4 textureGradOffset(isampler2DArray sampler, vec3 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
uvec4 textureGradOffset(usampler2DArray sampler, vec3 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// `textureGradOffset` performs a texture lookup at coordinate `P` from the
// texture bound to `sampler` with explicit texture coordinate gradiends as specified in
// `dPdx` and `dPdy`. An explicit offset is also supplied in `offset`.
// `textureGradOffset` consumes `dPdx` and `dPdy` as
// `textureGrad` and `offset` as
// `textureOffset`.
float textureGradOffset(sampler2DArrayShadow sampler, vec4 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// Perform a texture lookup with projection and explicit gradients
vec4 textureProjGrad(sampler2D sampler, vec3 P, vec2 dPdx, vec2 dPdy);

// Perform a texture lookup with projection and explicit gradients
ivec4 textureProjGrad(isampler2D sampler, vec3 P, vec2 dPdx, vec2 dPdy);

// Perform a texture lookup with projection and explicit gradients
uvec4 textureProjGrad(usampler2D sampler, vec3 P, vec2 dPdx, vec2 dPdy);

// Perform a texture lookup with projection and explicit gradients
vec4 textureProjGrad(sampler2D sampler, vec4 P, vec2 dPdx, vec2 dPdy);

// Perform a texture lookup with projection and explicit gradients
ivec4 textureProjGrad(isampler2D sampler, vec4 P, vec2 dPdx, vec2 dPdy);

// Perform a texture lookup with projection and explicit gradients
uvec4 textureProjGrad(usampler2D sampler, vec4 P, vec2 dPdx, vec2 dPdy);

// Perform a texture lookup with projection and explicit gradients
vec4 textureProjGrad(sampler3D sampler, vec4 P, vec3 dPdx, vec3 dPdy);

// Perform a texture lookup with projection and explicit gradients
ivec4 textureProjGrad(isampler3D sampler, vec4 P, vec3 dPdx, vec3 dPdy);

// Perform a texture lookup with projection and explicit gradients
uvec4 textureProjGrad(usampler3D sampler, vec4 P, vec3 dPdx, vec3 dPdy);

// Perform a texture lookup with projection and explicit gradients
float textureProjGrad(sampler2DShadow sampler, vec4 P, vec2 dPdx, vec2 dPdy);

// Perform a texture lookup with projection, explicit gradients and offset
vec4 textureProjGradOffset(sampler2D sampler, vec3 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// Perform a texture lookup with projection, explicit gradients and offset
ivec4 textureProjGradOffset(isampler2D sampler, vec3 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// Perform a texture lookup with projection, explicit gradients and offset
uvec4 textureProjGradOffset(usampler2D sampler, vec3 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// Perform a texture lookup with projection, explicit gradients and offset
vec4 textureProjGradOffset(sampler2D sampler, vec4 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// Perform a texture lookup with projection, explicit gradients and offset
ivec4 textureProjGradOffset(isampler2D sampler, vec4 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// Perform a texture lookup with projection, explicit gradients and offset
uvec4 textureProjGradOffset(usampler2D sampler, vec4 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// Perform a texture lookup with projection, explicit gradients and offset
vec4 textureProjGradOffset(sampler3D sampler, vec4 P, vec3 dPdx, vec3 dPdy, ivec3 offset);

// Perform a texture lookup with projection, explicit gradients and offset
ivec4 textureProjGradOffset(isampler3D sampler, vec4 P, vec3 dPdx, vec3 dPdy, ivec3 offset);

// Perform a texture lookup with projection, explicit gradients and offset
uvec4 textureProjGradOffset(usampler3D sampler, vec4 P, vec3 dPdx, vec3 dPdy, ivec3 offset);

// Perform a texture lookup with projection, explicit gradients and offset
float textureProjGradOffset(sampler2DShadow sampler, vec4 P, vec2 dPdx, vec2 dPdy, ivec2 offset);

// _Available only in the fragment shader_, `dFdx` and `dFdy`
// return the partial derivative of expression `p` in x and y, respectively. Deviatives are calculated
// using local differencing. Expressions that imply higher order derivatives such as `dFdx(dFdx(n))` have undefined
// results, as do mixed-order derivatives such as `dFdx(dFdy(n))`.
// It is assumed that the expression `p` is continuous and therefore, expressions evaluated
// via non-uniform control flow may be undefined.
float dFdx(float p);

// _Available only in the fragment shader_, `dFdx` and `dFdy`
// return the partial derivative of expression `p` in x and y, respectively. Deviatives are calculated
// using local differencing. Expressions that imply higher order derivatives such as `dFdx(dFdx(n))` have undefined
// results, as do mixed-order derivatives such as `dFdx(dFdy(n))`.
// It is assumed that the expression `p` is continuous and therefore, expressions evaluated
// via non-uniform control flow may be undefined.
vec2 dFdx(vec2 p);

// _Available only in the fragment shader_, `dFdx` and `dFdy`
// return the partial derivative of expression `p` in x and y, respectively. Deviatives are calculated
// using local differencing. Expressions that imply higher order derivatives such as `dFdx(dFdx(n))` have undefined
// results, as do mixed-order derivatives such as `dFdx(dFdy(n))`.
// It is assumed that the expression `p` is continuous and therefore, expressions evaluated
// via non-uniform control flow may be undefined.
vec3 dFdx(vec3 p);

// _Available only in the fragment shader_, `dFdx` and `dFdy`
// return the partial derivative of expression `p` in x and y, respectively. Deviatives are calculated
// using local differencing. Expressions that imply higher order derivatives such as `dFdx(dFdx(n))` have undefined
// results, as do mixed-order derivatives such as `dFdx(dFdy(n))`.
// It is assumed that the expression `p` is continuous and therefore, expressions evaluated
// via non-uniform control flow may be undefined.
vec4 dFdx(vec4 p);

// _Available only in the fragment shader_, `dFdx` and `dFdy`
// return the partial derivative of expression `p` in x and y, respectively. Deviatives are calculated
// using local differencing. Expressions that imply higher order derivatives such as `dFdx(dFdx(n))` have undefined
// results, as do mixed-order derivatives such as `dFdx(dFdy(n))`.
// It is assumed that the expression `p` is continuous and therefore, expressions evaluated
// via non-uniform control flow may be undefined.
float dFdy(float p);

// _Available only in the fragment shader_, `dFdx` and `dFdy`
// return the partial derivative of expression `p` in x and y, respectively. Deviatives are calculated
// using local differencing. Expressions that imply higher order derivatives such as `dFdx(dFdx(n))` have undefined
// results, as do mixed-order derivatives such as `dFdx(dFdy(n))`.
// It is assumed that the expression `p` is continuous and therefore, expressions evaluated
// via non-uniform control flow may be undefined.
vec2 dFdy(vec2 p);

// _Available only in the fragment shader_, `dFdx` and `dFdy`
// return the partial derivative of expression `p` in x and y, respectively. Deviatives are calculated
// using local differencing. Expressions that imply higher order derivatives such as `dFdx(dFdx(n))` have undefined
// results, as do mixed-order derivatives such as `dFdx(dFdy(n))`.
// It is assumed that the expression `p` is continuous and therefore, expressions evaluated
// via non-uniform control flow may be undefined.
vec3 dFdy(vec3 p);

// _Available only in the fragment shader_, `dFdx` and `dFdy`
// return the partial derivative of expression `p` in x and y, respectively. Deviatives are calculated
// using local differencing. Expressions that imply higher order derivatives such as `dFdx(dFdx(n))` have undefined
// results, as do mixed-order derivatives such as `dFdx(dFdy(n))`.
// It is assumed that the expression `p` is continuous and therefore, expressions evaluated
// via non-uniform control flow may be undefined.
vec4 dFdy(vec4 p);

// _Available only in the fragment shader_, `fwidth` returns the sum of
// the absolute derivatives in x and y using local differencing for the input argument `p`.
// It is equivalent to `abs(dFdx(p)) + abs(dFdy(p))`.
float fwidth(float p);

// _Available only in the fragment shader_, `fwidth` returns the sum of
// the absolute derivatives in x and y using local differencing for the input argument `p`.
// It is equivalent to `abs(dFdx(p)) + abs(dFdy(p))`.
vec2 fwidth(vec2 p);

// _Available only in the fragment shader_, `fwidth` returns the sum of
// the absolute derivatives in x and y using local differencing for the input argument `p`.
// It is equivalent to `abs(dFdx(p)) + abs(dFdy(p))`.
vec3 fwidth(vec3 p);

// _Available only in the fragment shader_, `fwidth` returns the sum of
// the absolute derivatives in x and y using local differencing for the input argument `p`.
// It is equivalent to `abs(dFdx(p)) + abs(dFdy(p))`.
vec4 fwidth(vec4 p);



}