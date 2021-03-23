<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIBUS</title>
</head>
<body>
   <script>
      alert("${dto.id} 님 회원 가입 되셨습니다");
      location.href="${pageContext.request.contextPath}/user/loginform.do";
   </script>
</body>
</html>