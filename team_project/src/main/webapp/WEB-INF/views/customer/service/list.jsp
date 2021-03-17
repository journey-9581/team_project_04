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
<title>FreeBoard</title>
<!------------- css 영역------------->
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
/*한글 폰트 적용 (사용법 id="font_1")*/
#font_1 {
	font-family: 'Noto Sans KR', sans-serif;
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
	<jsp:include page="../../include/navbar.jsp"></jsp:include>

	<section class="ftco-section" id="contents-section">
		<div class="container">
			<div class="comment-form-wrap pt-5">
				<!---- 제목 부분 ---->
				<div class="row justify-content-center pb-5">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<!--대분류-->
						<span class="subheading">contents</span>
						<!--소분류 영어-->
						<h2 class="mb-4">FreeBoard</h2>
						<!--소분류 한글 -->
						<p id="font_1">자유게시판</p>
						<!-- 버튼 -->
						<button type="button" class="btn btn-primary btn btn-primary px-5 py-8 mt-1" data-toggle="modal"
							data-target="#exampleModal" data-whatever="@getbootstrap">New Post</button>
						<!-- 관리자만 보이는 버튼 -->
						<button type="button" class="btn btn-primary btn btn-primary px-5 py-8 mt-1"
						onclick="location.href='insertf.do'">New F&A</button>
					</div>
				</div>

				<div id="ajaxTable">
				
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
				<form action="/customer/service/insert.do" id="sermyForm"
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
							name="title" id="sertitle">
						<div class="invalid-feedback">제목을 입력해주세요.</div>
					</div>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"
							placeholder="Message" name="content" id="sercontent"></textarea>
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
								<input type="checkbox" style="margin-left: 5px" name="secrete">
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
					$("#sercontent").addClass("is-invalid");
				}
				if(!isTitleValid){
					$("#sertitle").addClass("is-invalid");
				}
				return false; ///폼 전송 막기 
			}
		});
		
		//이메일을 입력했을때 실행할 함수 등록
		$("#sertitle").on("input", function(){
			let inputTitle=$("#sertitle").val();
			//만일 이메일이 정규표현식에 매칭되지 않는다면		
			if(!inputTitle){
				isTitleValid=false;
			}else{
				isTitleValid=true;
				$("#sertitle").addClass("is-valid");
			}
			console.log(isTitleValid);
		});
		$("#sercontent").on("input", function(){
			let inputContent=$("#sercontent").val();
			//만일 이메일이 정규표현식에 매칭되지 않는다면		
			if(!inputContent){
				isContentValid=false;
			}else{
				isContentValid=true;
				$("#sercontent").addClass("is-valid");
			}
			console.log(isContentValid);
		});
	</script>
	<!------------- footer ------------->
	<jsp:include page="../../include/footer.jsp"></jsp:include>

	<!-------------script 스크립트------------->
	<jsp:include page="../../include/resource_script.jsp"></jsp:include>
</body>
</html>