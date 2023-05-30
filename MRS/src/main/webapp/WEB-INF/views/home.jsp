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
				<div class="choose-img">
					<img id="happy-btn"
						src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img id=""
						src="${pageContext.request.contextPath }/img/mood_2_Hip.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_4_Sad.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/happy.png" alt="#">
					<img id=""
						src="${pageContext.request.contextPath }/img/mood_2_Hip.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_4_Sad.png"
						alt="#"> <img id=""
						src="${pageContext.request.contextPath }/img/mood_1_NowHot.png"
						alt="#"> <img id=""
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

<%@ include file="include/detail.jsp"%>
</section>

<script>

	document.getElementById('happy-btn').addEventListener('click',function(){
		location.href ="${pageContext.request.contextPath}/rcmd/spotifyTest";
	});
	

	// 에어팟 클릭시 이미지 변경 및 컨트롤러 변경${pageContext.request.contextPath }

	var $airImg = document.getElementById("airImg");

	$airImg.onclick = function() {
		console.log("에어팟 이미지 클릭");
		if($airImg.getAttribute("src", "${pageContext.request.contextPath }/img/air2.png")) {
			$airImg.src = "${pageContext.request.contextPath }/img/air.png";
		} else {
			$airImg.src = "${pageContext.request.contextPath }/img/air2.png";
		}
	}


</script>


