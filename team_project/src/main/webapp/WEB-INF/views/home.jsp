<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head><!-- 헤드 -->
<!-------------타이틀 (페이지 제목)------------->
<title>TRIBUS</title>

<!-------------- css 영역------------->  
<jsp:include page="include/resource.jsp"></jsp:include>
<style>	
/*한글 폰트 적용 (사용법 id="font_1")*/
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
	}
	/* floating bar */
    #floatMenu {
    position: absolute;
    width: 100px;
    height: 200px;
    left: 95.7%;
    top: 650px;
    z-index: 5;
    text-align: center;
    border-radius: 1em;
	}
</style>
<!-- 
	CSS ,js,image 링크 주소	
	${pageContext.request.contextPath }/resources/css7/
	${pageContext.request.contextPath }/resources/js7/
	${pageContext.request.contextPath }/resources/images7/
	${pageContext.request.contextPath }/resources/image_p/
	
 -->
</head><!-- 헤드 -->

<!-------------body 바디 영역 ------------->
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- floting bar -->
<div class="bg-primary" id="floatMenu" style="height: auto; width: auto; color: white;">
    <div>
        <a href="#home-section">
            <img src="${pageContext.request.contextPath }/resources/images7/chevron-up-solid.svg" style="width: 50px; height: 50px;"/>
        </a>
    </div>
</div>
<!-------------navbar 네비바------------->
<jsp:include page="include/navbar.jsp"></jsp:include>

<!-------------Home 홈 섹션  ------------->	  
<section id="home-section" class="hero">
	<!--회색 배경 그림 -->
	<img src="resources/images7/blob-shape-3.svg" class="svg-blob" alt="Colorlib Free Template">	
	<div class="home-slider owl-carousel">		
		<!-------------홈 메인 1 ------------->
		<div class="slider-item">
			<div class="overlay"></div>
			<div class="container-fluid p-0">
				<div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
					<!----홈 이미지 1---->
					<div class="one-third order-md-last">						
						<div class="img" style="background-image:url(${pageContext.request.contextPath }/resources/image_p/main_image1.jpg);">
							<div class="overlay"></div>
						</div>
						<!-- 이미지 위 분홍 박스 텍스트1 / 홈 이미지 1-1 -->
						<div class="vr">						
							<span class="pl-3 py-4" style="background-image: url(${pageContext.request.contextPath }/resources/image_p/main_image1.jpg);">
								Tribus1
							</span>
						</div>
					</div>
					<!----텍스트1---->
					<div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
						
						<div class="text">
							<!--제목1 -->
							<span class="subheading pl-5">Tribus1</span>
							<!--소제목1 -->
							<h1 id="font_1" class="mb-4 mt-3">부제1</span></h1>
							<!--내용1 -->
							<p id="font_1">
								내용 - 어쩌구 저쩌구 12345671234567 아무말 아무말 대잔치 !!!					
							</p>	
							<!-- 버튼1 -->					
							<p><a href="#" class="btn btn-primary px-5 py-3 mt-3">button1</a></p>
						</div><!-- text 2-->
					</div>					
				</div><!--row 2-->
			</div><!-- container-fluid 1 -->
		</div><!-- 홈 메인1 -->
		
		<!-------------홈 메인 2------------->
		<div class="slider-item">
		<div class="overlay"></div>
			<div class="container-fluid p-0">
				<div class="row d-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
					<!----홈 이미지 2---->
					<div class="one-third order-md-last">					
						<div class="img" style="background-image:url(${pageContext.request.contextPath }/resources/images7/bg_2.jpg);">
							<div class="overlay"></div>
						</div>
						<!-- 이미지 위 분홍 박스 텍스트2 / 홈 이미지 2-2 -->
						<div class="vr">						
							<span class="pl-3 py-4" style="background-image: url(${pageContext.request.contextPath }/resources/images7/bg_2-2.jpg);">
								Tribus2
							</span>
						</div>
					</div>
					<!----텍스트2---->
					<div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">						
						<div class="text">
							<!--제목2 -->
							<span class="subheading pl-5">Tribus2</span>
							<!--소제목2 -->
							<h1 id="font_1" class="mb-4 mt-3">부제2</span></h1>
							<!--내용2 -->
							<p id="font_1">
								내용 - 어쩌구 저쩌구 12345671234567 아무말 아무말 대잔치 !!!					
							</p>	
							<!-- 버튼2 -->					
							<p><a href="#" class="btn btn-primary px-5 py-3 mt-3">button2</a></p>
						</div><!-- text 2-->
					</div>						
				</div><!--row 2-->
			</div><!-- container-fluid 2 -->
		</div><!-- 홈 메인 2 -->		
	</div><!-- home-slider  -->
</section><!--Home 홈 섹션 -->

<!-------------about 소개글------------->
<section class="ftco-counter img ftco-section" id="about-section">
	<div class="container">
		<div class="row no-gutters d-flex">
			<!--소개글 이미지 -->
			<div class="col-md-6 col-lg-5 d-flex">				
				<div class="img d-flex align-self-stretch align-items-center" 
					style="background-image:url(${pageContext.request.contextPath }/resources/image_p/main_image1.jpg);">
				</div>
			</div>
			<!--About 소개글 텍스트 -->
			<div class="col-md-6 col-lg-7 px-lg-5 py-md-5 bg-darken">
				<div class="py-md-5">
					<div class="row justify-content-start pb-3">
						<div class="col-md-12 heading-section ftco-animate p-5 p-lg-0">
							<!--소제목-->
							<span class="subheading">Get in touch with us</span>
							<!--제목 -->
							<h2 class="mb-4">Get Best Travel Deals</h2>
							<!--내용 -->
							<p id="font_1">소개글1 내용어쩌구 저쩌구 아무말 </p>
							<p id="font_1">소개글2 어쩌구 저쩌구 여행 </p>
							<p id="font_1">소개글3 내용 어쩌구 아무말 아무말</p>
							<!--버튼 -->
							<p>
								<a href="#" class="btn btn-primary py-3 px-4">button1</a>
								<a href="#" class="btn btn-white py-3 px-4">button2</a>
							</p>
						</div>
					</div>
				</div>
			</div><!-- About text -->
		</div>
	</div>
</section><!-- about 소개글 섹션 -->
    
<!------------ Special part ------------->
<section class="ftco-section" id="contents-section">
  	<div class="container">
		<!---- 제목 부분 ---->
		<div class="row justify-content-center pb-5">
		<div class="col-md-12 heading-section text-center ftco-animate">
			
			<!--제목-->
			<h2 class="mb-4">Special Pick </h2>
			<!--내용 -->
			<p id="font_1">특별한 여행을 원하시면,</p>
			<!-- 버튼 -->
			<a id="font_1" href="${pageContext.request.contextPath }/premium/list.do" class="btn btn-primary px-5 py-8 mt-1">더 알아보기</a>
		</div>
		</div>
	
		<div class="row">	
			<!---- 첫번째 POST1 ---->
			<div class="col-md-6 col-lg-4 ftco-animate">
				<div class="project">
					<!-- 이미지1 -->
					<div class="img">
						<!-- 세일표시 -->
						<div class="vr"><span>Sale</span></div>				
						<a href="${pageContext.request.contextPath }/premium/detail.do?num=36">				
							<img src="${pageContext.request.contextPath }/resources/images7/thumb.jpg" 
								class="img-fluid" alt="Colorlib Template">
						</a>
					</div>					
					<!-- 텍스트1 -->
					<div class="text">
						<!-- 가격 -->
						<h4 class="price"><span class="old-price mr-2">$200,000</span>$130,000</h4>
						<span >1박2일, 2인</span>
						<h3 id="font_1"><a href="${pageContext.request.contextPath }/premium/detail.do?num=36">#파파홈 #글램핑 #캠핑</a></h3>
						<div class="star d-flex clearfix">
							<div class="mr-auto float-left">
								<!-- 별표-->
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
							</div>
							<div class="float-right">
								<!-- 댓글수? 
								<span class="rate"><a href="#">(120)</a></span>-->
							</div>
						</div>
					</div>	
					<!-- 이미지1 -->
					<a href="${pageContext.request.contextPath }/resources/images7/thumb.jpg" 
						class="icon image-popup d-flex justify-content-center align-items-center">
						<!--이미지 오른쪽 상단 확대 아이콘1-->
						<span class="icon-expand"></span>
					</a>
				</div><!-- project1 -->
			</div><!-- 첫번째 POST1 -->
			
			<!---- 두번째 POST2 ---->
			<div class="col-md-6 col-lg-4 ftco-animate">
				<div class="project">
					<!-- 이미지2 -->
					<div class="img">
						<a href="${pageContext.request.contextPath }/premium/detail.do?num=43">
							<img src="${pageContext.request.contextPath }/resources/images7/R0980826.JPG" 
								class="img-fluid" alt="Colorlib Template">
						</a>
					</div>
					<!-- 텍스트2 -->
					<div class="text">
						<h4 class="price">₩400,000</h4>
						<span id="font_1">3박 4일, 2인</span>
						<h3 id="font_1"><a href="${pageContext.request.contextPath }/premium/detail.do?num=43">국내에서 프라이빗 비치 본적있어?</a></h3>
						<div class="star d-flex clearfix">
							<div class="mr-auto float-left">
								<!--  별표 -->
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
							</div>
							<div class="float-right">
								<!--  <span class="rate"><a href="#">(120)</a></span>-->
							</div>
						</div>
					</div>
					<!-- 이미지2-2 -->
					<a href="${pageContext.request.contextPath }/resources/images7/R0980826.jpg" 
						class="icon image-popup d-flex justify-content-center align-items-center">
						<!--이미지 오른쪽 상단 확대 아이콘2-->
						<span class="icon-expand"></span>
					</a>
				</div><!--project2 -->
			</div><!-- 두번째 POST2 -->
	
			<!---- 세번째 POST3 ---->
			<div class="col-md-6 col-lg-4 ftco-animate">
				<div class="project">
					<!-- 이미지 3 -->
					<div class="img">
						<a href="${pageContext.request.contextPath }/premium/detail.do?num=41">
							<img src="${pageContext.request.contextPath }/resources/images7/R0981180.JPG" 
								class="img-fluid" alt="Colorlib Template">
						</a>
					</div>
					<!-- 텍스트3 -->
					<div class="text">
						<h4 class="price">$400,000</h4>
						<span id="font_1">2박 3일, 2인</span>
						<h3 id="font_1"><a href="${pageContext.request.contextPath }/premium/detail.do?num=41">등산여행은 #산 새</a></h3>
						<div class="star d-flex clearfix">
							<div class="mr-auto float-left">
							<!--별표-->
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>
								<span class="ion-ios-star"></span>		
							</div>
							<div class="float-right">
								<!-- <span class="rate"><a href="#">(120)</a></span> -->
							</div>
						</div>
					</div>
					<!-- 이미지3-2 -->
					<a href="${pageContext.request.contextPath }/resources/images7/R0981180.JPG" 
						class="icon image-popup d-flex justify-content-center align-items-center">
								<span class="icon-expand"></span>
					</a>
				</div><!--project3 -->
			</div><!-- 세번째 POST3 -->
		</div><!--row -->
	</div><!--container -->
</section><!-- contents1 섹션-->
    
<!-------------contents2 컨텐츠------------->
<section class="ftco-section bg-light" id="blog-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<!-- 소제목 -->
				<span class="subheading">컨텐츠</span>
				<!-- 제목 -->
				<h2 class="mb-4">Contents2</h2>
				<!-- 내용 -->
				<p>Eat,Talking,Share</p>							
			</div>
		</div>
	<div class="row d-flex">
			<!---- 세번째 POST1 ---->
			<div class="col-md-6 col-lg-6 ftco-animate">
				<div class="blog-entry">
					<a href="${pageContext.request.contextPath }/review/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/food2.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">Review</span>
								<p id="font_1" style="color: white">추천&리뷰</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!-- 세번째 POST1 -->
			
			<!---- 세번째 POST2 ---->
			<div class="col-md-6 col-lg-6 ftco-animate">
				<div class="blog-entry">
					<a href="${pageContext.request.contextPath }/withboard/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/with.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">With Us</span>
								<p id="font_1" style="color: white">동행</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!-- 세번째 POST2 -->
			
			<!---- 세번째 POST3 ---->
			<div class="col-md-6 col-lg-6 ftco-animate">
				<div class="blog-entry">
					<a href="${pageContext.request.contextPath }/freeboard/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/light.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">Free board</span>
								<p id="font_1" style="color: white">자유게시판</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!-- 세번째 POST3 -->			
			
			<!---- 세번째 POST4 ---->
			<div class="col-md-6 col-lg-6 ftco-animate">
				<div class="blog-entry">
					<a href="gallery/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/kbg.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">Gallery</span>
								<p id="font_1" style="color: white">갤러리</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!-- 세번째 POST4 -->				
		</div><!-- row -->
	</div><!-- container -->
</section><!-- contents2 섹션 -->

<!-------------Reservation 예약 섹션 ------------->
<section class="ftco-intro img" id="Reservation-section" 
	style="background-image: url(${pageContext.request.contextPath }/resources/images7/bg_3.jpg);"><!--이미지 -->
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-9 text-center">
				<!-- 제목 -->
				<h2>Reservation</h2>
				<!-- 내용 -->
				<p id="font_1">내용 예약 발권 여기로!! </p>
				<!-- 버튼 -->
				<p id="font_1" class="mb-0">
					<a href="#" class="btn btn-white px-4 py-3">자세히 보기</a>
				</p>
			</div>
		</div>
	</div>
</section><!--Reservation 섹션-->
  
<!-------------Service 서비스 섹션 ------------->
<section class="ftco-section contact-section ftco-no-pb" id="service-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<!-- 소제목 -->
				<span class="subheading">소제목</span>    
				<!-- 제목 -->     
				<a href="/customer/service/list.do">
					<h2 class="mb-4">Service</h2>
				</a>
				<!-- 내용 -->
				<p id="font_1">서비스 내용 어쩌구 저쩌구 블라블라 아무말 아무말 대잔치</p>
			</div>
		</div>		
		<div class="row block-9">			
			<!----Q&A 전송 폼---->
			<div class="col-md-7 order-md-last d-flex">
			
				<form action="/customer/service/insert.do" id="sermyForm"
					class="bg-light p-4 p-md-5 contact-form">
					<div class="form-group">
						<!-- 로그인 상태면 아이디 출력, 아니면 '로그인 상태가 아닙니다.' -->
						<p class="mb-3">사용자 아이디()</p>
					</div>
					<div class="form-group">
						<p class="mb-3">사용자 이메일()</p>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Subject"
							name="title" id="sertitle">
						<div class="invalid-feedback">제목을 입력해주세요.</div>
					</div>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"
							placeholder="Message" name="content" id="sercontent"></textarea>
						<div class="invalid-feedback">내용을 입력해주세요.</div>
						
					</div>
					<div class="form-group">
						<!-- 로그인 상태일 때만 보이게 하기 -->
						<input type="submit" value="Send Message"
							class="btn btn-primary py-3 px-5"> <img
							src="/resources/images/OIP.jpg" style="margin-left: 10px"
							alt="lockQnAimg"> <input type="checkbox"
							style="margin-left: 5px" name="secrete">
					</div>
				</form>
			</div>
			<!--Q&A form-->
			
			<!----Service 서비스 정보---->
			<div class="col-md-5 d-flex">
				<div class="row d-flex contact-info mb-5">
					<div class="col-md-12 ftco-animate">
						<div class="box p-2 px-3 bg-light d-flex">
							<div class="icon mr-3">
								<span class="icon-map-signs"></span>
							</div>					
							<div>
								<!--주소 -->
								<h3 class="mb-3">Address</h3>
								<p>198 West 21th Street, Suite 721 New York NY 10016</p>
							</div>
						</div>					
					</div>					
					<div class="col-md-12 ftco-animate">
						<div class="box p-2 px-3 bg-light d-flex">
							<div class="icon mr-3">
								<span class="icon-phone2"></span>
							</div>
							<div>
								<!--전화번호-->
								<h3 class="mb-3">Contact Number</h3>
								<p><a href="tel://1234567920">+ 1235 2355 98</a></p>
							</div>
						</div>
					</div>					
					<div class="col-md-12 ftco-animate">
						<div class="box p-2 px-3 bg-light d-flex">
							<div class="icon mr-3">
								<span class="icon-paper-plane"></span>
							</div>
							<div>
								<!-- 이메일 -->
								<h3 class="mb-3">Email Address</h3>
								<p><a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
							</div>
						</div>
					</div>					
					<div class="col-md-12 ftco-animate">
						<div class="box p-2 px-3 bg-light d-flex">
							<div class="icon mr-3">
								<span class="icon-globe"></span>
							</div>
							<div>
								<!-- 사이트주소 -->
								<h3 class="mb-3">Website</h3>
								<p><a href="#">yoursite.com</a></p>
							</div>
						</div>
					</div>
				</div><!-- row -->
			</div><!----Service 서비스 정보---->      
		</div><!-- row -->
	</div><!--container -->
</section><!-- Service 섹션-->
		
<!------------ footer ------------->    
<jsp:include page="include/footer.jsp"></jsp:include>
    
<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
	</svg>
</div>
<!-------------script 스크립트------------->
<jsp:include page="include/resource_script.jsp"></jsp:include>
<script>
$(document).ready(function() {
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition;
		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
	
	
		//아이디 유효성 여부를 관리할 변수 만들고 초기값 부여하기
		//let isIdValid=false;
		//비밀번호 유효성 여부를 관리할 변수 만들고 초기값 부여하기
		//let isPwdValid=false;
		//이메일 유효성 여부를 관리할 변수 만들고 초기값 부여하기
		let isTitleValid=false;
		let isContentValid=false;
		//폼 전체의 유효성 여부를 관리할 변수 만들고 초기값 부여하기
		let isFormValid=false;
		
		//폼에 submit 이벤트가 일어 났을때 jquery 를 활용해서 폼에 입력한 내용 검증하기
		// id 가 myForm 인 요소에 submit 이벤트가 일어 났을때 실행할 함수 등록 
		$("#sermyForm").on("submit", function(){
			//폼 전체의 유효성 여부를 얻어낸다.
			isFormValid = isContentValid && isTitleValid;
			//만일 폼이 유효하지 않는다면
			console.log(isFormValid);
			if(!isFormValid){
				if(!isContentValid){
					$("#sercontent").addClass("is-invalid");
				}
				if(!isTitleValid){
					$("#sertitle").addClass("is-invalid");
				}
				return false; ///폼 전송 막기 
			}
		});
		
		//이메일을 입력했을때 실행할 함수 등록
		$("#sertitle").on("input", function(){
			let inputTitle=$("#sertitle").val();
			//만일 이메일이 정규표현식에 매칭되지 않는다면		
			if(!inputTitle){
				isTitleValid=false;
			}else{
				isTitleValid=true;
				$("#sertitle").addClass("is-valid");
			}
			console.log(isTitleValid);
		});
		$("#sercontent").on("input", function(){
			let inputContent=$("#sercontent").val();
			//만일 이메일이 정규표현식에 매칭되지 않는다면		
			if(!inputContent){
				isContentValid=false;
			}else{
				isContentValid=true;
				$("#sercontent").addClass("is-valid");
			}
			console.log(isContentValid);
		});
});
</script>
<!-------------script 스크립트 ------------->
<jsp:include page="include/resource_script.jsp"></jsp:include>
</body>
</html>