<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>TRIBUS</title>
<style>
	#myForm{
		font-family: 'Noto Sans KR', sans-serif;
	}
	body{
		padding-top: 68px;
	}
</style>
<jsp:include page="../include/navbar.jsp"></jsp:include>
</head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<jsp:include page="../include/resource_script.jsp"></jsp:include>
<body>
	<form action="login.do" method="post" id="myForm">
		<input type="hidden" name="url" value="${url }"/>
	  	<label for="id">아이디</label>
	  	<input type="text" id="id" name="id" class="form-group" 
	  		placeholder="아이디 입력..." value="${savedId }" required autofocus>
	  	<label for="pwd" class="sr-only">비밀번호</label>
	  	<input type="password" id="pwd" name="pwd" class="form-group" 
	  		placeholder="비밀번호 입력..." value="${savedPwd }" required>
		<div class="checkbox mb-3">
		    <label>
		      <input type="checkbox" name="isSave" value="yes"> 로그인 정보 저장
		    </label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		<br>
		<!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align:center"><a href="${url}">
		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
		<br>
	</form>
</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>