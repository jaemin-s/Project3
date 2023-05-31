<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메인 화면 -->
<section class="main">
	<%@ include file="include/side.jsp"%>

	<div class="main-right" id="main-right">

		<ul>
			<!-- 검색 기능  -->
			<li class="search"><a>search</a></li>

			<!-- 로고 이미지 -->
			<div class="main-logo-img">
				<img id=""
					src="${pageContext.request.contextPath }/img/logo_whi.png" alt="#">
			</div>

			<!-- 노래 모음 설명 -->
			<li class="choose">
				<!-- 추천 테이블 -->
				<div class="choose-text">them by feeling</div> <!-- 추천 테이블 이미지 -->
				<div id="choose-imgs" class="choose-img">
					<img data-keyword="happy" 
						src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img data-keyword="sad" 
						src="${pageContext.request.contextPath }/img/mood_2_Hip.png" alt="#">
					<img data-keyword="rain" 
						src="${pageContext.request.contextPath }/img/mood_4_Sad.png" alt="#">
					<img data-keyword="love" 
						src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"	alt="#">
					<img data-keyword="happy" 
						src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img data-keyword="happy" 
						src="${pageContext.request.contextPath }/img/mood_2_Hip.png" alt="#">
					<img data-keyword="happy" 
						src="${pageContext.request.contextPath }/img/mood_4_Sad.png" alt="#">
					<img data-keyword="happy" 
						src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"	alt="#">
					<img data-keyword="happy" 
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
		<a href="/mrs/login" class="spotify-login-button">
	<img src="${pageContext.request.contextPath}/img/Spotify_Icon_RGB_Black.png" alt="Spotify Logo" class="spotify-logo">
	<span class="login-text">로그인</span>
	</a>
	<p>${message}</p>
	<h3 id="test_text"></h3>

<%@ include file="include/detail.jsp"%>
</section>

<script type="text/javascript">


	//document.getElementById('happy-btn').addEventListener('click',function(){
	//	location.href ="${pageContext.request.contextPath}/rcmd/spotifyTest";
	//});
	
	document.getElementById('choose-imgs').addEventListener('click',e=>{
		let seedArtists = '5TnQc2N1iKlFjYD7CPGvFc';
		let seedGenres = '행복 신남';
		let seedTracks = '0EhdXt3y460mTRsi97Pyk5';
//		fetch('https://api.spotify.com/v1/recommendations?limit=1&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle',
		fetch('https://api.spotify.com/v1/me',
				{
			headers : {"Authorization" : `Bearer ${accessToken}`}
			}).then(res => res.json())
			.then(data => {
				console.log(data);
				//console.log(data.tracks[0].name);
				//console.log(data.tracks[0].artists[0].name);
				//console.log(data.tracks[0].id);
				//console.log(data.tracks[0].album.images[0].url);
				console.log(data.display_name);
				console.log(data.email);
			});
	})

</script>