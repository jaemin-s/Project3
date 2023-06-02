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
				<div class="flex">
					<div id="choose-imgs" class="choose-img">
						<img data-keyword="happy"
							src="${pageContext.request.contextPath }/img/happy.png" alt="#">
						<img data-keyword="sad"
							src="${pageContext.request.contextPath }/img/mood_2_Hip.png"
							alt="#"> <img data-keyword="rain"
							src="${pageContext.request.contextPath }/img/mood_4_Sad.png"
							alt="#"> <img data-keyword="love"
							src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"
							alt="#"> <img data-keyword="happy"
							src="${pageContext.request.contextPath }/img/happy.png" alt="#">
						<img data-keyword="happy"
							src="${pageContext.request.contextPath }/img/mood_2_Hip.png"
							alt="#"> <img data-keyword="happy"
							src="${pageContext.request.contextPath }/img/mood_4_Sad.png"
							alt="#"> <img data-keyword="happy"
							src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"
							alt="#"> <img data-keyword="happy"
							src="${pageContext.request.contextPath }/img/happy.png" alt="#">
						<img id=""
							src="${pageContext.request.contextPath }/img/mood_2_Hip.png"
							alt="#"> <img id=""
							src="${pageContext.request.contextPath }/img/mood_4_Sad.png"
							alt="#"> <img id=""
							src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"
							alt="#">
					</div>

					<div id="result-list" class="hidden">
						<div class="list-head flex">
							<div class="result-image">앨범 커버</div>
							<div class="result-title">곡명</div>
							<div class="result-artists">가수</div>
						</div>
						<ul class="list-body"></ul>
					</div>
				</div>

			</li>
		</ul>

	</div>

	<%@ include file="include/detail.jsp"%>
</section>
<script src="https://sdk.scdn.co/spotify-player.js"></script>
<script type="text/javascript">
	
	document.getElementById('choose-imgs').addEventListener('click',e=>{
		document.querySelector('#choose-imgs').classList.toggle('flextoggle');
		document.querySelector('#result-list').classList.toggle('hidden');
		fetch('https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle',
				{
			headers : {"Authorization" : `Bearer ${accessToken}`}
			}).then(res => res.json())
			.then(data => {
				console.log(data);
				[...document.querySelector('#result-list .list-body').children].forEach(child => child.remove());
				[...data.tracks].forEach(track => {
					document.querySelector('#result-list .list-body').insertAdjacentHTML('beforeend',
							`<li class="flex">
								<div class="result-image" data-url="`+track.album.images[0].url+`"><img src="`+track.album.images[0].url+`"></img></div>
								<div class="result-title" data-track-id="`+track.id+`">`+track.name+`</div>
								<div class="result-artists" data-artists-id="`+track.artists[0].id+`">`+track.artists[0].name+`</div>
							 </li>`);
				});
			});
	})
	document.getElementById('result-list').addEventListener('click',e=>{
		if(e.target.classList.contains('result-title')){
			console.log(e.target);
			document.querySelector('.detail-cover img').setAttribute('src',
					e.target.parentNode.querySelector('.result-image').dataset.url);
			
		}
	})
	
</script>
