<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

		<!-- 이미지, 댓글칸 -->
		<div class="detail-ng">
			<!-- 이미지 -->
			<div class="detail-cover">
				<img class="cover-img" alt="" src="">
			</div>
			<!-- 가수명, 팀명 -->
			<div class="teamTitle"></div>

			<!-- 댓글작성칸 -->
			<div class="video-comment">
				<textarea placeholder="댓글 추가..." spellcheck="false"></textarea>
				<button id="replyRegist" class="commentbtn">등록</button>
			</div>

			<!-- 저장 댓글 보여주는 칸 -->
			<c:forEach var="i" begin="1" end="10">
				<div class='reply-content'>
					<div class='reply-group'>
						<strong>honggildong</strong> <small>2019/12/10</small>
						<a href='#' class='right reply-update'><span
							class='glyphicon glyphicon-pencil'></span>수정</a> 
						<a href='#' class='right reply-delete'><span class='glyphicon glyphicon-remove'></span>삭제</a>
					</div>
					<p class='clearfix'>여기는 댓글영역</p>
				</div>
			</c:forEach>
		</div>

		<!-- playlist -->
	
		<div class="playList">
			<div id="comments-list" class="comments-list">
	                <div class="comments-head flex-box">
	                    <div class="comments-image">앨범 커버</div>
	                    <div class="comments-title">곡명</div>
	                    <div class="comments-artists">가수</div>
	                </div>
	                <ul class="comments-body"></ul>
	        </div>
	   </div>

	</div>

	<script>


</script>