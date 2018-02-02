
module.exports = isSoundCloud;

function isSoundCloud(url) {
  return url.match(/^https?:\/\/soundcloud\.com\//);
}