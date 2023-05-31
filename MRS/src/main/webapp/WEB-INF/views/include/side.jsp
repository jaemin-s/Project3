<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 가져오기 -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<!-- reset css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/commons.js" defer></script>

</head>
<body>

	<!-- 왼쪽 고정 menu, controller -->
	<div class="side">

		<!-- 페이지 넘어갈 곳 -->
		<div class="menu">
			<!-- 로그아웃상태에선 로그인, 회원가입 넣기 -->
			<c:if test="${login == null}">
				<div>
					<img src="${pageContext.request.contextPath }/img/Spotify_Logo.png" alt="">
					<a>log in</a>
				</div>
			</c:if>
			<!-- 로그인 되어있으면 환영인사. -->
			<c:if test="${login != null}">
				<h1>닉네임 님</h1>
				<h3>환영합니다.</h3>
			</c:if>
			
			<a class="mainBtn" href="#">main page</a> 
			<a class="videoBtn" href="#">video page</a>
		</div>

		<!-- 에어팟 이미지 -->
		<div class="imgDiv">
			<img id="airImg"
				src="${pageContext.request.contextPath }/img/air.png" alt="#">
		</div>
	</div>
</body>
</html>

<script>

// 에어팟 클릭시 이미지 변경 및 컨트롤러 변경${pageContext.request.contextPath }

var $airImg = document.getElementById("airImg");

 airImg.onclick = function() {

	 if(airImg.getAttribute('src') === "${pageContext.request.contextPath}/img/air.png") {
		 console.log('열렸따!');
	        airImg.setAttribute('src', "${pageContext.request.contextPath}/img/air2.png");
	 }
	 else if(airImg.getAttribute('src') === "${pageContext.request.contextPath}/img/air2.png"){
		 	console.log('닫혔따!');
	        airImg.src = "${pageContext.request.contextPath}/img/air.png";
	 }


 }

</script>