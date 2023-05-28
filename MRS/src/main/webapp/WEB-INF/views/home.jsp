<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<section class="main">
	
	<%@ include file="include/side.jsp" %>
	
		<div class="main-right">
			
			<ul>
				<!-- 검색 기능  -->
				<li class="search">
					<a>search</a>
				</li>
				
				<!-- 로고 이미지 -->
				<div class="main-logo-img">
					<img id="" src="${pageContext.request.contextPath }/img/logo_whi.png" alt="#">
				</div>
				
				<!-- 노래 모음 설명 -->
				<li class="choose">
				
				<!-- 추천 테이블 -->
				<div class="choose-text">
					them by feeling
				</div>
				
				<!-- 추천 테이블 이미지 -->
				<div class="choose-img">
					<img id="happy-btn" src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_2_Hip.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_4_Sad.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_1_NowHot.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_2_Hip.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_4_Sad.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_1_NowHot.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_2_Hip.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_4_Sad.png" alt="#">
					<img id="" src="${pageContext.request.contextPath }/img/mood_1_NowHot.png" alt="#">
					
				</div>
				
				
				
				</li>
			</ul>
			
		</div>
	 	
	</section>
    	
    <%-- <%@ include file="include/footer.jsp"%> --%>
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
		
		document.getElementById('happy-btn').addEventListener('click',function(){
			let rn = Math.floor(Math.random()*2)+1;
			console.log('rn: '+rn);
			if(rn===1){
				player.loadPlaylist(["v6_GwXU1lkg","Dbxzh078jr4","jeqdYqsrsA0"]);
				player.setLoop(true);
			}else{
				player.loadPlaylist(["EiVmQZwJhsA","vecSVX1QYbQ","JFgv8bKfxEs"]);
				player.setLoop(true);
			}
		})
	      
	      
 
	</script>
