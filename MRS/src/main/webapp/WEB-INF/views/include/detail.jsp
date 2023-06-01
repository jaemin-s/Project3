<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Rcmd Service</title>

<link href="${pageContext.request.contextPath }/css/style.css"
	rel="stylesheet">

</head>
<body>

	<!-- 
                vido page 오른쪽
                페이지 넘어갈게 아니라 클릭 시 크기조절로 나타나게 할게요
    -->

	<div class="video-right" id="video-right">

		<!-- 이미지 -->
		<div class="detail-ng">
			<!-- 이미지 -->
			<div class="detail-cover">
				<img alt="" src="">
			</div>
			<!-- 가수명, 팀명 -->
			<div class="teamTitle">
				
			</div>
				<!-- 댓글 -->
				<div class="video-comment">
					
				</div>

		</div>

		<!-- 하단 댓글, playlist -->


		<div class="playList">

			<%@ include file="list.jsp"%>

		</div>

	</div>