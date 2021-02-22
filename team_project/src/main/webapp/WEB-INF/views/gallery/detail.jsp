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
</style>
</head>
<body>
<!-------------navbar 네비바------------->
<jsp:include page="../include/navbar.jsp"></jsp:include>

<section class="ftco-section" id="contents-section">
	<div class="container">
		<div class="comment-form-wrap pt-5">
			<!---- 제목 부분 ---->
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<!--카테고리-->
					<span class="subheading">Gallery</span>
					<!--내용-->
					<h2 class="mb-4">${dto.caption }</h2>			
				</div>
			</div>
			<!--detail 이미지 출력 -->
			<img src="${pageContext.request.contextPath }${tmp.imagePath}" class="img-fluid" alt="Colorlib Free Template">
			<div class="col-md-5 ftco-animate">
				<div class="text py-5">
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
		</div>
	</div>
</section>
<!------------- footer ------------->    
<jsp:include page="../include/footer.jsp"></jsp:include>   
  
<!-------------script 스크립트------------->
<jsp:include page="../include/resource_script.jsp"></jsp:include>
</body>
</html>