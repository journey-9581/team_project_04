<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIBUS</title>
<style>
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<jsp:include page="../include/navbar.jsp"></jsp:include>
</head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<body class="text-center">
<form class="form-signin" action="login.do" method="post">
	<input type="hidden" name="url" value="${url }"/>
	
  	<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  	
  	<label for="id" class="sr-only">아이디</label>
  	<input type="text" id="id" name="id" class="form-control" 
  		placeholder="아이디 입력..." value="${savedId }" required autofocus>
  		
  	<label for="pwd" class="sr-only">비밀번호</label>
  	<input type="password" id="pwd" name="pwd" class="form-control" 
  		placeholder="비밀번호 입력..." value="${savedPwd }" required>
  		
	<div class="checkbox mb-3">
	    <label>
	      <input type="checkbox" name="isSave" value="yes"> 로그인 정보 저장
	    </label>
	</div>
	<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	<p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
</form>
</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>