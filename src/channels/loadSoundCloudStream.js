// Based on https://github.com/michaelbromley/soundcloud-visualizer
// Copyright (c) 2013 Michael Bromley <michael@michaelbromley.co.uk>
// Adopted to pplay needs by Andrei Kashcha. (C) 2018 MIT License

/* global SC */
module.exports = loadSoundCloudStream;

var client_id = "oyOHfaO0Xhi6nqwntte71KmwsEQbCmCG"; // to get an ID go to https://developers.soundcloud.com/

function loadSoundCloudStream(track_url) {
  if (typeof SC === 'undefined') {
      return new Promise((resolve, reject) => {
          var scAPI = document.createElement('script');
          scAPI.setAttribute('src', '//connect.soundcloud.com/sdk.js');
          scAPI.onload = resolve;
          scAPI.onerror = reject;
          document.head.appendChild(scAPI);
      }).then(() => loadSoundCloudStream(track_url));
  }

  return new Promise((successCallback, errorCallback) => {
    SC.initialize({client_id: client_id});

    SC.get('/resolve', { url: track_url }, function(sound) {
      if (sound.errors) {
        var errorMessage = "";
        for (var i = 0; i < sound.errors.length; i++) {
          errorMessage += sound.errors[i].error_message + '.';
        }
        errorMessage += 'Make sure the URL has the correct format: https://soundcloud.com/user/title-of-the-track';
        errorCallback(errorMessage);
      } else {
        var streamUrl;
        if (sound.kind === 'playlist') {
            var streamPlaylistIndex = 0;
            streamUrl = sound.tracks[streamPlaylistIndex].stream_url + '?client_id=' + client_id;
        } else {
            streamUrl = sound.stream_url + '?client_id=' + client_id; 
        }
        successCallback(streamUrl);
      }
    });
  });
}
