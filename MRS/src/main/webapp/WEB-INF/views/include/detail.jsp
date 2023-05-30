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
		
		<!-- 이미지, 상세설명 -->
		<div class="detail-ng">
			<!-- 이미지 -->
			<div class="detail-cover">
				<img alt="" src="${pageContext.request.contextPath }/img/밤편지2.jpg">
			</div>
			
			<!-- 상세 설명 -->
			<div class="detail-text">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu pharetra nisi, at consectetur dolor. Mauris consectetur ligula commodo felis finibus pellentesque. Proin id lectus sit amet mi euismod ultricies. Donec nec malesuada turpis. Donec pharetra purus erat. Vestibulum blandit dui in nisi vulputate aliquam. Cras vitae urna feugiat, fringilla lacus id, viverra justo. Etiam eget ligula velit.
			</div>
		</div>

		<!-- 하단 댓글, playlist -->
		<div class="co-pl">

			<div class="comments">
				<!-- 댓글 1개 이걸 forEach-->
				<div class="people">
					<div>닉네임</div>
					<div>내용</div>
				</div>

				<div class="people">
					<div>닉네임</div>
					<div>내용</div>
				</div>

			</div>

			<div class="playList">

				<div>아이유 - 밤편지</div>


			</div>

		</div>

	</div>