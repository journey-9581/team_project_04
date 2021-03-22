<%@page import="com.team04.spring.service.dto.FQnADto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ServiceBoard Detail</title>
<!------------- css 영역------------->  
<jsp:include page="../../include/resource.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<!-- css  -->

<style>	
	/*한글 폰트 적용 (사용법 id="font_1")*/
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
	}
	/*보이는 이미지 사이즈  가운데 정렬*/
	.img{
		height: 250px;
		text-align: center;
	}	
	/* 글 내용을 출력할 div 에 적용할 css */
	.contents{
		width: 100%;
		border: 1px solid #f2f2f2; 
	}
	/* 댓글 프로필 이미지를 작은 원형으로 만든다. */
	.profile-image{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	/* ul 요소의 기본 스타일 제거 */
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 50px;
	}
	.comment-form textarea, .comment-form button{
		float: left;
		
	}
	.comments li{
		clear: left;
	}
	.comments ul li{
		border-top: 1px solid #f2f2f2;
	}
	.comment-form textarea{
		width: 80%;
		height: 50px;
		border: 1px solid #cecece;
		
	}
	.comment-form button{
		width: 15%;
		height: 50px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
	.comments .comment-form{
		display: none;
	}
	/* .reply_icon 을 li 요소를 기준으로 배치 하기 */
	.comments li{
		position: relative;
	}
	.comments .reply-icon{
		position: absolute;
		top: 1em;
		left: 1em;
		color: red;
	}
	pre {
	  display: block;
	  padding: 9.5px;
	  margin: 0 0 10px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #333333;
	  word-break: break-all;
	  word-wrap: break-word;
	  background-color: #f5f5f5;
	  border: 1px solid #f2f2f2;
	  border-radius: 4px;
	}
	/* 글 내용중에 이미지가 있으면 최대 폭을 100%로 제한하기 */
	.contents img{
		max-width: 100%;
	}
	.loader{
		position: fixed; /* 좌하단 고정된 위치에 배치 하기 위해 */
		width: 100%;
		left: 0;
		bottom: 0;
		text-align: center; /* 이미지를 좌우로 가운데  정렬 */
		z-index: 1000;
		display: none; /* 일단 숨겨 놓기 */
	}	
</style>
</head>
<!-------------body 바디 영역 ------------->
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


<!-------------navbar 네비바------------->
<jsp:include page="../../include/navbar.jsp"></jsp:include>

<!-------------contents1 컨텐츠 유료 ------------->
<section class="ftco-section" id="contents-section">
  	<div class="container">
		<!---- 제목 부분 ---->
		<div class="row justify-content-center pb-5">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<!--대분류-->
				<span class="subheading">contents</span>
				<c:choose>
						<c:when test="${((empty param.isQnA)?0:param.isQnA) eq 0}">
							<!--소분류 영어-->
							<h2 class="mb-4"><a href="${pageContext.request.contextPath }/list.do">QnABoard</a></h2>
							<!--소분류 한글 -->
							<p id="font_1">질문답변</p>
							<!-- 버튼 -->
						</c:when>
						<c:otherwise>
							<h2 class="mb-4"><a href="${pageContext.request.contextPath }/list.do">FAQBoard</a></h2>
							<p id="font_1">자주 묻는 질문</p>
						</c:otherwise>
					</c:choose>
				<!-- 관리자만 보이는 버튼 -->
				<!-- 관리자 아이디면 수정 "${manage}='yes" -->
				<c:if test="${not(empty manage) }">
					<c:choose>
						<c:when test="${((empty param.isQnA)?0:param.isQnA) eq 0}">
							<button type="button" class="btn btn-primary btn btn-primary px-5 py-8 mt-1" data-toggle="modal"
									data-target="#replymodal" data-whatever="@getbootstrap">Reply Post</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-primary btn btn-primary px-5 py-8 mt-1" onclick="location.href='updatef.do?num=${dto.num }'">Update Post</button>
						</c:otherwise>
					</c:choose>
					<button id="font_1" class="btn btn px-5 py-8 mt-1" type="button" class="btn btn-primary" data-toggle="modal" data-target="#deletemodal">Delete Post</button>
				</c:if>
			</div>
		</div>	

		<!-- Post 메인 -->		
		<div id="font_1" class="row">			
			<!-- 사이드 컨텐츠 메뉴바 Side bar Contents Categories  -->
			<div class="col-lg-3 sidebar ftco-animate">
				<div class="sidebar-box ftco-animate">
					<!-- <h3 class="heading-sidebar">Contents Categories</h3> -->
					<ul class="categories">
						<%-- <li><a href="#">Review</a></li>
						<li><a href="#">With Us</a></li>
						<li><a href="${pageContext.request.contextPath }/freeboard/list.do">FreeBoard</a></li>
						<li><a href="${pageContext.request.contextPath }/gallery/list.do">Gallery</a></li> --%>
					</ul>
				</div>
			</div>	

			<div class="col-lg-8 ftco-animate">
			<!-- 글 제목 -->
			<h2 id="font_1" class="mb-3" style="text-align: center;">${dto.title }</h2>			            
				<div class="about-author d-flex p-6 bg-light">
					<table id="font_1" class="board_list">
						<thead>
								<tr>
									<th>
									<c:if test="${dto.secrete eq 1}">
										<img src="/resources/images/OIP.jpg" style="margin-left: 10px" alt="lockQnAimg">
									</c:if>
									</th>
									<th>ID: ${dto.writerId }</th>
									<th>${dto.regDate }</th>
									<%-- <th>VEIW: ${dto.secrete }</th> --%>
								</tr>
							</thead>					
					</table>			
				</div>
	            <!-- 컨텐츠 내용 -->
	            <p>${dto.content } </p>
			</div> 	
		</div><!-- row -->	
		<br>
		
		<%--
		<h3 class="mb-3" style="border-bottom: 1px solid #f2f2f2;">Comments</h3>
		<!--댓글 form -->
		
		<form class="comment-form insert-form" action="private/comment_insert.do" method="post">					
			<input type="hidden" name="ref_group" value="${dto.num }"/>		
			<input type="hidden" name="target_id" value="${dto.writer }"/>
			<textarea name="content"><c:if test="${empty id }">로그인이 필요합니다</c:if></textarea>
			<button class="btn btn-primary" type="submit">등록</button>
		</form>	
		
		 <!-- 댓글 목록 -->
		<div class="comments" style="border-bottom: 1px solid #f2f2f2;">
			<ul>
				<c:forEach var="tmp" items="${commentList }">
					<c:choose>
						<c:when test="${tmp.deleted eq 'yes' }">
							<li>삭제된 댓글 입니다.</li>
						</c:when>
						<c:otherwise>
							<li id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if>>
								<c:if test="${tmp.num ne tmp.comment_group }"><svg class="reply-icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-return-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  						<path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 9l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
			  						<path fill-rule="evenodd" d="M3 2.5a.5.5 0 0 0-.5.5v4A2.5 2.5 0 0 0 5 9.5h8.5a.5.5 0 0 0 0-1H5A1.5 1.5 0 0 1 3.5 7V3a.5.5 0 0 0-.5-.5z"/></svg>
								</c:if>
								<dl>
									<dt>
										<c:choose>
											<c:when test="${empty tmp.profile }">
												<svg class="profile-image"  width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  							<path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
												</svg>
											</c:when>
											<c:otherwise>
												<img class="profile-image" 
													src="${pageContext.request.contextPath }${tmp.profile }"/>
											</c:otherwise>
										</c:choose>
										<span>${tmp.writer }</span>
										<c:if test="${tmp.num ne tmp.comment_group }">
											@<i>${tmp.target_id }</i>
										</c:if>
										<span>${tmp.regDate }</span>
										<a data-num="${tmp.num }" href="javascript:" class="reply-link">Reply</a>
										<c:if test="${tmp.writer eq id }">
											| <a data-num="${tmp.num }" href="javascript:" class="comment-update-link">Update</a>
											| <a data-num="${tmp.num }" href="javascript:" class="comment-delete-link">Delete</a>
										</c:if>
									</dt>
									<dd>
										<pre>${tmp.content }</pre>
									</dd>
								</dl>
								<form class="comment-form re-insert-form" 
									action="private/comment_insert.do" method="post">
									<input type="hidden" name="ref_group"
										value="${dto.num }"/>
									<input type="hidden" name="target_id"
										value="${tmp.writer }"/>
									<input type="hidden" name="comment_group"
										value="${tmp.comment_group }"/>
									<textarea name="content"></textarea>
									<button class="btn btn-primary" type="submit">등록</button>
								</form>
								<!-- 로그인된 아이디와 댓글의 작성자가 같으면 수정 폼 출력 -->
								<c:if test="${tmp.writer eq id }">
									<form class="comment-form update-form" 
										action="private/comment_update.do" method="post">
										<input type="hidden" name="num" value="${tmp.num }"/>
										<textarea name="content">${tmp.content }</textarea>
										<button class="btn btn-primary" type="submit">수정</button>
									</form>
								</c:if>
							</li>						
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div><!-- 댓글목록 -->	 --%>

	</div><!--container -->	  	
</section><!-- contents1 섹션-->


<!-- delete Modal -->
		<div class="modal fade" id="deletemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Delete Post</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	정말 삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="location.href='delete.do?num=${dto.num }'">확인</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>

<!-- reply modal 부분 -->
	<div class="modal fade" id="replymodal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<!-- <form action="customer/service/list.do"
						class="bg-light p-4 p-md-5 contact-form">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Recipient:</label>
							<input type="text" class="form-control" id="recipient-name">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Message:</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
						<div class="form-group">
							로그인 상태일 때만 보이게 하기
							<input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
							<img src="resources/images/OIP.jpg" style="margin-left: 10px" alt="lockQnAimg">
							<input type="checkbox" style="margin-left: 5px" value="secretQnA">
						</div>
					</form> -->
				</div>
				<!-- d -->
				<form action="/customer/service/reply.do" id="sermyForm"
					class="bg-light p-4 p-md-5 contact-form">
					<div class="form-group">
						<!-- 로그인 상태면 아이디 출력, 아니면 '로그인 상태가 아닙니다.' -->
						<c:choose>
							<c:when test="${empty sessionScope.id }">
								<p class="mb-3">로그인 상태가 아닙니다.</p>
							</c:when>
							<c:otherwise>
								<p class="mb-3">${sessionScope.id }</p>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Subject"
							name="title" id="title">
						<div class="invalid-feedback">제목을 입력해주세요.</div>
					</div>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"
							placeholder="Message" name="content" id="content"></textarea>
						<div class="invalid-feedback">내용을 입력해주세요.</div>
						
					</div>
					<div><input style="display:none;" name="num" id="num" value="${dto.num }"></input></div>
					<div class="form-group">
						<c:choose>
							<c:when test="${empty sessionScope.id }">
							</c:when>
							<c:otherwise>
								<input type="submit" value="Send Message"
										class="btn btn-primary py-3 px-5">
								<img src="/resources/images/OIP.jpg" style="margin-left: 10px"
										alt="lockQnAimg">
								<input type="checkbox" style="margin-left: 5px" name="secrete">
							</c:otherwise>
						</c:choose>
				</form>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Send message</button> -->
			</div>
		</div>
	</div>
	
	
		
	
	
<div class="loader">
	<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif"/>
</div>   			
<!------------- footer ------------->    
<jsp:include page="../../include/footer.jsp"></jsp:include>


<!-------------script 스크립트------------->
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<jsp:include page="../../include/resource_script.jsp"></jsp:include> 
<script>
	
	//아이디 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	//let isIdValid=false;
	//비밀번호 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	//let isPwdValid=false;
	//이메일 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isTitleValid=false;
	let isContentValid=false;
	//폼 전체의 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isFormValid=false;
	
	//폼에 submit 이벤트가 일어 났을때 jquery 를 활용해서 폼에 입력한 내용 검증하기
	// id 가 myForm 인 요소에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$("#sermyForm").on("submit", function(){
		//폼 전체의 유효성 여부를 얻어낸다.
		isFormValid = isContentValid && isTitleValid;
		//만일 폼이 유효하지 않는다면
		console.log(isFormValid);
		if(!isFormValid){
			if(!isContentValid){
				$("#content").addClass("is-invalid");
			}
			if(!isTitleValid){
				$("#title").addClass("is-invalid");
			}
			return false; ///폼 전송 막기 
		}
	});
	
	//이메일을 입력했을때 실행할 함수 등록
	$("#title").on("input", function(){
		let inputTitle=$("#title").val();
		//만일 이메일이 정규표현식에 매칭되지 않는다면		
		if(!inputTitle){
			isTitleValid=false;
		}else{
			isTitleValid=true;
			$("#title").addClass("is-valid");
		}
		console.log(isTitleValid);
	});
	$("#content").on("input", function(){
		let inputContent=$("#content").val();
		//만일 이메일이 정규표현식에 매칭되지 않는다면		
		if(!inputContent){
			isContentValid=false;
		}else{
			isContentValid=true;
			$("#content").addClass("is-valid");
		}
		console.log(isContentValid);
	});


</script>
</body>
</html>