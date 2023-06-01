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
						<img data-keyword="sad" 
							src="${pageContext.request.contextPath }/img/불러볼래.png" alt="#">
						<img data-keyword="rain" 
							src="${pageContext.request.contextPath }/img/사랑스러운.png" alt="#">
						<img data-keyword="love" 
							src="${pageContext.request.contextPath }/img/상큼한.png"	alt="#">
						<img data-keyword="happy" 
							src="${pageContext.request.contextPath }/img/슬픈.png" alt="#">
						<img data-keyword="happy" 
							src="${pageContext.request.contextPath }/img/여행갈래.png" alt="#">
						<img data-keyword="happy" 
							src="${pageContext.request.contextPath }/img/외로운.png" alt="#">
						<img data-keyword="happy" 
							src="${pageContext.request.contextPath }/img/운동할떄.png" alt="#">
						<img data-keyword="happy" 
							src="${pageContext.request.contextPath }/img/인기있는.png" alt="#">
						<img id=""
							src="${pageContext.request.contextPath }/img/잔잔한.png"
							alt="#"> <img id=""
							src="${pageContext.request.contextPath }/img/파티.png"
							alt="#"> <img id=""
							src="${pageContext.request.contextPath }/img/화창한.png"
							alt="#">
					</div>
					<%@ include file="include/list.jsp"%>
				</div>

			</li>
		</ul>

	</div>


<%@ include file="include/detail.jsp"%>
</section>

<script type="text/javascript">
	
	let title = '';
	let artist = '';
	
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
				[...document.querySelector('.playList .result-list tbody').children].forEach(child => child.remove());
				[...data.tracks].forEach(track => {
					document.querySelector('#result-list tbody').insertAdjacentHTML('beforeend',
							`<tr>
								<td class="result-image" data-url="`+track.album.images[0].url+`" style="background-image: url('`+track.album.images[0].url+`')"></td>
								<td class="result-title" data-artists-id="`+track.artists[0].id+`">`+track.name+`</td>
								<td class="result-artists" data-track-id="`+track.id+`">`+track.artists[0].name+`</td>
							 </tr>`);
					
					document.querySelector('.playList .result-list tbody').insertAdjacentHTML('beforeend',
							`<tr>
								<td class="result-image" data-url="`+track.album.images[0].url+`" style="background-image: url('`+track.album.images[0].url+`')"></td>
								<td class="result-title" data-artists-id="`+track.artists[0].id+`">`+track.name+`</td>
								<td class="result-artists" data-track-id="`+track.id+`">`+track.artists[0].name+`</td>
							 </tr>`);
					
				});
			});
	})
	
	document.querySelectorAll('.result-list').forEach(list => {
	    list.addEventListener('click', e => {
	        if (e.target.classList.contains('result-title')) {
	            console.log(e.target);
	            /* 지목 안되는중 */
				console.log(e.target.textContent);
				console.log(e.target.nextSibling.textContent);
	            document.querySelector('.detail-cover img').setAttribute('src',
	                e.target.parentNode.querySelector('.result-image').dataset.url);
				document.querySelector('.teamTitle').setAttribute('textContent',
						(e.target.textContent) + " - " + (e.target.nextSibling.textContent));
	        }
	    });
	});

</script>
