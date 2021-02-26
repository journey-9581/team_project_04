<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<head>
<title>TRIBUS</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="preconnect" href="https://fonts.gstatic.com">
<title>Join us</title>
</head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<div class="container">
		<form action="signup.do" method="post" id="myForm" novalidate>
			<input type="hidden" name="pay" id="pay" value="yes"/>
			<input type="hidden" name="manage" id="manage" value="no"/>
			<div class="form-group">
				<label for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id"/>
				<small class="form-text text-muted">소문자로 시작하는 5~10글자의 아이디를 작성해주세요</small>
				<div class="invalid-feedback">사용할 수 없는 아이디 입니다</div>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
				<small class="form-text text-muted">숫자와 문자 포함 6~12자리 이내의 비밀번호를 작성해주세요</small>
				<div class="invalid-feedback">비밀번호 양식에 맞는지 확인해주세요</div>
			</div>
			<div class="form-group">
				<label for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="password" name="pwd2" id="pwd2"/>
				<div class="invalid-feedback">입력하신 비밀번호와 일치하는지 확인해주세요</div>
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input class="form-control" type="email" name="email" id="email"/>
				<div class="invalid-feedback">이메일 형식을 확인해주세요</div>
			</div>
			<div class="form-group">
				<label for="phone">핸드폰</label>
				<input class="form-control" type="text" name="phone" id="phone"/>
				<small class="form-text text-muted">000-0000-0000의 형식으로 작성해주세요</small>
				<div class="invalid-feedback">핸드폰 형식을 확인해주세요</div>
			</div>
			<button class="btn btn-outline-primary" type="submit">가입</button>
		</form>
	</div>
	<jsp:include page="../include/resource_script.jsp"></jsp:include>
	<script>
	let reg_id=/^[a-z].{4,9}$/;
	let reg_pwd=/^[A-Za-z0-9]{6,12}$/;
	let reg_email=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let reg_phone=/^\d{3}-\d{3,4}-\d{4}$/;
	
	let isIdValid=false;
	let isPwdValid=false;
	let isEmailValid=false;
	let isPhoneValid=false;
	let isFormValid=false;
	
	$("#myForm").on("submit", function(){
		isFormValid = isIdValid && isPwdValid && isEmailValid && isPhoneValid;
		if(!isFormValid){
			return false;
		}
	});
	
	$("#phone").on("input", function(){
		let inputPhone=$("#phone").val();
		$("#phone").removeClass("is-valid is-invalid");
		if(!reg_phone.test(inputPhone)){
			isPhoneValid=false;
			$("#phone").addClass("is-invalid");
		}else{
			isPhoneValid=true;
			$("#phone").addClass("is-valid");
		}
	});

	$("#email").on("input", function(){
		let inputEmail=$("#email").val();
		$("#email").removeClass("is-valid is-invalid");
		if(!reg_email.test(inputEmail)){
			isEmailValid=false;
			$("#email").addClass("is-invalid");
		}else{
			isEmailValid=true;
			$("#email").addClass("is-valid");
		}
	});
	
	$("#pwd, #pwd2").on("input", function(){
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		
		$("#pwd").removeClass("is-valid is-invalid");
		
		if(!reg_pwd.test(pwd)){
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
			return;
		}
		
		$("#pwd2").removeClass("is-valid is-invalid");
		
		if(pwd==pwd2){
			$("#pwd2").addClass("is-valid");
			isPwdValid=true;
		}else{
			$("#pwd2").addClass("is-invalid");
			isPwdValid=false;
		}
	});

	$("#id").on("input", function(){
		let inputId=$("#id").val();
		
		$("#id").removeClass("is-valid is-invalid");
		
		if(!reg_id.test(inputId)){
			$("#id").addClass("is-invalid");
			isIdValid=false;
			return;
		}
		$.ajax({
			url:"${pageContext.request.contextPath }/user/checkid.do",
			method:"GET",
			data:"inputId="+inputId,
			success:function(responseData){
				if(responseData.isExist){
					$("#id").addClass("is-invalid");
					isIdValid=false;
				}else{
					$("#id").addClass("is-valid");
					isIdValid=true;
				}
			}
		});
	});
	</script>
</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>