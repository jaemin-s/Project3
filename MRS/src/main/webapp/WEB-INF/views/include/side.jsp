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
	src="${pageContext.request.contextPath}/js/commons.js" defer></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/spotifyApi.js" defer></script>

</head>

<body>

	<!-- 왼쪽 고정 menu, controller -->
	<div class="side">

		<ul class="side-back"></ul>

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

			<a class="mainBtn" href="#">Main Page</a> <a class="videoBtn"
				href="#">Play List</a>
		</div>

		<!-- 에어팟 이미지 -->
		<div class="imgDiv">
			<img id="airImg"
				src="${pageContext.request.contextPath }/img/air.png" alt="#">
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
					<div id="content">
						<div id="range">
							<input type="range" id="range-val" value="0" min="0" max="143">
						</div>
						<div class="now-time">
							<div id="time">
								<p>0:00</p>
							</div>
							<div id="total-time">
								<p>2:23</p>
							</div>
						</div>
					</div>



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
			</ul>
		</div>
		<input type="hidden" value="${accessToken}" name="token">
	</div>
</body>

</html>


<script>

/* 의열 작성 시작 */
const $testCl = document.querySelector(".testCl");

	/* 로그인 안하고 다른거 눌렀을 시 */
	const $main = document.querySelector(".main");
	
	if(${accessToken == null}) {
	$main.onclick = function(e) {
		console.log(e.target);
		if(!e.target.parentNode.classList.contains('spotify-login-button')) {
				alert('로그인은 필수 입니다.');
				return location.href="${pageContext.request.contextPath}/login";
			}
		}
	}
	
	// 에어팟 클릭시 이미지 변경 및 컨트롤러 변경${pageContext.request.contextPath }

	const $airImg = document.getElementById("airImg");
	const $sideBack = document.querySelector(".side-back");
	/* 에어팟 이미지 클릭 시 */
	$airImg.onclick = function() {
		/* 노래선택 안하면 선택해달라고 부탁하기 */
		if($videoImg.src == 'http://localhost/mrs/success?message=Authentication+successful%21') {
        	alert('노래를 먼저 선택해주세요');
			return;
        }
		player.togglePlay();
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
    }
	

	
    /* 의열 작성 마감 */
    
    //다음 버튼 클릭
	document.getElementById('nextTrack').addEventListener('click',e=>{
		skipToNext();
	});
    //이전 버튼 클릭
	document.getElementById('previousTrack').addEventListener('click',e=>{
		skipToPrevious();
	});
    
    $contPlay.addEventListener('click',e=>{
        player.togglePlay();
    });

    $contPause.addEventListener('click',e=>{
    	player.togglePlay();
    });
    

    

    


</script>

