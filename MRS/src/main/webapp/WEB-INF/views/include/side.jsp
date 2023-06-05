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
					<a href="/mrs/login" class="spotify-login-button"> <img
						src="${pageContext.request.contextPath}/img/Spotify_Logo_RGB_Black.png"
						alt="Spotify Logo" class="spotify-logo"> <span
						class="login-text">로그인</span>
					</a>
					<h3 id="test_text"></h3>
				</div>
			</c:if>
			<!-- 로그인 되어있으면 환영인사. -->
			<c:if test="${accessToken != null}">
				<h1></h1>
				<h3 class="testCl">환영합니다.</h3>
				<a href="/mrs/logOut" class="logOut">log out</a>
			</c:if>

			<a class="mainBtn" href="#">main page</a> <a class="videoBtn"
				href="#">video page</a>
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
						<img>
					</div>
					<div class="title"></div>
					<div class="artists"></div>
				</div>
				<ul class="play-lists">

				</ul>
			</div>

			<!-- 음악 컨트롤러 -->
			<div class="controller-module">

				<ul>
					<!-- 왼쪽 커버이미지 -->

					<!-- 팀명 -->
					<h1 class="singer-name">singer</h1>
					<!-- 노래 제목 -->
					<h2 class="song-title">title</h2>

					<!-- 우측 하단 버튼 -->
					<div class="controller-button-items">
						<!-- 진행시간 바 -->
						<div id="controller-slider">
							<div id="controller-elapsed"></div>
							<!-- 진행중인 바 -->
						</div>
						<p id="controller-timer">0:00</p>
						<!-- 타이머 -->



						<!-- 우측 하단 진행 버튼 -->
						<div class="controller-controls">

							<!-- 이전 버튼 < -->
							<span id="previousTrack" class="controller-expend"><svg
									class="controller-step-backward" viewBox="0 0 25 25"
									xml:space="preserve">
                                <g>
									<polygon
										points="4.9,4.3 9,4.3 9,11.6 21.4,4.3 21.4,20.7 9,13.4 9,20.7 4.9,20.7" /></g>
                                </svg></span>

							<!-- 재생 버튼 -->
							<svg id="controller-play" viewBox="0 0 25 25"
								xml:space="preserve">
                                    <defs>
								<rect x="-49.5" y="-132.9" width="446.4" height="366.4" /></defs>
                                <g>
								<circle fill="none" cx="12.5" cy="12.5" r="10.8" />
                                        <path fill-rule="evenodd"
									clip-rule="evenodd"
									d="M8.7,6.9V18c0,0,0.2,1.4,1.8,0l8.1-4.8c0,0,1.2-1.1-1-2L9.8,6.5 C9.8,6.5,9.1,6,8.7,6.9z" />
                                </g>
                                </svg>

							<!-- 멈춤 버튼 -->
							<svg id="controller-pause" viewBox="0 0 25 25"
								xml:space="preserve">
                                <g>
                                    <rect x="6" y="4.6" width="3.8"
									height="15.7" />
                                    <rect x="14" y="4.6" width="3.9"
									height="15.7" />
                                </g>
                                </svg>

							<!-- 다음 버튼 > -->
							<span id="nextTrack" class="controller-expend"><svg
									class="controller-step-foreward" viewBox="0 0 25 25"
									xml:space="preserve">
                                <g>
									<polygon
										points="20.7,4.3 16.6,4.3 16.6,11.6 4.3,4.3 4.3,20.7 16.7,13.4 16.6,20.7 20.7,20.7" /></g>
                                </svg></span>
						</div>
					</div>
					</li>
				</ul>
			</div>

			<!-- 연습용 컨트롤러 -->
			<div class="btns">
				<button id="test-btn" class="hidden">아이디 받아오기</button>
				<button id="test-btn2">재생해보기</button>
				<button id="test-btn3">재생중인 트랙확인</button>
				<button id="test-btn31">재생중인 리스트확인</button>
				<button id="test-btn5">곡 추가</button>
				<button id="togglePlay">Play</button>
			</div>
		</section>
	</div>
</body>
</html>

<script>


const $testCl = document.querySelector(".testCl");

	window.onload = function() {
	let myAccessToken = `${accessToken}`;
	if(${accessToken != null}) {
		console.log("닉넴 받아옴")
		/* 닉네임 받아와서 사용 */
			fetch('https://api.spotify.com/v1/me', {headers : {"Authorization" : `Bearer ${accessToken}`}})
				.then(res => res.json())
				.then(data => {
					console.log(data);
					console.log(data.display_name);
					console.log(data.email);
					display_name = data.display_name;
					display_email = data.email;
					document.querySelector('.menu>h1').textContent = display_name + ' 님';
					document.querySelector('.menu>h1').name = display_name;
					console.log(document.querySelector('.menu>h1').name);
					tokenChe =2;
				});
		}
	}
	/* 로그인 안하고 다른거 눌렀을 시 */
	const $main = document.querySelector(".main");
	
	if(${accessToken == null}) {
	$main.onclick = function(e) {
		console.log(e.target);
		if(!e.target.parentNode.classList.contains('spotify-login-button')) {
				alert('로그인은 필수 입니다.');
				return location.href="${pageContext.request.contextPath }/login";
			}
		}
	}
	
	// 에어팟 클릭시 이미지 변경 및 컨트롤러 변경${pageContext.request.contextPath }

	const $airImg = document.getElementById("airImg");
	/* 에어팟 이미지 클릭 시 */
	$airImg.onclick = function() {
		/* 노래선택 안하면 선택해달라고 부탁하기 */
		if($videoImg.src == 'http://localhost/mrs/success?message=Authentication+successful%21') {
        	alert('노래를 먼저 선택해주세요');
			return;
        }

		/* 노래 재생 시 */
		if ($airImg.getAttribute('src') === "${pageContext.request.contextPath}/img/air.png") {
			console.log('열렸따!');
			$airImg.setAttribute('src',
					"${pageContext.request.contextPath}/img/air2.png");
	        $contPlay.style.display = "none";
	        $contPause.style.display = "block";
		} 
		/* 노래 멈춤 */
		else if ($airImg.getAttribute('src') === "${pageContext.request.contextPath}/img/air2.png") {
			console.log('닫혔따!');
			$airImg.setAttribute('src', "${pageContext.request.contextPath}/img/air.png");
	        $contPlay.style.display = "block";
	        $contPause.style.display = "none";
		}
	}
	

	/* 컨트롤러 */
	const $contPlay = document.getElementById("controller-play");
    const $contPause = document.getElementById("controller-pause");
	/* 노래 재생 */
    $contPlay.onclick = function() {
    	if($videoImg.src == 'http://localhost/mrs/success?message=Authentication+successful%21') {
        	alert('노래를 먼저 선택해주세요');
			return;
        }
        $contPlay.style.display = "none";
        $contPause.style.display = "block";
        $airImg.setAttribute('src', "${pageContext.request.contextPath}/img/air2.png");
    }
    /* 노래 멈춤 */
    $contPause.onclick = function() {
        $contPlay.style.display = "block";
        $contPause.style.display = "none";
        $airImg.setAttribute('src', "${pageContext.request.contextPath}/img/air.png");
	}
	
	/* 연습 버튼 */
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
            	console.log("이전 곡 버튼 클릭!");
            })
            //다음 곡 버튼
            document.getElementById('nextTrack').addEventListener('click',()=>{
            	player.nextTrack();
            	console.log("다음 곡 버튼 클릭!");
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