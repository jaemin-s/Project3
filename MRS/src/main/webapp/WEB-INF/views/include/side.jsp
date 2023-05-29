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


</body>
</html>


<script>
</script>