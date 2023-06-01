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
					<table id="result-list" class="hidden">
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
	<button id="test-btn">아이디 받아오기</button>
	<button id="test-btn2">재생해보기</button>
	<button id="test-btn3">재생중인 트랙확인</button>


<%@ include file="include/detail.jsp"%>
</section>

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
				[...document.querySelector('#result-list tbody').children].forEach(child => child.remove());
				[...data.tracks].forEach(track => {
					document.querySelector('#result-list tbody').insertAdjacentHTML('beforeend',
							`<tr>
								<td class="result-image" data-url="`+track.album.images[0].url+`" style="background-image: url('`+track.album.images[0].url+`')"></td>
								<td class="result-title" data-artists-id="`+track.artists[0].id+`">`+track.name+`</td>
								<td class="result-artists" data-track-id="`+track.id+`">`+track.artists[0].name+`</td>
							 </tr>`);
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
			data :{"device_ids" : [""+dId]}
		}).then(console.log('put 전송완료'+dId));
	})
	
	document.getElementById('test-btn3').addEventListener('click',e=>{
		fetch('https://api.spotify.com/v1/me/player/currently-playing',{
			headers : {
				"Authorization" : `Bearer ${accessToken}`,
				"Content-Type" : "application/json"	
			}
		}).then(res=>res.json())
		.then(data => console.log(data));
	})

</script>
