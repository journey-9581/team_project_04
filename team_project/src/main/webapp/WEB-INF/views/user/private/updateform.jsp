<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIBUS</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#profileForm{
		display: none;
	}
</style>
</head>
<body class="pt-5">
<div class="container">
	<a id="profileLink" href="javascript:">
		<c:choose>
			<c:when test="${empty dto.profile }">
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
	  				<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
				</svg>
			</c:when>
			<c:otherwise>
				<img id="profileImage" src="${pageContext.request.contextPath }${dto.profile}"/>
			</c:otherwise>
		</c:choose>
	</a>
	<form action="update.do" method="post">
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" value="${id }" disabled/>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="text" id="email" name="email" value="${dto.email }"/>
		</div>
		<div>
			<label for="phone">휴대전화</label>
			<input type="text" id="phone" name="phone" value="${dto.phone }"/>
		</div>
		<button type="submit">수정</button>
		<button type="reset">리셋</button>
	</form>
	<form action="profile_upload.do" method="post" 
		enctype="multipart/form-data" id="profileForm">
		<label for="image">프로필 이미지 선택</label>
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		<button type="submit">업로드</button>
	</form>
</div>
<script>
	$("#profileLink").on("click", function(){
		$("#image").click();
	});
	
	$("#image").on("change", function(){
		$("#profileForm").submit();
	});
</script>
</body>
</html>