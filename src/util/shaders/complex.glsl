// based on https://github.com/rust-num/num-complex/blob/master/src/lib.rs
// Copyright 2013 The Rust Project Developers. MIT license
// Ported to GLSL by Andrei Kashcha (github.com/anvaka), available under MIT license as well.


// Returns a complex number z = 1 + i * 0.
vec2 c_one() { return vec2(1., 0.); }

// Returns a complex number z = 0 + i * 1.
vec2 c_i() { return vec2(0., 1.); }

float arg(vec2 c) {
  return atan(c.y, c.x);
}

// Returns conjugate of a complex number.
vec2 c_conj(vec2 c) {
  return vec2(c.x, -c.y);
}

vec2 c_from_polar(float r, float theta) {
  return vec2(r * cos(theta), r * sin(theta));
}

vec2 c_to_polar(vec2 c) {
  return vec2(length(c), atan(c.y, c.x));
}

// Computes `e^(c)`, where `e` is the base of the natural logarithm.
vec2 c_exp(vec2 c) {
  return c_from_polar(exp(c.x), c.y);
}


// Raises a floating point number to the complex power `c`.
vec2 c_exp(float base, vec2 c) {
  return c_from_polar(pow(base, c.x), c.y * log(base));
}

// Computes the principal value of natural logarithm of `c`.
vec2 c_ln(vec2 c) {
  vec2 polar = c_to_polar(c);
  return vec2(log(polar.x), polar.y);
}

// Returns the logarithm of `c` with respect to an arbitrary base.
vec2 c_log(vec2 c, float base) {
  vec2 polar = c_to_polar(c);
  return vec2(log(polar.r), polar.y) / log(base);
}

// Computes the square root of complex number `c`.
vec2 c_sqrt(vec2 c) {
  vec2 p = c_to_polar(c);
  return c_from_polar(sqrt(p.x), p.y/2.);
}

// Raises `c` to a floating point power `e`.
vec2 c_pow(vec2 c, float e) {
  vec2 p = c_to_polar(c);
  return c_from_polar(pow(p.x, e), p.y*e);
}

// Raises `c` to a complex power `e`.
vec2 c_pow(vec2 c, vec2 e) {
  vec2 polar = c_to_polar(c);
  return c_from_polar(
     pow(polar.x, e.x) * exp(-e.y * polar.y),
     e.x * polar.y + e.y * log(polar.x)
  );
}

// Computes the complex product of `self * other`.
vec2 c_mul(vec2 self, vec2 other) {
    return vec2(self.x * other.x - self.y * other.y, 
                self.x * other.y + self.y * other.x);
}

vec2 c_div(vec2 self, vec2 other) {
    float norm = length(other);
    return vec2(self.x * other.x + self.y * other.y,
                self.y * other.x - self.x * other.y)/(norm * norm);
}

vec2 c_sin(vec2 c) {
  return vec2(sin(c.x) * cosh(c.y), cos(c.x) * sinh(c.y));
}

vec2 c_cos(vec2 c) {
  // formula: cos(a + bi) = cos(a)cosh(b) - i*sin(a)sinh(b)
  return vec2(cos(c.x) * cosh(c.y), -sin(c.x) * sinh(c.y));
}

vec2 c_tan(vec2 c) {
  vec2 c2 = 2. * c;
  return vec2(sin(c2.x), sinh(c2.y))/(cos(c2.x) + cosh(c2.y));
}

vec2 c_atan(vec2 c) {
  // formula: arctan(z) = (ln(1+iz) - ln(1-iz))/(2i)
  vec2 i = c_i();
  vec2 one = c_one();
  vec2 two = one + one;
  if (c == i) {
    return vec2(0., 1./1e-10);
  } else if (c == -i) {
    return vec2(0., -1./1e-10);
  }

  return c_div(
    c_ln(one + c_mul(i, c)) - c_ln(one - c_mul(i, c)),
    c_mul(two, i)
  );
}

vec2 c_asin(vec2 c) {
 // formula: arcsin(z) = -i ln(sqrt(1-z^2) + iz)
  vec2 i = c_i(); vec2 one = c_one();
  return c_mul(-i, c_ln(
    c_sqrt(c_one() - c_mul(c, c)) + c_mul(i, c)
  ));
}

vec2 c_acos(vec2 c) {
  // formula: arccos(z) = -i ln(i sqrt(1-z^2) + z)
  vec2 i = c_i();

  return c_mul(-i, c_ln(
    c_mul(i, c_sqrt(c_one() - c_mul(c, c))) + c
  ));
}

vec2 c_sinh(vec2 c) {
  return vec2(sinh(c.x) * cos(c.y), cosh(c.x) * sin(c.y));
}

vec2 c_cosh(vec2 c) {
  return vec2(cosh(c.x) * cos(c.y), sinh(c.x) * sin(c.y));
}

vec2 c_tanh(vec2 c) {
  vec2 c2 = 2. * c;
  return vec2(sinh(c2.x), sin(c2.y))/(cosh(c2.x) + cos(c2.y));
}

vec2 c_asinh(vec2 c) {
  // formula: arcsinh(z) = ln(z + sqrt(1+z^2))
  vec2 one = c_one();
  return c_ln(c + c_sqrt(one + c_mul(c, c)));
}

vec2 c_acosh(vec2 c) {
  // formula: arccosh(z) = 2 ln(sqrt((z+1)/2) + sqrt((z-1)/2))
  vec2 one = c_one();
  vec2 two = one + one;
  return c_mul(two,
      c_ln(
        c_sqrt(c_div((c + one), two)) + c_sqrt(c_div((c - one), two))
      ));
}

vec2 c_atanh(vec2 c) {
  // formula: arctanh(z) = (ln(1+z) - ln(1-z))/2
  vec2 one = c_one();
  vec2 two = one + one;
  if (c == one) {
      return vec2(1./1e-10, vec2(0.));
  } else if (c == -one) {
      return vec2(-1./1e-10, vec2(0.));
  }
  return c_div(c_ln(one + c) - c_ln(one - c), two);
}

// Attempts to identify the gaussian integer whose product with `modulus`
// is closest to `c`
vec2 c_rem(vec2 c, vec2 modulus) {
  vec2 c0 = c_div(c, modulus);
  // This is the gaussian integer corresponding to the true ratio
  // rounded towards zero.
  vec2 c1 = vec2(c0.x - mod(c0.x, 1.), c0.y - mod(c0.y, 1.));
  return c - c_mul(modulus, c1);
}

vec2 c_inv(vec2 c) {
  float norm = length(c);
	return vec2(c.x, -c.y) / (norm * norm);
}
