var request = require('./request');

module.exports = function fetchGist(protoGist) {
  var parts = protoGist.split('/');
  return request(`https://api.github.com/gists/${parts[0]}`)
  .then(res => extractFileContent(res, parts))
  .catch(err => {
    if (err && err.response && err.response.match(/rate limit/)) {
      // Try one more time from cache
      return request(`https://d2enmttf0dqrei.cloudfront.net/${parts[0]}`)
        .then(res => extractFileContent(res, parts));
    }
  });
}

function extractFileContent(res, parts) {
  var parsedRes = JSON.parse(res);
  var fileName = parts.length > 1 && parts[1];
  if (!fileName) {
    // pick first file
    fileName = Object.keys(parsedRes.files).filter(x => x.match(/\.glsl$/))[0];
  }
  var file = parsedRes.files[fileName];
  if (!file) throw new Error('Missing gist file ' + parts[0] + '/' + fileName);

  return file.content;
}