<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메인 화면 -->
<section class="main">
	<%@ include file="include/side.jsp"%>

	<div class="main-right" id="main-right">

		<ul>
			<!-- 검색 기능  -->
			<h1>Search</h1>
    		<input type="text" id="searchQuery" placeholder="Enter search query">
    		<button onclick="search()">Search</button>

    		<ul id="searchResults"></ul>
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
						<img class="weather" data-keyword="weather" 
							src="${pageContext.request.contextPath }/img/화창한.png" alt="#">
					</div>
					<div id="result-list" class="hidden result-list">
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
	
	let title = '';
	let artist = '';
	
	document.getElementById('choose-imgs').addEventListener('click',e=>{
		document.querySelector('#choose-imgs').classList.toggle('flextoggle');
		document.querySelector('#result-list').classList.toggle('hidden');
		
		 let MyUrl = "";
	        if(e.target.dataset.keyword === "happy"){ 
	        	// 행복
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle";
	        }else if(e.target.dataset.keyword === "wantSing"){
	        	// 불러볼까?
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=40&market=KR&seed_artists=57YbQhFBBDksLzX08lqVnw&seed_genres=겨울&seed_tracks=7vnec3moFU8rMbHFUq9Ue7";
	        	
	        }else if(e.target.dataset.keyword === "sad"){ 
	        	// 슬픈
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&market=KR&seed_artists=3MaRWfwKpbYnkYHC5gRKYo&seed_genres=슬픈&seed_tracks=7oT5JOWwxnwcZRI6NLzhWs";
	        	
	        }else if(e.target.dataset.keyword === "nowHot"){ 
	        	// 요즘 인기
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=4SpbR6yFEvexJuaBpgAU5p&seed_genres=인기 있는&K-POP&seed_tracks=51vRumtqbkNW9wrKfESwfu";
	        	
	        }else if(e.target.dataset.keyword === "love"){ 
	        	// 사랑
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=6zn0ihyAApAYV51zpXxdEp&seed_genres=love&seed_tracks=47CcHKISaUPsK4QkO9ERFc";
	        	
	        }else if(e.target.dataset.keyword === "solo"){ 
	        	// 외로운
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=2dhnFfsPxve8lzhwfXVFpS&seed_genres=ballad&우울한,슬픔&seed_tracks=0nZrRonidvVoHPNT6WEfhQ";
	        	
	        }else if(e.target.dataset.keyword === "calmness"){ 
	        	// 잔잔한
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=7c1HgFDe8ogy5NOZ1ANCJQ&seed_genres=잔잔한&발라드&seed_tracks=2YduGtSyKz5Mizcc9mTeFC";
	        	
	        }else if(e.target.dataset.keyword === "fresh"){ 
	        	// 상큼한, 발랄한
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=0du5cEVh5yTK9QJze8zA0C&seed_genres=k-pop&seed_tracks=32OlwWuMpZ6b0aN2RZOeMS";
	        	
	        }else if(e.target.dataset.keyword === "party"){ 
	        	// 파티하자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=0du5cEVh5yTK9QJze8zA0C&seed_genres=k-pop&seed_tracks=32OlwWuMpZ6b0aN2RZOeMS";
	        	
	        }else if(e.target.dataset.keyword === "exercise"){ 
	        	// 운동하자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=6fOMl44jA4Sp5b9PpYCkzz&seed_genres=edm&pop&seed_tracks=5rLyYxZNzca00ENADO9m54";
	        	
	        }else if(e.target.dataset.keyword === "rest"){ 
	        	// 여행 가자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=2el9LgZHLeQnXHABBkgb7M&seed_genres=trip&seed_tracks=4L1MHK27ifT30Ndicpr7js";
	        	
	        }else if(e.target.dataset.keyword === "sunny") {
	        	// 화창한 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=3HqSLMAZ3g3d5poNaI7GOU&seed_genres=K-POP%26%ED%99%94%EC%B0%BD%ED%95%9C&seed_tracks=5xrtzzzikpG3BLbo4q1Yul&min_energy=0&max_energy=1";
	        		        		
	        } else if (e.target.dataset.keyword === "cloudy") {
	        	// 흐린 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=50Zu2bK9y5UAtD0jcqk5VX&seed_genres=우울한&발라드&seed_tracks=5xX7oEKHN0H9VOjezo2ZaA";
	        		        		
	        } else if (e.target.dataset.keyword === "rain") {
	        	// 비 오는 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle";
	        		        		
	        } else if (e.target.dataset.keyword === "snow") {
	        	// 눈 오는 날		
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4iHNK0tOyZPYnBU7nGAgpQ&seed_genres=WINTER&SNOW&CALROL&seed_tracks=0bYg9bo50gSsH3LtXe2SQn";
	        }

		
		fetch( MyUrl , {headers : {"Authorization" : `Bearer ${accessToken}`}
			}).then(res => res.json())
			.then(data => {
				console.log(data);
				[...document.querySelector('#result-list .list-body').children].forEach(child => child.remove());
				[...data.tracks].forEach(track => {
					document.querySelector('#result-list .list-body').insertAdjacentHTML('beforeend',
							 `<li class="flex">
                            <div class="result-image" data-url="`+track.album.images[0].url+`"><img src="`+track.album.images[0].url+`"></img></div>
                            <div class="result-title" data-track-id="`+track.id+`" data-track-uri="`+track.uri+`">`+track.name+`</div>
                            <div class="result-artists" data-artists-id="`+track.artists[0].id+`">`+track.artists[0].name+`</div>
                         </li>`);		
				});
			});

	});//이미지 클릭 끝
	    
	//검색 결과 선택시 
	document.querySelector('ul.list-body').addEventListener('click',e=>{
		console.log('결과 리스트 클릭');
		if(e.target.classList.contains('result-title')){
			let targetId = e.target.dataset.trackId;
			let uris = [e.target.dataset.trackUri];
		
			recommendations(e.target.nextElementSibling.dataset.artistsId,e.target.dataset.trackId)
			.then(trackList => {
				for (let i = 0; i<19; i++){
					if(trackList.length<i) break;
					uris.push(trackList[i].uri);
				}
				console.log(uris);
				startResumePlayback(uris);
			})
		}
	});
	
	function search() {
	    var query = document.getElementById("searchQuery").value;
	    var url = "https://api.spotify.com/v1/search?type=track&q=" + query;
	    
	    console.log('search 클릭');

	    var xhr = new XMLHttpRequest();
	    xhr.open("GET", url);
	    xhr.setRequestHeader("Authorization", "Bearer " + ${accessToken});
	    console.log(${accessToken});
	    xhr.onload = function () {
	        if (xhr.status === 200) {
	            var response = JSON.parse(xhr.responseText);
	            var tracks = response.tracks.items;
	            var resultsList = document.getElementById("searchResults");
	            resultsList.innerHTML = "";

	            tracks.forEach(function (track) {
	                var li = document.createElement("li");
	                li.textContent = track.name;
	                resultsList.appendChild(li);
	            });
	        } else {
	            alert("Spotify에서 검색하는 동안 오류가 발생했습니다.");
	        }
	    };
	    xhr.send();
	}
	
</script>
