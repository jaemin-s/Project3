<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file="include/header.jsp" %>
	<link rel="alternate" type="application/json+oembed" href="https://open.spotify.com/oembed?url=https://open.spotify.com/album/4ghBzVOTFoeKPPmyNKjVtI" />
	
	<section>

		<h1>여기는 section</h1>
		<table>
			<thead>
				<tr>
					<td>기준 일자</td>
					<td>기준 시각</td>
					<td>하늘 형태</td>
					<td>강수 형태</td>
					<td>기온</td>
				</tr>
			</thead>
			<tbody>
				<tr id="resultRow">
					<td>test</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>

		<button id="playBtn" >재생</button>
		<!-- <iframe id="player" type="text/html" width="200" height="200" src="https://www.youtube.com/embed/0-q1KafFCLU"></iframe> --> 
		<div id="player"></div>
  

      
	</section>
    
    <%@ include file="include/footer.jsp"%>
	<script>
	
	//공공데이터 날씨
	/* window.onload = () => {
			
			const rsRow = [...document.querySelectorAll('#resultRow *')];

			// let date = new date();
			let currentDate = "20230522";
			let currentTime = "1700";
			let key = 'biMFKPX2rMio1vYOKily9qXhvrK7ATHwXvrB%2FUi4f0x9jTnToB%2BOzwAOK81JSQHiqe1WZGA6FL%2BIdr0p3%2F%2F%2BJA%3D%3D';
			let nX = '55';
			let nY = '127';
			
			let temper,sky,pty; // 기온, 하늘상태, 강수형태
			
			let url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst';
			let queryParams = '?serviceKey='+key
					+'&pageNo=1&numOfRows=25&dataType=JSON'
					+'&base_date='+currentDate
					+'&base_time='+currentTime
					+'&nx='+nX
					+'&ny='+nY
			
					fetch(url+queryParams).then(res => res.json())
				.then(data =>{
					console.log(data);
					console.log(data.response);
					console.log(data.response.body);
					console.log(data.response.body.items);
					console.log(data.response.body.items.item);
					let rs = data.response.body.items.item;
					
					console.log(rs[6].fcstValue); //강수 형태
					pty=rs[6].fcstValue; //강수 형태
					console.log(rs[18].fcstValue); //하늘 형태
					sky=rs[18].fcstValue
					console.log(rs[24].fcstValue); //하늘 형태
					temper=rs[24].fcstValue

					rsRow[0].textContent=currentDate;
					rsRow[1].textContent=currentTime;
					rsRow[2].textContent=sky;
					rsRow[3].textContent=pty;
					rsRow[4].textContent=temper;
					
				});



		} */

		const $playBtn = document.getElementById('playBtn');
		let vId = "0-q1KafFCLU";
		$playBtn.addEventListener('click',function(){
			console.log('클릭');
			let state = player.getPlayerState();
			console.log(state);
			if(state == -1||state == 2){
				player.playVideo();
				console.log("재생");
			}else if(state == 5){
				console.log(player.getCurrentTime());
				console.log(player.getDuration());
				player.playVideo();
			}else if(state == 1){
				player.pauseVideo();
				console.log("일시정지");
			}
		});
		
		// 2. This code loads the IFrame Player API code asynchronously.
	      var tag = document.createElement('script');

	      tag.src = "https://www.youtube.com/iframe_api";
	      var firstScriptTag = document.getElementsByTagName('script')[0];
	      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	      // 3. This function creates an <iframe> (and YouTube player)
	      //    after the API code downloads.
	      var player;
	      function onYouTubeIframeAPIReady() {
	        player = new YT.Player('player', {
	          height: '100',
	          width: '100',
	          videoId: vId,
	          events: {
	            'onReady': onPlayerReady,
	            'onStateChange': onPlayerStateChange
	          }
	        });
	      }

	      // 4. The API will call this function when the video player is ready.
	      function onPlayerReady(event) {
	        event.target.playVideo();
	      }

	      // 5. The API calls this function when the player's state changes.
	      //    The function indicates that when playing a video (state=1),
	      //    the player should play for six seconds and then stop.
	      var done = false;
	      function onPlayerStateChange(event) {
	        if (event.data == YT.PlayerState.PLAYING && !done) {
	          setTimeout(stopVideo, 6000);
	          done = true;
	        }
	      }
	      function stopVideo() {
	        player.stopVideo();
	      }
	      
	      
	      
 
	</script>