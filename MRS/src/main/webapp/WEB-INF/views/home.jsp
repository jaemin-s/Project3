<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jsp"%>
<link rel="alternate" type="application/json+oembed"
	href="https://open.spotify.com/oembed?url=https://open.spotify.com/album/4ghBzVOTFoeKPPmyNKjVtI" />

<section>

	<a href="/mrs/login" class="spotify-login-button">
  <img src="${pageContext.request.contextPath}/img/Spotify_Icon_RGB_Black.png" alt="Spotify Logo" class="spotify-logo">
  <span class="login-text">로그인</span>
</a>
<p>${message}</p>

	<h1>여기는 section</h1>
	<table>
		<thead>
			<tr>
				<td>기준 일자</td>
				<td>기준 시각</td>
				<td>하늘 형태</td>
				<td>강수 형태</td>
				<td>기온</td>
			</tr>
		</thead>
		<tbody>
			<tr id="resultRow">
				<td>test</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>

	<button id="playBtn">재생</button>
	<!-- <iframe id="player" type="text/html" width="200" height="200" src="https://www.youtube.com/embed/0-q1KafFCLU"></iframe> -->
	<div id="player"></div>



</section>

<%@ include file="include/footer.jsp"%>
<script>
	//공공데이터 날씨
	/* window.onload = () => {
			
			const rsRow = [...document.querySelectorAll('#resultRow *')];
=======

<!-- 메인 화면 -->
<section class="main">
	<%@ include file="include/side.jsp"%>

	<div class="main-right" id="main-right">

		<ul>
			<!-- 검색 기능  -->
			<li class="search"><a>search</a></li>
>>>>>>> 21dd837209f3df61c2791e907d20aad31d89fc91

			<!-- 로고 이미지 -->
			<div class="main-logo-img">
				<img id=""
					src="${pageContext.request.contextPath }/img/logo_whi.png" alt="#">
			</div>

			<!-- 노래 모음 설명 -->
			<li class="choose">
				<!-- 추천 테이블 -->
				<div class="choose-text">them by feeling</div> <!-- 추천 테이블 이미지 -->
				<div class="choose-img">
					<img id="happy-btn"
						src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img id=""
						src="${pageContext.request.contextPath }/img/mood_2_Hip.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_4_Sad.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img id=""
						src="${pageContext.request.contextPath }/img/mood_2_Hip.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_4_Sad.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img id=""
						src="${pageContext.request.contextPath }/img/mood_2_Hip.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_4_Sad.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"
						alt="#">

				</div>

			</li>
		</ul>

	</div>

<%@ include file="include/detail.jsp"%>
</section>

<script type="text/javascript">

	document.getElementById('happy-btn').addEventListener('click',function(){
		location.href ="${pageContext.request.contextPath}/rcmd/spotifyTest";
	});

</script>


<<<<<<< HEAD

		} */

	const $playBtn = document.getElementById('playBtn');
	let vId = "0-q1KafFCLU";
	$playBtn.addEventListener('click', function() {
		console.log('클릭');
		let state = player.getPlayerState();
		console.log(state);
		if (state == -1 || state == 2) {
			player.playVideo();
			console.log("재생");
		} else if (state == 5) {
			console.log(player.getCurrentTime());
			console.log(player.getDuration());
			player.playVideo();
		} else if (state == 1) {
			player.pauseVideo();
			console.log("일시정지");
		}
	});

	// 2. This code loads the IFrame Player API code asynchronously.
	var tag = document.createElement('script');

	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	// 3. This function creates an <iframe> (and YouTube player)
	//    after the API code downloads.
	var player;
	function onYouTubeIframeAPIReady() {
		player = new YT.Player('player', {
			height : '100',
			width : '100',
			videoId : vId,
			events : {
				'onReady' : onPlayerReady,
				'onStateChange' : onPlayerStateChange
			}
		});
	}

	// 4. The API will call this function when the video player is ready.
	function onPlayerReady(event) {
		event.target.playVideo();
	}

	// 5. The API calls this function when the player's state changes.
	//    The function indicates that when playing a video (state=1),
	//    the player should play for six seconds and then stop.
	var done = false;
	function onPlayerStateChange(event) {
		if (event.data == YT.PlayerState.PLAYING && !done) {
			setTimeout(stopVideo, 6000);
			done = true;
		}
	}
	function stopVideo() {
		player.stopVideo();
	}
</script>
=======
>>>>>>> 21dd837209f3df61c2791e907d20aad31d89fc91
