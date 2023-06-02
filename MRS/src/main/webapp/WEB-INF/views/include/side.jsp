<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 가져오기 -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<!-- reset css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/commons.js" defer></script>

</head>

<body>

	<!-- 왼쪽 고정 menu, controller -->
	<div class="side">

		<!-- 페이지 넘어갈 곳 -->
		<div class="menu">
			<!-- 로그아웃상태에선 로그인, 회원가입 넣기 -->
			<c:if test="${accessToken == null}">
				<div>
					<a href="/mrs/login" class="spotify-login-button">
						<img src="${pageContext.request.contextPath}/img/Spotify_Logo_RGB_Black.png" alt="Spotify Logo" class="spotify-logo"> 
						<span class="login-text">로그인</span>
					</a>
					<p>${message} ${accessToken}</p>
					<h3 id="test_text"></h3>
				</div>
			</c:if>
			<!-- 로그인 되어있으면 환영인사. -->
			<c:if test="${accessToken != null}">
				<h1></h1>
				<h3 class="testCl">환영합니다.</h3>
				<a href="/mrs/logOut" class="logOut">log out</a>
			</c:if>

			<a class="mainBtn" href="#">main page</a>
			<a class="videoBtn" href="#">video page</a>
		</div>

		<!-- 에어팟 이미지 -->
		<div class="imgDiv">
			<img id="airImg"
				src="${pageContext.request.contextPath }/img/air.png" alt="#">
		</div>
		<section id="controller">
		<div class="display">
			<div class="flex">
				<div class="image">
					<img src="">
				</div>
				<div class="title"></div>
				<div class="artists"></div>
			</div>
			<ul class="play-lists">

			</ul>
		</div>
		<div class="btns">
			<button id="test-btn" class="hidden">아이디 받아오기</button>
			<button id="test-btn2">재생해보기</button>
			<button id="test-btn3">재생중인 트랙확인</button>
			<button id="test-btn31">재생중인 리스트확인</button>
			<button id="test-btn5">곡 추가</button>
			<button id="previousTrack">이전 곡</button>
			<button id="nextTrack">다음 곡</button>
			<button id="togglePlay">Play</button>
		</div>
	</section>
	</div>
</body>
</html>

<script>

 window.onload = function() {
	console.log('onload!');
	let display_name = '';
	let display_email = '';
	/* 닉네임 받아와서 사용 */
		fetch('https://api.spotify.com/v1/me',
				{
			headers : {"Authorization" : `Bearer ${accessToken}`}
			}).then(res => res.json())
			.then(data => {
				console.log(data);
				console.log(data.display_name);
				console.log(data.email);
				display_name = data.display_name;
				display_email = data.email;
				document.querySelector('.menu>h1').textContent = display_name + ' 님';
				
			});
	
}

	
	// 에어팟 클릭시 이미지 변경 및 컨트롤러 변경${pageContext.request.contextPath }

	var $airImg = document.getElementById("airImg");

	$airImg.onclick = function() {

		if ($airImg.getAttribute('src') === "${pageContext.request.contextPath}/img/air.png") {
			console.log('열렸따!');
			$airImg.setAttribute('src',
					"${pageContext.request.contextPath}/img/air2.png");
		} else if ($airImg.getAttribute('src') === "${pageContext.request.contextPath}/img/air2.png") {
			console.log('닫혔따!');
			$airImg.src = "${pageContext.request.contextPath}/img/air.png";
		}

	}
	let dId ='';
	document.getElementById('test-btn').addEventListener('click',e=>{
		fetch('https://api.spotify.com/v1/me/player/devices',{
			headers : {"Authorization" : `Bearer ${accessToken}`}
		}).then(res=>res.json())
		.then(data => {
			console.log(data);
			console.log(data.devices[0].id);
			dId = data.devices[0].id;
		});
	})
	
	document.getElementById('test-btn2').addEventListener('click',e=>{
		fetch('https://api.spotify.com/v1/me/player',{
			method : "put",
			headers : {
				"Authorization" : `Bearer ${accessToken}`,
				"Content-Type" : "application/json"
			},
			body : JSON.stringify({"device_ids" : [dId]})
		}).then();
	});
	
	 document.getElementById('test-btn3').addEventListener('click',e=>{
		fetch('https://api.spotify.com/v1/me/player/currently-playing',{
			headers : {
				"Authorization" : `Bearer ${accessToken}`,
			}
		}).then(res=>res.json())
		.then(data => console.log(data));
	})
		 
	 document.getElementById('test-btn5').addEventListener('click',e=>{
			fetch('https://api.spotify.com/v1/me/player/queue?uri=spotify:track:4Dr2hJ3EnVh2Aaot6fRwDO',{
				method : "post",
				headers : {
					"Authorization" : `Bearer ${accessToken}`,
				}
			}).then(console.log('post 전송완료'));
		});
	//재생목록 받아오기
	function getList(){
		fetch('https://api.spotify.com/v1/me/player/queue',{
			headers : {
				"Authorization" : `Bearer ${accessToken}`,
			}
		}).then(res=>res.json())
		.then(data=>{
			[...document.querySelector('#controller .play-lists').children].forEach(c=>c.remove());
			[...data.queue].forEach(q => {
				document.querySelector('#controller .play-lists').insertAdjacentHTML('beforeend',`
						<li>
					<p>`+q.name+` : `+q.artists[0].name+`<p>
				</li>`);
			})
			console.log(data.queue)});
	}

	 
	 //검색 결과 재생	 

	window.onSpotifyWebPlaybackSDKReady = () => {
            const token = `${accessToken}`;
            player = new Spotify.Player({
                name: 'Web Playback SDK Quick Start Player',
                getOAuthToken: cb => { cb(token); },
                volume: 0.5
            });

            // Ready
            player.addListener('ready', ({ device_id }) => {
                console.log('Ready with Device ID', device_id);
                document.getElementById('test-btn').click();
            });

            // Not Ready
            player.addListener('not_ready', ({ device_id }) => {
                console.log('Device ID has gone offline', device_id);
            });
            
            player.connect();
            player.activateElement();
            
            //재생버튼
            document.getElementById('togglePlay').onclick = function() {
            	  player.togglePlay();
            	};        
            
            //이전 곡 버튼
            document.getElementById('previousTrack').addEventListener('click',()=>{
            	player.previousTrack();
            })
            //다음 곡 버튼
            document.getElementById('nextTrack').addEventListener('click',()=>{
            	player.nextTrack();
            })
            
         	//재생 상태 변경 감지
           	player.addListener('player_state_changed', ({
           		  position,
           		  duration,
           		  paused,
           		  track_window: { current_track }

           		}) => {
           		  console.log('paused?',paused);
           		  console.log('Currently Playing', current_track);
           		  console.log('Position in Song', position);
           		  console.log('Duration of Song', duration);
           		//현재 곡 출력
           		document.querySelector('#controller .image img').src =
    				current_track.album.images[1].url;
    			document.querySelector('#controller .title').textContent =
    				current_track.name;
    			document.querySelector('#controller .artists').textContent =
    				current_track.artists[0].name;
    			
    			getList();
    			
    			//재생버튼 변경
    			if(paused){ //정지중이면
    				document.getElementById('togglePlay').textContent = 'Play';
    			}else { //재생중이면
    				document.getElementById('togglePlay').textContent = 'Pause';
    			}
          	});//end player.addListener('player_state_changed'
            
	}//end window.onSpotifyWebPlaybackSDKReady

</script>