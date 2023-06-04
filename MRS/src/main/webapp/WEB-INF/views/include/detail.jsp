<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
			<div class="teamTitle">
				
			</div>
			
			<!-- 댓글작성칸 -->
			<div class="video-comment">
					<textarea placeholder="댓글 추가..." spellcheck="false" id="replyContent"></textarea>
					<input type="text" class="form-control" id="replyId" placeholder="이름">
					<button id="replyRegist" class="commentbtn">등록</button>
			</div>

			<!-- 저장 댓글 보여주는 칸 -->
			<div class="commentList">

			</div>

		</div>

		<!-- playlist -->

		<div class="playList">
			<%@ include file="list.jsp"%>
		</div>

	</div>
	
<script>
/*         document.getElementById('replyRegist').onclick = () => {
            const reply = document.getElementById('reply').value;
            console.log(`${pageContext.request.contextPath}`);
            console.log("reply:"+reply);

        //요청에 관련된 정보 객체
        const reqObj = {
                method: 'post',
                headers: {
                    'Content-Type':'application/json'
                },
                body:
                    JSON.stringify({
                    'reply-content' : reply
                	})
  
            }; 
	
            fetch(`${pageContext.request.contextPath}/regist`,reqObj)
                .then(res => res.text())
                   .then(data =>{
                           console.log('통신 성공!: ' + data);

                    });
        } */
        
        document.getElementById('replyRegist').onclick = function(){
        	const replyContent = document.getElementById('replyContent').value;
            const replyId = document.getElementById('replyId').value;
            
        const reply = {
                method: 'post',
                headers: {
                    'Content-Type' : 'application/json'
                },
                body: JSON.stringify({
                    'replyContent' : replyContent,
                    'replyId' : replyId,
                })
            };
        fetch('${pageContext.request.contextPath}/reply/replyRegist', reply)
        .then(res => res.text())
        .then(data => {
            console.log('통신 성공!: ' + data);
            document.getElementById('replyContent').value = '';
            getList(1, true);
        });
        }
</script>	