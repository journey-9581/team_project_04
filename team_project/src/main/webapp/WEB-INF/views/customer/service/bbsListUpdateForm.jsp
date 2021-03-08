<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- (7) 게시글 리스트를 따로 view로 만든다. -->
	<c:forEach var="tmp" items="${list }">
		<tr>
			<td><c:if test="${tmp.secrete eq 1}">
					<img src="/resources/images/OIP.jpg" style="margin-left: 10px" alt="lockQnAimg">
				</c:if>
			</td>
			<td>
				<c:if test="${tmp.ref ne tmp.num}">
						<span>└ </span>
				</c:if>
				<a href="detail.do?num=${tmp.num }">${tmp.title }</a>
			</td>
			<td>${tmp.writerId }</td>
			<td>${tmp.regDate }</td>
		</tr>
	</c:forEach>
</body>
</html>