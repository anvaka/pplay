vec2 bezier(vec2 p0, vec2 p1, vec2 p2, vec2 p3, float t) {
  float one_minus_t = 1. - t;
  return one_minus_t * one_minus_t * one_minus_t * p0 + 
    3. * one_minus_t * one_minus_t * t * p1 + 
    3. * one_minus_t * t * t * p2 +
    t * t * t * p3;
}

float bease(float t, vec2 p1, vec2 p2) {
  vec2 p0 = vec2(0.);
  vec2 p3 = vec2(1.);
  vec2 res = bezier(p0, p1, p2, p3, t);
  return res.y;
}

float bease(float t) {
  return bease(t, vec2(0.42, 0), vec2(1));
}