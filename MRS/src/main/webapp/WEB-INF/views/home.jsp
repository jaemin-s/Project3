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
					<!-- <table id="result-list" class="hidden">
						<thead>
							<tr>
								<th>앨범 커버</th>
								<th>곡명</th>
								<th>가수</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table> -->
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
	<button id="test-btn">아이디 받아오기</button>
	<button id="test-btn2">재생해보기</button>
	<button id="test-btn3">재생중인 트랙확인</button>
	<button id="test-btn4">재생시작</button>
	<button id="test-btn5">곡 추가</button>
	<button id="test-btn51">곡 추가</button>
	<button id="test-btn52">곡 추가</button>
	<button id="test-btn53">곡 추가</button>
	<button id="test-btn6">다음 곡</button>
	<button id="togglePlay">Toggle Play</button>


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
								<div class="result-title" data-artists-id="`+track.artists[0].id+`">`+track.name+`</div>
								<div class="result-artists" data-track-id="`+track.id+`">`+track.artists[0].name+`</div>
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
		}).then(console.log('put 전송완료'+[dId]));
	});
	
	 document.getElementById('test-btn3').addEventListener('click',e=>{
		fetch('https://api.spotify.com/v1/me/player/currently-playing',{
			headers : {
				"Authorization" : `Bearer ${accessToken}`,
			}
		}).then(res=>console.log(res));
		//.then(data => console.log(data));
	})
	
	document.getElementById('test-btn4').addEventListener('click',e=>{
		fetch('https://api.spotify.com/v1/me/player/play',{
			method : "put",
			headers : {
				"Authorization" : `Bearer ${accessToken}`,
				"Content-Type" : "application/json"
			},
			body : JSON.stringify({
				"uris" : ["spotify:track:4Dr2hJ3EnVh2Aaot6fRwDO"]
			})
		}).then(console.log('put 전송완료'+[dId]));
	});
	 
	 document.getElementById('test-btn5').addEventListener('click',e=>{
			fetch('https://api.spotify.com/v1/me/player/queue?uri=spotify:track:4Dr2hJ3EnVh2Aaot6fRwDO',{
				method : "post",
				headers : {
					"Authorization" : `Bearer ${accessToken}`,
				}
			}).then(console.log('post 전송완료'));
		});
	 document.getElementById('test-btn51').addEventListener('click',e=>{
			fetch('https://api.spotify.com/v1/me/player/queue?uri=spotify:track:4IJsVXbSeGPUrgwpVoHmlg',{
				method : "post",
				headers : {
					"Authorization" : `Bearer ${accessToken}`,
				}
			}).then(console.log('post 전송완료'));
		});
	 document.getElementById('test-btn52').addEventListener('click',e=>{
			fetch('https://api.spotify.com/v1/me/player/queue?uri=spotify:track:5aHwYjiSGgJAxy10mBMlDT',{
				method : "post",
				headers : {
					"Authorization" : `Bearer ${accessToken}`,
				}
			}).then(console.log('post 전송완료'));
		});
	 document.getElementById('test-btn53').addEventListener('click',e=>{
			fetch('https://api.spotify.com/v1/me/player/queue?uri=spotify:track:4Dr2hJ3EnVh2Aaot6fRwDO',{
				method : "post",
				headers : {
					"Authorization" : `Bearer ${accessToken}`,
				}
			}).then(console.log('post 전송완료'));
		});
	 
	 document.getElementById('test-btn6').addEventListener('click',e=>{
			fetch('https://api.spotify.com/v1/me/player/next',{
				method : "post",
				headers : {
					"Authorization" : `Bearer ${accessToken}`,
				}
			}).then(console.log('post 전송완료'));
		});
	 
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
            });

            // Not Ready
            player.addListener('not_ready', ({ device_id }) => {
                console.log('Device ID has gone offline', device_id);
            });
            
            player.connect();
            
            document.getElementById('togglePlay').onclick = function() {
            	  player.togglePlay();
            	};
	}
</script>
