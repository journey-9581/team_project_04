<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자유게시판 테이블-->
				<div class="board_list_wrap">
					<!-- category 카테고리 -->
					<h3 class="heading-sidebar">Select Category</h3>
					<div class="tagcloud">
						<a id="font_1" onclick="searchFunction(0);" class="tag-cloud-link">Q&A</a>
						<a id="font_1" onclick="searchFunction(1);" class="tag-cloud-link">F&A</a>
					</div>
					<!-- 테이블 -->
					<table class="board_list">
						<thead>
							<tr>
								<th>No.</th>
								<th>Title</th>
								<th>Writer</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody style="font-weight: bold; color: black;">
							<tr>
								<td style="color: purple;">Notice</td>
								<td><a href="/customer/service/detail">공지제목</a></td>
								<td>admin</td>
								<td>날짜</td>
							</tr>
						</tbody>
						<tbody id="ajaxTable">
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
						</tbody>
					</table>
				</div>

				<c:set var="page" value="${(empty param.pageNum)?1:param.pageNum}"/>
				<c:set var="startNum" value="${page-(page-1)%5}"/>
				<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}"/>
				
				<!-- 페이징 처리 -->
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<c:choose>
									<c:when test="${startNum ge 1 }">
										<li><a
											href="list.do?pageNum=${startNum-1 }">&lt;</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:">&lt;</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach var="i" begin="0" end="4">
									<c:if test="${(startNum+i) <= lastNum}">									
									<li class="${(page eq (startNum+i))?'active':''}"><a
										href="list.do?pageNum=${startNum+i}">${startNum+i}</a>
									</li>
									</c:if>
								</c:forEach>

								<c:choose>
									<c:when test="${startNum+5 lt lastNum }">
										<li><a
											href="list.do?pageNum=${startNum+5}">&gt;</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
</body>
</html>