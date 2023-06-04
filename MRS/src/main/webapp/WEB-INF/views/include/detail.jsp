<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
				<textarea id="reply" placeholder="댓글 추가..." spellcheck="false"></textarea>
				<button id="replyRegist" class="commentbtn">등록</button>
			</div>

			<!-- 저장 댓글 보여주는 칸 -->
			<div class="commentList">
				<!--여기에 접근 반복-->
				<div id="replyList">

					<!--  자바스크립트 단에서 반복문을 이용해서 댓글의 개수만큼 반복 표현.  -->
					<!-- <div class='reply-wrap'>
                         <div class='reply-content'>
                            <div class='reply-group'>
                                <strong class='left'>honggildong</strong>
                                <small class='left'>2019/12/10</small>
                                <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
                            </div>
                            <p class='clearfix'>여기는 댓글영역</p>
                        </div> 
                    </div> -->
				</div>
			</div>

		</div>

		<!-- playlist -->

		<div class="playList">
			<%@ include file="list.jsp"%>
		</div>

	</div>
<!-- SweetAlert2 CDN -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>

	function file2Function(){
		
		function getNextPage() {
			  page++;
			  getList(page, false);
			}
		
        document.getElementById('replyRegist').onclick = () => {
            
            /* const playno = '${article.bno}'; */ //플레이 재생변화에 따른 곡 번호
            const reply = document.getElementById('reply').value;
			if(reply===''){
            alert('댓글 내용을 입력하세요!');
            return;
			}
        
      //요청에 관련된 정보 객체
        const reqObj = {
                method: 'POST',
                headers: {
                    'Content-Type':'application/json'
                },
                body: JSON.stringify(
                    {
                    /* 'playno' : playno, */
                    'replyContent' : reply
                }
                )
            };

            fetch('${pageContext.request.contextPath}/regist',reqObj)
                .then(res => res.text())
                    .then(data =>{
                            console.log('통신 성공!: ' + data);
                            document.getElementById('reply').value = '';
                            getList(1, true);
                            
                    });
        
        }

        let page = 1;
        let strAdd = '';
        const $replyList = document.getElementById('replyList');
        
		
		getList(1,true);
		
		function getList(pageNum, reset){
			strAdd ='';
			 const rmno = localStorage.getItem('rmno');
			/* const musicId = '${musicId}'; */  //음악 id
			console.log("rmno 값 테스트" + rmno);
			if(rmno===null){
				return;
			}
					
			
			console.log('page: ' + pageNum);
			console.log('reset: ' + reset);
			
			fetch('${pageContext.request.contextPath}/getList/' + rmno + '/' + pageNum)
				.then(res => res.json())
            		.then(data => {
            			console.log(data);
            			
            			let total = data.total; //총 댓글 수
            			let replyList = data.list; //댓글 리스트
            			
            			console.log("total 테스트" + total);
            			console.log("replyList 테스트" + replyList);
            			
            			//응답 데이터의 길이가 0과 같거나 더 작으면 함수를 종료.
            			if(replyList.length < 0) return;
            			
            			//insert, update, delete 작업 후에는
            			//댓글 내용 태그를 누적하고 있는 strAdd 변수를 초기화해서
            			//마치 화면이 리셋된 것처럼 보여줘야 한다.
            			if(reset){
            				
            				while($replyList.firstChild){
            					$replyList.firstChild.remove();
            				}
            				page = 1;
            			}
            			
            			console.log('현재 페이지: ' + page);
            			
            			for(let i=0; i<replyList.length; i++){
            				strAdd +=
            					`
          					 <div class='reply-wrap'>
         <div class='reply-content'>
            <div class='reply-group'>
               <strong class='left' style="margin-right: 15px; color: #555;">` + replyList[i].rdisplayName + `</strong>
               <small class='left' style="color: #555;">` + replyList[i].regDate + `</small>
               <a href='` + replyList[i].rno + `' class='right btn-edit'><span class='glyphicon glyphicon-pencil'></span>수정</a>
               <a href='` + replyList[i].rno + `' class='right btn-delete'><span class='glyphicon glyphicon-remove'></span>삭제</a>
            </div>
            <p class='clearfix'>` + replyList[i].replyContent + `</p>
         </div> 
      </div>
                        
            					`;
            					
            				
            			}
            			
            			if (!reset && replyList.length > 0) {
            				  getNextPage();
            				}
            			
					
            			if(!reset){
            				document.getElementById('replyList').insertAdjacentHTML('beforeend',strAdd);	
            			} else {
            				document.getElementById('replyList').insertAdjacentHTML('afterbegin',strAdd);
            			}
            			
            		});
				} //end getList();
				
				  
				 document.getElementById('replyList').addEventListener('click', e => {
			        	e.preventDefault(); 
			        	 /*  e.stopPropagation();
			        	    
			        	    console.log("이벤트 발생 확인"); */
			        	
			        	if(!e.target.matches('a')){
			        		return;
			        	}
			        	
			        	const rno = e.target.getAttribute('href');
			        	console.log('댓글 번호: ' + rno);
			        	
			        	const replyGroup = e.target.parentNode;
			            const contentElem = replyGroup.nextElementSibling;
			        	
			            if (e.target.classList.contains('btn-edit')) {
			        	const content = e.target.parentNode.nextElementSibling.textContent;
			        	/* console.log('댓글 내용: ' + content); */
			        	
			        	contentElem.style.display = 'none';
			        	replyGroup.insertAdjacentHTML('afterend', `
			        	        <div class="edit-group">
			        	            <input type="text" class="edit-input" value='${content}' style="width: 80%;"/>
			        	            <button class="edit-save">저장</button>
			        	        </div>
			        	    `);
			        	
			        	replyGroup.nextElementSibling.querySelector('.edit-save').addEventListener('click', e => {
			        	    e.preventDefault();
			        	    const editedContent = replyGroup.nextElementSibling.querySelector('.edit-input').value;

			        	    // 서버로 변경된 댓글 전송 (PUT 요청 등)
			        	    fetch('${pageContext.request.contextPath}/update'+'/'+rno, {
			        	        method: 'PUT',
			        	        headers: {
			        	            'Content-Type': 'application/json',
			        	        },
			        	        body: JSON.stringify({
			        	        	replyContent: editedContent,
			        	           
			        	        }),
			        	    })
			        	    .then(response => {
    						if (response.ok) { // 수정이 성공하면 response.ok가 true입니다.
        					contentElem.textContent = editedContent;
        					contentElem.style.display = 'block';
        					replyGroup.nextElementSibling.remove();
    						} else {
        					console.error('Error: 수정 요청이 실패했습니다.');
    						}
						})
			        	    .catch(error => {
			        	        console.error('Error:', error);
			        	    });
			        	});
			            }
			          
			        
			
		});
				 
				 document.getElementById('replyList').addEventListener('click', async (e) => {
					 if (!e.target.classList.contains('btn-delete')) return;

					  e.preventDefault();
					  const replyGroup = e.target.parentNode;
					  const result = await Swal.fire({
					    title: '선택한 댓글을 삭제하시겠습니까?',
					    icon: 'warning',
					    showCancelButton: true,
					    confirmButtonColor: '#3085d6',
					    cancelButtonColor: '#d33',
					    confirmButtonText: '네, 삭제합니다.',
					    cancelButtonText: '취소',
					  });

					  if (result.isConfirmed) {
					    const rno = e.target.getAttribute('href');
					    // 삭제 코드 작성
					    fetch('${pageContext.request.contextPath}/delete'+'/'+rno, {
					      method: 'DELETE',
					    })
					      .then(response => {
					        if (response.ok) { 
					          replyGroup.parentNode.remove();
					        } else {
					          console.error('Error: 삭제 요청이 실패했습니다.');
					        }
					      })
					      .catch(error => {
					        console.error('Error:', error);
					      });
					  }
					});
				 
				 window.addEventListener('scroll', () => {
					  const scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
					  const windowHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

					  if (scrollTop + windowHeight >= document.body.scrollHeight) {
					    // 무한 스크롤 트리거 함수 호출
					    getNextPage();
					  }
					});
	}
</script>