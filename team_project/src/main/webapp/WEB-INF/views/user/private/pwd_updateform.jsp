<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	#myForm{
		font-family: 'Noto Sans KR', sans-serif;
	}
	#submitBtn{
		font-family: 'Noto Sans KR', sans-serif;
	}
	#resetBtn{
		font-family: 'Noto Sans KR', sans-serif;
	}
	body{
		padding-top: 68px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<jsp:include page="../../include/resource_script.jsp"></jsp:include>
</head>
<jsp:include page="../../include/navbar2.jsp"></jsp:include>
<body>
<div class="container">
	<form action="pwd_update.do" method="post" id="myForm">
		<div class="form-group">
			<label for="pwd">기존 비밀번호</label>
			<input type="password" name="pwd" id="pwd" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="newPwd">새 비밀번호</label>
			<input type="password" name="newPwd" id="newPwd" class="form-control"/>
			<div class="invalid-feedback">비밀번호는 5~10자 이내로 입력해주세요</div>
		</div>
		<div class="form-group">
			<label for="newPwd2">새 비밀번호 확인</label>
			<input type="password" id="newPwd2" class="form-control"/>
			<div class="invalid-feedback">새 비밀번호가 일치하는지 확인해주세요</div>
		</div>
		<button type="submit" id="submitBtn" class="btn btn-primary px-5 py-8 mt-1" style="width:180px; height: 40px; text-align: center;">수정하기</button>		
		<button type="reset" id="restBtn" class="btn btn-primary px-5 py-8 mt-1" style="width:160px; height: 40px; text-align: center;">리셋</button>
	</form>
</div>
<script>
	let reg_pwd=/^.{5,10}$/;
	let isPwdValid=false;

	$("#newPwd, #newPwd2").on("input", function(){
		let newPwd=$("#newPwd").val();
		let newPwd2=$("#newPwd2").val();
		
		$("#newPwd").removeClass("is-valid is-invalid");
		$("#newPwd2").removeClass("is-valid is-invalid");
		
		if(!reg_pwd.test(newPwd)){
		 	$("#newPwd").addClass("is-invalid");
		 	isPwdValid=false;
		 	return;
		}
		
		if(newPwd==newPwd2){
			$("#newPwd2").addClass("is-valid");
			isPwdValid=true;
		}else{
			$("#newPwd2").addClass("is-invalid");
			isPwdValid=false;
		}
	});
</script>
</body>
</html>