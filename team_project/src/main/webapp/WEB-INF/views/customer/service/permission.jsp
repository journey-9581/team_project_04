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
	alert("권한이 없습니다.");
	location.href="${pageContext.request.contextPath }/customer/service/list.do";
</script>
</body>
</html>