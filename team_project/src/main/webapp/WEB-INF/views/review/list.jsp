<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Review&Recommand</title>
<!------------- css 영역------------->  
<jsp:include page="../include/resource.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<!-- css  -->

<style>	
	/*한글 폰트 적용 (사용법 id="font_1")*/
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
	}
	/* floating bar */
	#floatMenu {
		position: absolute;
		width: 100px;
		height: auto;
		left: 90%;
		top: 300px;
		z-index: 5;
		text-align: center;
	}	

</style>	
</head>
<!-------------body 바디 영역 ------------->
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


<!-------------navbar 네비바------------->
<jsp:include page="../include/navbar2.jsp"></jsp:include>
<!-- floting bar -->
<div class="bg-primary" id="floatMenu" style="color: white; border-radius: 1em;">
	</br>
	<a href="${pageContext.request.contextPath }/premium/list.do">
		<p>Premium</p>
	</a>	
	<a href="${pageContext.request.contextPath }/freeboard/list.do">
		<p>Free Board</p>
	</a>
	<a href="${pageContext.request.contextPath }/gallery/list.do">
		<p>Gallery</p>
	</a>
	<a href="${pageContext.request.contextPath }/withboard/list.do">
		<p>With me</p>
	</a>
	<a href="${pageContext.request.contextPath }/review/list.do">
		<p>Review</p>
	</a>
	<a href="${pageContext.request.contextPath }/customer/service/list.do">
		<p>QnA</p>
	</a>	
</div>
<!-------------contents1 컨텐츠 유료 ------------->
<section class="ftco-section" id="contents-section">
  	<div class="container">
		<!---- 제목 부분 ---->
		<div class="row justify-content-center pb-5">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<!--대분류-->
				<span class="subheading">contents</span>
				<!--소분류 영어-->
				<h2 class="mb-4"><a href="${pageContext.request.contextPath }/review/list.do">Review&Recommand</a></h2>
				<!--소분류 한글 -->
				<p id="font_1">리뷰&추천</p>				
			</div>
		</div>	
		<div class="row d-flex">
		<!---- POST1 ---->
			<div class="col-md-4 col-lg-4 ftco-animate">
				<div class="blog-entry">
					<a href="${pageContext.request.contextPath }/review/place/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/pink.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">PLACE</span>
								<p id="font_1" style="color: white">관광명소</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!--  POST1 -->
			<!---- POST2 ---->
			<div class="col-md-4 col-lg-4 ftco-animate">
				<div class="blog-entry">
					<a href="${pageContext.request.contextPath }/review/food/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/food3.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">FOOD</span>
								<p id="font_1" style="color: white">맛집여행</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!--  POST2 -->
			<!---- POST3 ---->
			<div class="col-md-4 col-lg-4 ftco-animate">
				<div class="blog-entry">
					<a href="${pageContext.request.contextPath }/review/secret/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/ff.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">SECRET</span>
								<p id="font_1" style="color: white">숨은여행지</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!--  POST3 -->
		<!---- POST4 ---->
			<div class="col-md-6 col-lg-6 ftco-animate">
				<div class="blog-entry">
					<a href="${pageContext.request.contextPath }/review/month/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/flower.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">MONTH</span>
								<p id="font_1" style="color: white">한달살기</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!--  POST4 -->
		<!---- POST5 ---->
			<div class="col-md-6 col-lg-6 ftco-animate">
				<div class="blog-entry">
					<a href="${pageContext.request.contextPath }/review/lantour/list.do" class="block-20" 
						style="background-image: url('${pageContext.request.contextPath }/resources/images7/sea.jpg');">
					</a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<!--제목 -->
								<span class="day">LAN TOUR</span>
								<p id="font_1" style="color: white">랜선여행</p>
							</div>
						</div>						
					</div>
				</div>
			</div><!-- 세번째 POST5 -->
	</div>
	</div><!--container -->	  	
</section><!-- contents1 섹션-->
 			
<!------------- footer ------------->    
<jsp:include page="../include/footer.jsp"></jsp:include>


<!-------------script 스크립트------------->
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<jsp:include page="../include/resource_script.jsp"></jsp:include>
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

});
</script>
</body>
</html>