
<!DOCTYPE html>
<html>
<head>
    <title>Spotify Web Playback SDK Quick Start</title>
</head>
<body>
    <h1>Spotify Web Playback SDK Quick Start</h1>
    <button id="togglePlay">Toggle Play</button>

    <script src="https://sdk.scdn.co/spotify-player.js"></script>
    <script>
        window.onSpotifyWebPlaybackSDKReady = () => {
            const token = 'BQBlAC7-6n7iWPvfLCgOjQddl05Av_zzd8iH_DigtT3SOKiK6_0UDR_nc2NwXrW2ONaO0Js_XlVqyUbFQyeA6EN7--43LpWr65BwmEgM0TedR3tL7DT54zUvsq3WEZeFYNFEx2nStovKfu7x6erZsfDm2q_pVbD41sSsY3puSCwd1dRwU93ELUYuFKqjtaHgrtUw-v6QiLLLTM8qRE_ictgqFub7n4K9';
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
            
        }
    </script>
</body>
</html>