<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
<!-- <link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.css">
<script src="/resources/js/bootstrap.min.js"></script> -->

<script src="/resources/js/jquery-3.5.1.js"></script>
<!-------------타이틀 (페이지 제목)------------->
<title>ServiceBoard</title>
<!------------- css 영역------------->
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
/*한글 폰트 적용 (사용법 id="font_1")*/
#font_1 {
	font-family: 'Noto Sans KR', sans-serif;
}
/* floating bar */
	#floatMenu {
		position: absolute;
		width: 100px;
		height: auto;
		left: 90%;
		top: 300px;
		z-index: 5;
		text-align: center;
	}
</style>
<script type="text/javascript">
	//url에서 parameter 가져오는 함수
	/* function getParam(sname) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var sval = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == sname) { sval = temp[1]; }
	    }
	    return sval;
	} */
	
	// (2) 말머리 구분 함수 (말머리 버튼을 누르면 실행되게 onclick을 넣어줬습니다.)
	function searchFunction(a){
		
		/* a의 널체크 */
		if (a != '0' && a != '1'){
			console.log(a);
			a = 0;
		}
		
		/* url에 있는 parameter PageNum을 가져옵니다. */
		var pageNum = getParam("pageNum")
		// 널체크
		if(pageNum == null || pageNum == ""){
			pageNum = 1; //기본 페이지 1
		}
		console.log(a);
		
		// (3) servlet단(FQnAController)의 practice.do로 post 방식으로 data 값을 넘깁니다.
		$.ajax({
			url:"/customer/service/practice.do",
			data: { "isQnA": a, "pageNum": pageNum },
			type:"post",
			success:function(result){/* result는 정상적으로 .ajax가 완료 됐을 때 return value*/
				//(8) result는 (7)의 view 전체 값
				$("#ajaxTable").html(result); //id가 ajaxTable인 곳에 결과값 result를 넣어줍니다.
			}
		})
	}
	
	/* (1) 페이지가 업로드 될 때 실행되는 함수 QnA의 말머리를 담당하는 0을 파라미터로 넣어줍니다. */
	/* $(window).bind("pageshow", function (event) {
		if (event.originalEvent.persisted) {
			searchFunction(1);
		}
		else {
			searchFunction(1);
		}
		
	}); */
</script>
</head>
<body>
	<!-------------navbar 네비바------------->
	<jsp:include page="../../include/navbar2.jsp"></jsp:include>
	<!-- floting bar -->
<div class="bg-primary" id="floatMenu" style="color: white; border-radius: 1em;">
	</br>
	<a href="${pageContext.request.contextPath }/premium/list.do">
		<p>Special</p>
	</a>	
	<a href="${pageContext.request.contextPath }/freeboard/list.do">
		<p>Free Board</p>
	</a>
	<a href="${pageContext.request.contextPath }/gallery/list.do">
		<p>Gallery</p>
	</a>
	<a href="${pageContext.request.contextPath }/withboard/list.do">
		<p>With me</p>
	</a>
	<a href="${pageContext.request.contextPath }/review/list.do">
		<p>Review</p>
	</a>
	<a href="${pageContext.request.contextPath }/customer/service/list.do">
		<p>QnA</p>
	</a>	
</div>
	<section class="ftco-section" id="contents-section">
		<div class="container">
			<div class="comment-form-wrap pt-5">
				<!---- 제목 부분 ---->
				<div class="row justify-content-center pb-5">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<!--대분류-->
						<span class="subheading">service</span>
						<c:choose>
							<c:when test="${((empty param.isQnA)?0:param.isQnA) eq 0}">
								<!--소분류 영어-->
								<h2 class="mb-4">QnABoard</h2>
								<!--소분류 한글 -->
								<p id="font_1">질문답변</p>
								<!-- 버튼 -->
								<button type="button" class="btn btn-primary btn btn-primary px-5 py-8 mt-1" data-toggle="modal"
								data-target="#exampleModal" data-whatever="@getbootstrap">New Post</button>
							</c:when>
							<c:otherwise>
								<h2 class="mb-4">FAQBoard</h2>
								<p id="font_1">자주 묻는 질문</p>
								<!-- 관리자만 보이는 버튼 -->
								<c:if test="${not(empty manage) }">
									<button type="button" class="btn btn-primary btn btn-primary px-5 py-8 mt-1"
											onclick="location.href='insertf.do'">New Post</button>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div >
					<!-- 자유게시판 테이블-->
				<div class="board_list_wrap">
					<!-- category 카테고리 -->
					<h3 class="heading-sidebar">Select Category</h3>
					<div class="tagcloud">
						<a id="font_1" href="list.do?isQnA=0" class="tag-cloud-link">QNA</a>
						<a id="font_1" href="list.do?isQnA=1" class="tag-cloud-link">FAQ</a>
					</div>
					<!-- 테이블 -->
					<table class="board_list">
						<thead>
							<tr>
								<th>No.</th>
								<th>Title</th>
								<th>Writer</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody style="font-weight: bold; color: black;">
							<tr>
								<td style="color: purple;">Notice</td>
								<td><a href="/customer/service/detail">공지제목</a></td>
								<td>admin</td>
								<td>날짜</td>
							</tr>
						</tbody>
						<tbody id="ajaxTable">
							<!-- (7) 게시글 리스트를 따로 view로 만든다. -->
							<c:forEach var="tmp" items="${list }">
								<tr>
									<td><c:if test="${tmp.secrete eq 1}">
											<img src="/resources/images/OIP.jpg" style="margin-left: 10px" alt="lockQnAimg">
										</c:if>
									</td>
									<td>
										<c:if test="${tmp.ref ne tmp.num}">
												<span>└ </span>
										</c:if>
										<a href="detail.do?isQnA=${isQnA }&num=${tmp.num }">${tmp.title }</a>
									</td>
									<td>${tmp.writerId }</td>
									<td>${tmp.regDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:set var="page" value="${(empty param.pageNum)?1:param.pageNum}"/>
				<c:set var="startNum" value="${page-(page-1)%5}"/>
				<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}"/>
				
				<!-- 페이징 처리 -->
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<c:choose>
									<c:when test="${startNum ge 1 }">
										<li><a
											href="list.do?isQnA=${isQnA }&pageNum=${startNum-1 }">&lt;</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:">&lt;</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach var="i" begin="0" end="4">
									<c:if test="${(startNum+i) <= lastNum}">									
									<li class="${(page eq (startNum+i))?'active':''}">
										<a
											href="list.do?isQnA=${isQnA}&pageNum=${startNum+i}">${startNum+i}
										</a>
									</li>
									</c:if>
								</c:forEach>

								<c:choose>
									<c:when test="${startNum+5 lt lastNum }">
										<li><a
											href="list.do?isQnA=${isQnA }&pageNum=${startNum+5}">&gt;</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				</div>
				<!-- 페이징처리 -->
				<br>

				<!--검색 Search -->
				<%-- <div class="form-group">
				<form action="list.do" method="get" class="search-form">				
					<input id="font_1" class="form-control" type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
					<button class="btn btn-primary px-5 py-8 mt-1" type="submit">Search</button>		
				</form>
			</div>
			만일 검색 키워드가 존재한다면 몇개의 글이 검색 되었는지 알려준다.
			<c:if test="${not empty keyword }">
				<div class="alert alert-success">
					<strong>${totalRow }</strong> 개의 자료가 검색되었습니다.
				</div>
			</c:if> --%>
			</div>
		</div>
		<!-- container -->
	</section>
	<!-- modal 부분 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
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
				<form action="insert.do" id="sermyForm" method="post""
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
				<%-- 	<div class="form-group">
						<c:choose>
							<c:when test="${empty sessionScope.id }">
								<p class="mb-3">로그인 상태가 아닙니다.</p>
							</c:when>
							<c:otherwise>
								<p class="mb-3">이메일</p>
							</c:otherwise>
						</c:choose>
					</div> --%>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Subject"
							name="title" id="title"/>
						<div class="invalid-feedback">제목을 입력해주세요.</div>
					</div>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"
							placeholder="Message" name="content" id="content"></textarea>
						<div class="invalid-feedback">내용을 입력해주세요.</div>
						
					</div>
					<div class="form-group">
						<c:choose>
							<c:when test="${empty sessionScope.id }">
							</c:when>
							<c:otherwise>
								<input type="submit" value="Send Message"
										class="btn btn-primary py-3 px-5">
								<img src="/resources/images/OIP.jpg" style="margin-left: 10px"
										alt="lockQnAimg">
								<input type="checkbox" style="margin-left: 5px" name="secrete" id="secrete">
							</c:otherwise>
						</c:choose>
						
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Send message</button> -->
			</div>
		</div>
	</div>
	</div>
	
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
		$(document).ready(function() {

			// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
			var floatPosition = parseInt($("#floatMenu").css('top'));
			// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

			$(window).scroll(function() {
				// 현재 스크롤 위치를 가져온다.
				var scrollTop = $(window).scrollTop();
				var newPosition = scrollTop + floatPosition;

				/* 애니메이션 없이 바로 따라감
				 $("#floatMenu").css('top', newPosition);
				 */

				$("#floatMenu").stop().animate({
					"top" : newPosition
				}, 500);

			}).scroll();

		});
	</script>
	<!------------- footer ------------->
	<jsp:include page="../../include/footer.jsp"></jsp:include>

	<!-------------script 스크립트------------->
	<jsp:include page="../../include/resource_script.jsp"></jsp:include>
</body>
</html>