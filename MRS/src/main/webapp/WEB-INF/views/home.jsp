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
				<div class="flex-box">
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
					<table id="result-list">
						<thead>
							<tr>
								<th>앨범 커버</th>
								<th>곡명</th>
								<th>가수</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>

			</li>
		</ul>

	</div>


<%@ include file="include/detail.jsp"%>
</section>

<script type="text/javascript">
	
	document.getElementById('choose-imgs').addEventListener('click',e=>{
		document.querySelector('#choose-imgs').classList.toggle('flextoggle');
		fetch('https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle',
				{
			headers : {"Authorization" : `Bearer ${accessToken}`}
			}).then(res => res.json())
			.then(data => {
				console.log(data);
				[...document.querySelector('#result-list tbody').children].forEach(child => child.remove());
				[...data.tracks].forEach(track => {
					console.log(track.album.images[0].url);
					let trackUrl =  track.album.images[0].url;
					console.log(track.artists[0].id);
					console.log(track.name);
					console.log(track.id);
					console.log(track.artists[0].name);
					document.querySelector('#result-list tbody').insertAdjacentHTML('beforeend',
							`<tr>
								<td style="background-image: url('`+track.album.images[0].url+`')"></td>
								<td data-artists-id="`+track.artists[0].id+`">`+track.name+`</td>
								<td data-track-id="`+track.id+`">`+track.artists[0].name+`</td>
							 </tr>`);
				});
			});
	})

</script>
