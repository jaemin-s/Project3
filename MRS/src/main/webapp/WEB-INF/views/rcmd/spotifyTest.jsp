<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스포티파이 테스트 페이지</h1>
	<script src="https://sdk.scdn.co/spotify-player.js">
		const accessToken = 'BQClegmlM7WYLxwcZvSsnoangglOH9O4dienJnTJKNC6hL0w-mcBFi_sqC3r67i-zzlL9Bnr4xw3FKuDUf8pAxdb3sF3TrFhQSZKh8MzgpEVet7NLckgKsx3a0LmM-6dbI1O0FuEa25vAx AP1kpB7FFOaEMdz8vaWDw6xqbkVke-BNPC4QusF5pSFMqHKew6Sc6mBGuijxSKO3vfiA2C80DiVpS1Fx4P';
	
		window.onSpotifyWebPlaybackSDKReady = () => {
		  const token = accessToken;
		  const player = new Spotify.Player({
		    name: 'Web Playback SDK Quick Start Player',
		    getOAuthToken: cb => { cb(token); },
		    volume: 0.5
		  });
</script>
</body>
</html>