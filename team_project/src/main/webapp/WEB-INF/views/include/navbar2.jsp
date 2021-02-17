<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!--네비바 -->  
	

	<!--헤더 -->
	<header class="site-navbar py-3" role="banner">	
		<div class="container-fluid">
			<div class="row align-items-center">
				
				<!-- 왼쪽 상단 타이틀-->
				<div class="col-6 col-xl-2" data-aos="fade-down">
					<h1 class="mb-0"><a href="home6.do" class="text-white h2 mb-0">Team4Project</a></h1>
				</div>
		          
			<div class="col-10 col-md-8 d-none d-xl-block" data-aos="fade-down">
				
				<!-- 네비바 상단 중앙 -->
				<nav class="site-navigation position-relative text-right text-lg-center" role="navigation">	
					<ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
						
						<!--Home,about us-->
						<li class="active"><a href="home6.do">Home</a></li>
						<li><a href="${pageContext.request.contextPath }/aboutus.do">About us</a></li>                
						
						<!--컨텐츠 메뉴-->
						<li class="has-children">
							<a href="#">Contents</a>
							<!--서브 메뉴 1 -->
							<ul class="dropdown">
								<li><a href="#">서브 메뉴1</a></li>
								<li><a href="#">서브 메뉴2</a></li>
								<li><a href="${pageContext.request.contextPath }/gallery/list5.do">gallery</a></li>
								<li><a href="#">서브 메뉴4</a></li>
								<li><a href="#">서브 메뉴5</a></li>
								<!--서브 메뉴 2 -->
								<li class="has-children">
									<a href="#">서브메뉴2</a>
									<ul class="dropdown">
										<li><a href="#">서브 메뉴1</a></li>
										<li><a href="#">서브 메뉴2</a></li>
										<li><a href="#">서브 메뉴3</a></li>
									</ul>
								</li><!-- 서브메뉴 2-->
							</ul><!-- 서브메뉴 1 -->
						</li><!--컨텐츠-->
						
						<!--예약발권 메뉴-->
						<li class="has-children">
							<a href="#">Reservation</a>
							<!--서브 메뉴 1 -->
							<ul class="dropdown">
								<li><a href="#">서브 메뉴1</a></li>
								<li><a href="#">서브 메뉴2</a></li>
								<li><a href="#">서브 메뉴3</a></li>				
							</ul><!-- 서브메뉴 1 -->
						</li><!--예약발권-->
						
						<!--서비스 ,코로나 메뉴 -->
						<li><a href="#">Service</a></li>
						<li><a href="#">corona</a></li>
						
						<!--로그인 버튼 -->
						<li>
							<a href="${pageContext.request.contextPath }/users/loginform.do" 
								class="btn btn-outline-white py-2 px-4">Log in</a>
						</li><!-- 로그인 -->
					</ul><!--ul 사이트메뉴 -->
				</nav>	<!-- 네비바 -->
			</div>
		
				<!--오른쪽 사이드 바 메뉴 -->
				<div class="col-6 col-xl-2 text-right" data-aos="fade-down">
						<div class="d-none d-xl-inline-block">
							<ul class="site-menu js-clone-nav ml-auto list-unstyled d-flex text-right mb-0" data-class="social">
						</ul>
					</div>
					
					<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;">
						<a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a>
					</div>
				</div>
			</div>
		</div>    
	</header> <!--헤더 -->

