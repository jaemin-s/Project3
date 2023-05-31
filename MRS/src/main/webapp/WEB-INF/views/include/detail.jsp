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

 <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-9 write-wrap">
                <form class="reply-wrap">
                    <!--form-control은 부트스트랩의 클래스입니다-->
                    <div class="reply-content">
                        <textarea class="form-control" rows="3" id="reply"></textarea>
                        <div class="reply-group">

                            <button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
                        </div>

                    </div>
                </form>

                <!--여기에 접근 반복-->
                <div id="replyList">

                   <!--  자바스크립트 단에서 반복문을 이용해서 댓글의 개수만큼 반복 표현.  -->
                    <div class='reply-wrap'>
                        <div class='reply-content'>
                            <div class='reply-group'>
                                <strong class='left'>honggildong</strong>
                                <small class='left'>2019/12/10</small>
                                <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
                            </div>
                            <p class='clearfix'>여기는 댓글영역</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

			<div class="playList">

				<div>아이유 - 밤편지</div>


			</div>

		</div>

	</div>