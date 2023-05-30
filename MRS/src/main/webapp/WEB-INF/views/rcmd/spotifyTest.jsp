<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Spotify Web Playback SDK Quick Start</title>
    <script src="https://sdk.scdn.co/spotify-player.js"></script>
	<script src="https://open.spotify.com/embed-podcast/iframe-api/v1" async></script>
</head>
<body>
    <h1>Spotify Web Playback SDK Quick Start</h1>
    <button id="togglePlay">Toggle Play</button>
    <div id="embed-iframe"></div>
    <div class="episodes">
	<button class="episode" data-spotify-id="spotify:track:4Dr2hJ3EnVh2Aaot6fRwDO">
	  IU blueming
	</button>
	<button class="episode" data-spotify-id="spotify:playlist:37i9dQZF1DXdVcYTitfRUu">
	  드라이빙
	</button>
	<button class="episode" data-spotify-id="spotify:search:비오는%20날:tracks">
	  비오는 날 검색
	</button>
    <script>

        window.onSpotifyWebPlaybackSDKReady = () => {
            const token = '${accessToken}';
            console.log(token);
            const player = new Spotify.Player({
                name: 'Web Playback SDK Quick Start Player',
                getOAuthToken: cb => { cb(token); },
                volume: 0.5,
                enableMediaSession : true
            });

            // Ready
            player.addListener('ready', ({ device_id }) => {
                console.log('Ready with Device ID', device_id);
            });

            // Not Ready
            player.addListener('not_ready', ({ device_id }) => {
                console.log('Device ID has gone offline', device_id);
            });

            player.addListener('initialization_error', ({ message }) => {
                console.error(message);
            });

            player.addListener('authentication_error', ({ message }) => {
                console.error(message);
            });

            player.addListener('account_error', ({ message }) => {
                console.error(message);
            });

            document.getElementById('togglePlay').onclick = function() {
            	console.log("click");
              player.togglePlay();
            };

            player.connect();
            
            const baseUrl = "https://api.spotify.com/"; 
            
        }
        
        window.onSpotifyIframeApiReady = (IFrameAPI) => {
        	  //
       	};
        	
       	window.onSpotifyIframeApiReady = (IFrameAPI) => {
            const element = document.getElementById('embed-iframe');
            const options = {
              width: '400',
              height: '200',
              uri: 'spotify:episode:7makk4oTQel546B0PZlDM5'
            };
            const callback = (EmbedController) => {
              document.querySelectorAll('.episode').forEach(
                episode => {
                  episode.addEventListener('click', () => {
                    EmbedController.loadUri(episode.dataset.spotifyId)
                  });
                })
            };
            IFrameAPI.createController(element, options, callback);
          };
    </script>
</body>
</html>