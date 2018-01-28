var loadedLinks = new Map(); // from link to response
var request = require('../util/request');

module.exports = function fetchGLSL(link) {
  if (!link) return Promise.reject('Missing link')
  var trimmed = link.trim();
  if (!trimmed) return Promise.reject('Missing link');

  let cachedResponse = loadedLinks.get(trimmed)
  if (cachedResponse) return Promise.resolve(cachedResponse);

  return request(link).then(code => {
    loadedLinks.set(link, code);
    return code;
  });
}