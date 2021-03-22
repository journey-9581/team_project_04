<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!-------------navbar 네비바------------->
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar" style="z-index: 100;">
	<div class="container">
		<!-- 상단 왼쪽 로고 타이틀 -->
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">TRIBUS</a>
			<!-- menu(메뉴) 버튼 상단 -->
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" 
				data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				 <span class="oi oi-menu"></span>Menu
			</button>		
		<!-- 네비바 메뉴 -->
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav nav ml-auto">				
				<c:choose>
					<c:when test="${empty sessionScope.id }">
						<li class="nav-item"><a href="${pageContext.request.contextPath }/user/loginform.do" class="btn btn-primary px-5 py-8 mt-1" style="width:160px; height: 40px; text-align: center;" >Login</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath }/user/signupform_select.do" class="btn btn-white px-5 py-8 mt-1" style="width:160px; height: 40px; text-align: center;">Sign up</a></li>
					</c:when>
					<c:otherwise>
							<!-- by도영 로그인info 디자인 수정 #e2c0bb 	#FFB6C1-->
							<li class="nav-item"><a class="nav-link" style="width:160px; height: 40px; text-align: center; color:#e2c0bb; font-weight: bold;"  
								href="${pageContext.request.contextPath }/user/private/info.do">${id }</a></li>					
							<li class="nav-item"><a href="${pageContext.request.contextPath }/user/logout.do" class="btn btn-white px-5 py-8 mt-1" style="width:160px; height: 40px; text-align: center;">Logout</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div><!-- div container -->
</nav><!-- navbar -->