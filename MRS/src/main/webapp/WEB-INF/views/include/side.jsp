<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 가져오기 -->
<link href="${pageContext.request.contextPath }/css/style.css"
	rel="stylesheet">
<!-- reset css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">


</head>
<body>

	<!-- 사이드 메뉴, 컨트롤러 -->
	<ul class="side">

		<!-- 페이지 넘어갈 곳 -->
		<div class="menu">
			<a href="">로그인</a> 
			<a href="">노래 상세보기</a> 
			<a href="">찜목록</a> 
			<a href="">sim sound</a>
		</div>

		<!-- 에어팟 이미지 -->
		<div class="imgDiv">
			<img id="airImg"
				src="${pageContext.request.contextPath }/img/airpods1.png" alt="#">
		</div>

		<!-- 뒤에 애니메이션 (변경 예정) -->
		<div calss="body">
			<div class="staggering-grid-demo">
				<%for(int i=1; i<=625; i++) {  %>
				<div class="el"></div>
				<%}  %>
			</div>
		</div>

		<!-- 음악 컨트롤러 -->
		<div class="controller-module">
		
			<ul>
			<!-- 왼쪽 커버이미지 -->
				<li class="controller-cover"><img
					src="${pageContext.request.contextPath }/img/밤편지2.jpg" /></li>
				<li class="controller-info">
				
					<h1>The Noisy Freaks</h1> <!-- 팀명 -->
					<h4>Premiere</h4> <!-- 소속사 -->
					<h2>I Need You Back</h2> <!-- 노래 제목 -->
					
					<!-- 우측 하단 버튼 -->
					<div class="controller-button-items">
						<!-- 오디오 -->
						<!-- <audio id="music" preload="auto" loop="false">
							<source
								src="https://dl.dropbox.com/s/oswkgcw749xc8xs/The-Noisy-Freaks.mp3?dl=1"
								type="audio/mp3">
							<source
								src="https://dl.dropbox.com/s/75jpngrgnavyu7f/The-Noisy-Freaks.ogg?dl=1"
								type="audio/ogg">
						</audio> -->
						<!-- 진행시간 바 -->
						<div id="controller-slider">
							<div id="controller-elapsed"></div> <!-- 진행중인 바 -->
						</div>
						<p id="controller-timer">0:00</p> <!-- 타이머 -->
						
						
						
						<!-- 우측 하단 진행 버튼 -->
						<div class="controller-controls">
						
							<!-- 이전 버튼 < -->
							<span class="controller-expend"><svg class="controller-step-backward"
									viewBox="0 0 25 25" xml:space="preserve">
                                <g>
									<polygon
										points="4.9,4.3 9,4.3 9,11.6 21.4,4.3 21.4,20.7 9,13.4 9,20.7 4.9,20.7" /></g>
                                </svg></span>

							<!-- 재생 버튼 -->
							<svg id="controller-play" viewBox="0 0 25 25" xml:space="preserve">
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
							<svg id="controller-pause" viewBox="0 0 25 25" xml:space="preserve">
                                <g>
                                    <rect x="6" y="4.6" width="3.8"
									height="15.7" />
                                    <rect x="14" y="4.6" width="3.9"
									height="15.7" />
                                </g>
                                </svg>

							<!-- 다음 버튼 > -->
							<span class="controller-expend"><svg class="controller-step-foreward"
									viewBox="0 0 25 25" xml:space="preserve">
                                <g>
									<polygon
										points="20.7,4.3 16.6,4.3 16.6,11.6 4.3,4.3 4.3,20.7 16.7,13.4 16.6,20.7 20.7,20.7" /></g>
                                </svg></span>
						</div>
					</div>
				</li>
			</ul>
		</div>

	
	</ul>

	<div id="player"></div> <!-- 1. Youtube iframe 들어갈 자리 --> 
	
	<div id="test-controller">
		<i class="fa-solid fa-backward-step backward-btn"></i>
		<i class="fa-solid fa-play play-btn"></i>
		<i class="fa-solid fa-pause pause-btn" style="display:none;"></i>
		<i class="fa-solid fa-stop stop-btn"></i>
		<i class="fa-solid fa-forward-step forward-btn"></i>
		<i class="fa-solid fa-volume-off volume-btn"></i>
		<i class="fa-solid fa-volume-xmark volumeX-btn"></i>
		<i class="fa-solid fa-repeat change-list"></i>
	</div>


</body>
</html>


<script>

	document.cookie = "SameSite=None; Secure";
	
	// 버튼 조작
	document.querySelector('#test-controller').addEventListener('click',e=>{
		console.log(e.target);
		if(e.target.classList.contains('play-btn')){
			console.log('재생 버튼 클릭');
			clickPlayBtn(e.target.parentNode);
		}else if(e.target.classList.contains('pause-btn')){
			console.log('일지정지 버튼 클릭');
			clickPauseBtn(e.target.parentNode);
		}else if(e.target.classList.contains('backward-btn')){
			console.log('이전곡버튼 클릭');
			//clickPreBtn(e.target.parentNode);
			player.previousVideo();
		}else if(e.target.classList.contains('forward-btn')){
			console.log('다음곡 버튼 클릭');
			//clickNextBtn(e.target.parentNode);
			player.nextVideo();
		}else if(e.target.classList.contains('stop-btn')){
			console.log('정지 버튼 클릭');
			clickStopBtn(e.target.parentNode);
		}else if(e.target.classList.contains('volume-btn')){
			console.log('볼륨 버튼 클릭');
			player.mute();
		}else if(e.target.classList.contains('volumeX-btn')){
			console.log('볼륨X 버튼 클릭');
			player.unMute();
		}else if(e.target.classList.contains('change-list')){
			console.log('재생목록 바꾸기');
			player.loadPlaylist(otherList);
			player.setLoop(true);
		}
		// isMuted() : 음소거면 true, 아니면 false
		// setVolume(number) : 볼륨을 설정 0~100 정수
		// getVolume() : 현재 볼륨을 반환
	});// 버튼 조작 끝
	
	function clickPlayBtn(p){
		player.playVideo();
		p.querySelector(".play-btn").style.display = "none";
		p.querySelector(".pause-btn").style.display = "block";
	} 
	
	function clickPauseBtn(p){
		player.pauseVideo();
		p.querySelector(".play-btn").style.display = "block";
		p.querySelector(".pause-btn").style.display = "none";
	} 
	
	function clickStopBtn(p){
		player.stopVideo();
		p.querySelector(".play-btn").style.display = "block";
		p.querySelector(".pause-btn").style.display = "none";
	}
	
	function clickNextBtn(p){
		idx = idx === idList.length-1 ? 0 : ++idx; 
		player.loadVideoById(idList[idx]);
	}
	
	function clickPreBtn(p){
		idx = idx === 0 ? idList.length-1 : --idx; 
		player.loadVideoById(idList[idx]);
	}
	
	
	
	

   /*  var music = document.getElementById("music");
    var playButton = document.getElementById("controller-play");
    var pauseButton = document.getElementById("controller-pause");
    var playhead = document.getElementById("controller-elapsed");
    var timeline = document.getElementById("controller-slider");
    var timer = document.getElementById("controller-timer");
    var duration;
    var airImg = document.getElementById("airImg");
    var imgDiv = document.querySelector(".imgDiv");
    var anim = document.querySelector(".staggering-grid-demo");
    pauseButton.style.visibility = "hidden";

    var timelineWidth = timeline.offsetWidth - playhead.offsetWidth;
    music.addEventListener("timeupdate", timeUpdate, false); */

  /* 재생 진행 바 기능   
  	function timeUpdate() {
    var playPercent = timelineWidth * (music.currentTime / duration);
    playhead.style.width = playPercent + "px";

    var secondsIn = Math.floor((music.currentTime / duration / 3.5) * 100);
    if (secondsIn <= 9) {
        timer.innerHTML = "0:0" + secondsIn;
    } else {
        timer.innerHTML = "0:" + secondsIn;
    }
    } */

    
    /*
    	재생 버튼 클릭 이벤트
    	에어팟 이미지도 같이 변경
    	뒤에 애니메이션도 시작 멈춤 (변경 예정)
    
   	playButton.onclick = function() {
    	console.log("1111");
    	music.play(); 음악 재생
    	playButton.style.visibility = "hidden"; 재생버튼 안보이게하기
    	pauseButton.style.visibility = "visible"; 멈춤 버튼 나타내기
        airImg.src = "${pageContext.request.contextPath}/img/airpods1.png";
        imgDiv.style.width = "45.2%";
        animation.play(); 애니메이션 움직임
    };    
 	/*
    	멈춤 버튼 클릭 이벤트
    	재생 반대
    */
    /*
    pauseButton.onclick = function() {
    	music.pause();
        playButton.style.visibility = "visible";
        pauseButton.style.visibility = "hidden";
        airImg.src = "${pageContext.request.contextPath}/img/airpods2.png";
        imgDiv.style.width = "50%";
        animation.pause();
     };
     */
     /* 
     	에어팟 이미지 클릭 이벤트 
     	노래 멈춤 시작 같이 되게
     */
     /*
     airImg.onclick = function() {
    	 
    	 if(airImg.getAttribute('src') === "${pageContext.request.contextPath}/img/airpods2.png") {
    		 console.log('열렸따!');
    		 music.play();
    	    	playButton.style.visibility = "hidden";
    	    	pause.style.visibility = "visible";
    	        airImg.setAttribute('src', "${pageContext.request.contextPath}/img/airpods1.png");
    	        imgDiv.style.width = "45.2%";
    	        animation.play();
    	 }
    	 else if(airImg.getAttribute('src') === "${pageContext.request.contextPath}/img/airpods1.png"){
    		 	console.log('닫혔따!');
    		 	music.pause();
    	        playButton.style.visibility = "visible";
    	        pause.style.visibility = "hidden";
    	        airImg.src = "${pageContext.request.contextPath}/img/airpods2.png";
    	        imgDiv.style.width = "50%";
    	        animation.pause();
    	 }
   
    	 
     } 	*/
     
     let vId = "Y8JFxS1HlDo"; // videoId
     let idList = ["Y8JFxS1HlDo","D1PvIWdJ8xo","0-q1KafFCLU","42Gtm4-Ax2U","F0B7HDiY-10"]; // 플레이리스트
     let otherList = ["gdZLi9oWNZg","XsX3ATc3FbA","MBdVXkSdhwU","7C2z4GqqS5E","7HDeem-JaSY"];
     let idx = 0;
		
		
		// 여기부터 iframe api, 속성값 빼고 건들지 말 것
		// 2. This code loads the IFrame Player API code asynchronously.
		
	     var tag = document.createElement('script');

	      tag.src = "https://www.youtube.com/iframe_api";
	      var firstScriptTag = document.getElementsByTagName('script')[0];
	      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	      // 3. This function creates an <iframe> (and YouTube player)
	      //    after the API code downloads.
	      var player;
	      function onYouTubeIframeAPIReady() {
	        player = new YT.Player('player', { //요청보낼 속성값 모은 객체
	          videoId: idList[0], 
	          host: 'https://www.youtube-nocookie.com',
	          height: '500',   
	          width: '500',
	          playerVars: { 
	        	  'autoplay': 1,
	        	  'controls': 0,
	        	  'disablekb' : 1,
	        	  'fs' : 0,
	        	  'modestbranding' : 1
	        	  },
	          origin,
	          events: {
	            'onReady': onPlayerReady,
	            'onStateChange': onPlayerStateChange
	          }
	        });
	      }

	      // 4. The API will call this function when the video player is ready.
	      function onPlayerReady(event) {
	        event.target.playVideo();
	        player.loadPlaylist(idList);
	        player.setLoop(true);
	      }

	      // 5. The API calls this function when the player's state changes.
	      //    The function indicates that when playing a video (state=1),
	      //    the player should play for six seconds and then stop.
	      var done = false;
	     function onPlayerStateChange(event) {
	        if (event.data == YT.PlayerState.PLAYING && !done) {
	          //setTimeout(stopVideo, 6000);
	          done = true;
	        }
	      } 
	      function stopVideo() {
	        player.stopVideo();
	      }
    
     /*music.addEventListener(
    "canplaythrough",
    function () {
        duration = music.duration;
    },
    false
    );
*/

</script>
<!-- 애니메이션(변경예정) -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
<script>

	/*
    var animation = anime({
      targets: '.staggering-grid-demo .el',
      scale: [
        {value: 0.1, easing: 'easeOutSine', duration: 125},
        {value: 1, easing: 'easeInOutQuad', duration: 300}
      ],
      delay: anime.stagger(156.25, {grid: [25, 25], from: 'center'}),
      loop: true,
      autoplay: false
    });*/
    
    //iframe 조작
    /* const $playBtn = document.getElementById('playBtn');
	$playBtn.addEventListener('click',function(){
		console.log('클릭');
		let state = player.getPlayerState();
		console.log(state);
		if(state == -1||state == 2){
			player.playVideo();
			console.log("재생");
		}else if(state == 5){
			console.log(player.getCurrentTime());
			console.log(player.getDuration());
			player.playVideo();
		}else if(state == 1){
			player.pauseVideo();
			console.log("일시정지");
		}
	});  */
  </script>