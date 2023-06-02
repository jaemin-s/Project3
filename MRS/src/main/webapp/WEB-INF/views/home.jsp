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
							src="${pageContext.request.contextPath }/img/행복한.png" alt="#">
						<img data-keyword="wantSing" 
							src="${pageContext.request.contextPath }/img/불러볼래.png" alt="#">
						<img data-keyword="love" 
							src="${pageContext.request.contextPath }/img/사랑스러운.png" alt="#">
						<img data-keyword="fresh" 
							src="${pageContext.request.contextPath }/img/상큼한.png"	alt="#">
						<img data-keyword="sad" 
							src="${pageContext.request.contextPath }/img/슬픈.png" alt="#">
						<img data-keyword="rest" 
							src="${pageContext.request.contextPath }/img/여행갈래.png" alt="#">
						<img data-keyword="solo" 
							src="${pageContext.request.contextPath }/img/외로운.png" alt="#">
						<img data-keyword="exercise" 
							src="${pageContext.request.contextPath }/img/운동할떄.png" alt="#">
						<img data-keyword="nowHot" 
							src="${pageContext.request.contextPath }/img/인기있는.png" alt="#">
						<img data-keyword="calmness"
							src="${pageContext.request.contextPath }/img/잔잔한.png" alt="#"> 
						<img data-keyword="party" 
							src="${pageContext.request.contextPath }/img/파티.png" alt="#"> 
						<img data-keyword="weather" 
							src="${pageContext.request.contextPath }/img/화창한.png" alt="#">
					</div>
					<%@ include file="include/list.jsp"%>
				</div>

			</li>
		</ul>

	</div>
	
	<div class="test-button">
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
	</div>


<%@ include file="include/detail.jsp"%>
</section>
<script src="https://sdk.scdn.co/spotify-player.js"></script>
<script type="text/javascript">
	
	let title = '';
	let artist = '';
	
	document.getElementById('choose-imgs').addEventListener('click',e=>{
		document.querySelector('#choose-imgs').classList.toggle('flextoggle');
		document.querySelector('#result-list').classList.toggle('hidden');
		
		 let MyUrl = "";
	        if(e.target.dataset.keyword === "happy"){ 
	        	// 행복
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle"
	        }else if(e.target.dataset.keyword === "wantSing"){
	        	// 불러볼까?
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=40&market=KR&seed_artists=57YbQhFBBDksLzX08lqVnw&seed_genres=겨울&seed_tracks=7vnec3moFU8rMbHFUq9Ue7"
	        	
	        }else if(e.target.dataset.keyword === "sad"){ 
	        	// 슬픈
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=3MaRWfwKpbYnkYHC5gRKYo&seed_genres=슬픈&seed_tracks=7oT5JOWwxnwcZRI6NLzhWs"
	        	
	        }else if(e.target.dataset.keyword === "nowHot"){ 
	        	// 요즘 인기
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=4SpbR6yFEvexJuaBpgAU5p&seed_genres=인기 있는&K-POP&seed_tracks=51vRumtqbkNW9wrKfESwfu"
	        	
	        }else if(e.target.dataset.keyword === "love"){ 
	        	// 사랑
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=6zn0ihyAApAYV51zpXxdEp&seed_genres=love&seed_tracks=47CcHKISaUPsK4QkO9ERFc"
	        	
	        }else if(e.target.dataset.keyword === "solo"){ 
	        	// 외로운
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=4dB2XmMpzPxsMRnt62TbF5&seed_genres=ballad&seed_tracks=10if3nqm7OS7qrV45v9GOg"
	        	
	        }else if(e.target.dataset.keyword === "calmness"){ 
	        	// 잔잔한
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=7c1HgFDe8ogy5NOZ1ANCJQ&seed_genres=잔잔한&발라드&seed_tracks=2YduGtSyKz5Mizcc9mTeFC"
	        	
	        }else if(e.target.dataset.keyword === "fresh"){ 
	        	// 상큼한, 발랄한
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=0du5cEVh5yTK9QJze8zA0C&seed_genres=k-pop&seed_tracks=32OlwWuMpZ6b0aN2RZOeMS"
	        	
	        }else if(e.target.dataset.keyword === "party"){ 
	        	// 파티하자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=0du5cEVh5yTK9QJze8zA0C&seed_genres=k-pop&seed_tracks=32OlwWuMpZ6b0aN2RZOeMS"
	        	
	        }else if(e.target.dataset.keyword === "exercise"){ 
	        	// 운동하자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=6fOMl44jA4Sp5b9PpYCkzz&seed_genres=edm&pop&seed_tracks=5rLyYxZNzca00ENADO9m54"
	        	
	        }else if(e.target.dataset.keyword === "rest"){ 
	        	// 여행 가자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=2el9LgZHLeQnXHABBkgb7M&seed_genres=trip&seed_tracks=4L1MHK27ifT30Ndicpr7js"
	        	
	        }else if(e.target.dataset.keyword === "weather"){ // 날씨 (화창, 흐림, 비, 눈)
	        	/* 창 이동 후 나타나게?? 
	        	if(e.target.dataset.keyword === "sunny") {
	        	// 화창한 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=3HqSLMAZ3g3d5poNaI7GOU&seed_genres=K-POP%26%ED%99%94%EC%B0%BD%ED%95%9C&seed_tracks=5xrtzzzikpG3BLbo4q1Yul&min_energy=0&max_energy=1"
	        		
	        	} else if (e.target.dataset.keyword === "cloudy") {
	        	// 흐린 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=50Zu2bK9y5UAtD0jcqk5VX&seed_genres=우울한&발라드&seed_tracks=5xX7oEKHN0H9VOjezo2ZaA"
	        		
	        	} else if (e.target.dataset.keyword === "rain") {
	        	// 비 오는 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle"
	        		
	        	} else if (e.target.dataset.keyword === "snow") {
	        	// 눈 오는 날		
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4iHNK0tOyZPYnBU7nGAgpQ&seed_genres=WINTER&SNOW&CALROL&seed_tracks=0bYg9bo50gSsH3LtXe2SQn"
	        		
	        	*/
	        	} 
		
		fetch( MyUrl , {headers : {"Authorization" : `Bearer ${accessToken}`}
			}).then(res => res.json())
			.then(data => {
				console.log(data);
				[...document.querySelector('#result-list .list-body').children].forEach(child => child.remove());
				[...document.querySelector('.playList .result-list .list-body').children].forEach(child => child.remove());
				[...data.tracks].forEach(track => {
					document.querySelector('#result-list .list-body').insertAdjacentHTML('beforeend',
							 `<li class="flex">
                            <div class="result-image" data-url="`+track.album.images[0].url+`"><img src="`+track.album.images[0].url+`"></img></div>
                            <div class="result-title" data-artists-id="`+track.artists[0].id+`">`+track.name+`</div>
                            <div class="result-artists" data-track-id="`+track.id+`">`+track.artists[0].name+`</div>
                         </li>`);
					
					document.querySelector('.playList .result-list .list-body').insertAdjacentHTML('beforeend',
							 `<li class="flex">
                            <div class="result-image" data-url="`+track.album.images[0].url+`"><img src="`+track.album.images[0].url+`"></img></div>
                            <div class="result-title" data-artists-id="`+track.artists[0].id+`">`+track.name+`</div>
                            <div class="result-artists" data-track-id="`+track.id+`">`+track.artists[0].name+`</div>
                         </li>`);
					
				});
			});
	})
	
	document.querySelectorAll('.result-list').forEach(list => {
	    list.addEventListener('click', e => {
	        if (e.target.classList.contains('result-title')) {
	            document.querySelector('.cover-img').setAttribute('src',
	                e.target.parentNode.querySelector('.result-image').dataset.url);
				document.querySelector('.teamTitle').textContent = (e.target.textContent) + " - " + (e.target.parentNode.querySelector('.result-artists').textContent);
	        }
	    });
	});

	
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
