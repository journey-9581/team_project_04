<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
<!-------------타이틀 (페이지 제목)------------->
<title>Image upload</title>
<!------------- css 영역------------->  
<jsp:include page="../include/resource.jsp"></jsp:include>

<style>	
	/*한글 폰트 적용 (사용법 id="font_1")*/
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
	}
	/*이미지 사이즈*/
	.img-fluid{
		Weight: 800px;			
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
</head>
<body>
<!-------------navbar 네비바------------->
<jsp:include page="../include/navbar2.jsp"></jsp:include>
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
					<!--카테고리-->
					<span class="subheading"><a href="${pageContext.request.contextPath }/gallery/list.do">Gallery</a></span>
					<!--내용-->
					<h2 class="mb-4">${dto.caption }</h2>	
					<!-- 이미지 삭제 버튼 -->		
					<!-- 아이디가 같으면 삭제 -->
					<c:if test="${dto.writer eq id }">
						<a id="font_1" href="javascript:deleteConfirm()" class="btn btn-primary px-5 py-8 mt-1"> Delete Image</a>
					</c:if>
				</div>
			</div>
			<!--detail 이미지 출력 -->
			<p style="text-align: center">
				<img src="${pageContext.request.contextPath }${dto.imagePath}" class="img-fluid" alt="Colorlib Free Template" style="text-align: center">
			</p>			
			<div class="text py-5" style="text-align: center">
				<!-- 작성자 -->
				<h3><a href="#">${dto.writer }</a></h3>
				<!-- 날짜 -->
				<p class="pos">${dto.regdate}</p>					
				<!-- 이전글 다음글 이동 -->
				<c:choose>
					<c:when test="${dto.prevNum ne 0 }">
						<a href="detail.do?num=${dto.prevNum }" class="btn btn-secondary">Prev</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:" class="btn btn-secondary">Prev</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${dto.nextNum ne 0 }">
						<a href="detail.do?num=${dto.nextNum }" class="btn btn-primary">Next</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:" class="btn btn-primary">Next</a>
					</c:otherwise>
				</c:choose>					 					
			</div>   		
		</div>
	</div><!-- container -->
</section>
<!------------- footer ------------->    
<jsp:include page="../include/footer.jsp"></jsp:include>   
  
<!-------------script 스크립트------------->
<jsp:include page="../include/resource_script.jsp"></jsp:include>
<script>
//글 삭제 
function deleteConfirm(){
	var isDelete=confirm("이 글을 삭제 하시겠습니까?");
	if(isDelete){
		location.href="${pageContext.request.contextPath }/gallery/private/delete.do?num=${dto.num}";
	}
}
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
</body>
</html>