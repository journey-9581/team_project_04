<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FreeBoard Detail</title>
<!------------- css 영역------------->  
<jsp:include page="../include/resource.jsp"></jsp:include>
<!-- css  -->

<style>	
	/*한글 폰트 적용 (사용법 id="font_1")*/
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
	}
	/*보이는 이미지 사이즈  가운데 정렬*/
	.img{
		height: 250px;
		text-align: center;
	}			
</style>
</head>
<!-------------body 바디 영역 ------------->
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


<!-------------navbar 네비바------------->
<jsp:include page="../include/navbar.jsp"></jsp:include>

<!-------------contents1 컨텐츠 유료 ------------->
<section class="ftco-section" id="contents-section">
  	<div class="container">
		<!---- 제목 부분 ---->
		<div class="row justify-content-center pb-5">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<!--대분류-->
				<span class="subheading">contents</span>
				<!--소분류 영어-->
				<h2 class="mb-4">FreeBoard</h2>
				<!--소분류 한글 -->
				<p id="font_1">자유게시판</p>
				<!--수정,삭제 버튼  -->
				<a id="font_1" href="${pageContext.request.contextPath }/" class="btn btn-primary px-5 py-8 mt-1"> Update Post</a>	
				<a id="font_1" href="${pageContext.request.contextPath }/" class="btn btn px-5 py-8 mt-1"> Delete Post</a>							
			</div>
		</div>	
				
		<!-- Post 메인 -->		
		<div id="font_1" class="row">
			<div class="col-lg-8 ftco-animate">
			<!-- 글 제목 -->
			<h2 id="font_1" class="mb-3" style="text-align: center;">${dto.title }</h2>			            
				<div class="about-author d-flex p-6 bg-light">
					<table id="font_1" class="board_list">
						<thead>
							<tr>
								<th style="font-weight:bold; color: black;">${dto.category}</th>
								<th>ID: ${dto.writer }</th>
								<th>${dto.regdate }</th>
								<th>VEIW: ${dto.viewCount }</th>
							</tr>
						</thead>					
					</table>			
				</div>
	            <!-- 컨텐츠 내용 -->
	            <p>
	              ${dto.content } 
	            </p>
			</div> 
	
			<!-- 사이드 컨텐츠 메뉴바 Side bar Contents Categories  -->
			<div class="col-lg-4 sidebar ftco-animate">
				<div class="sidebar-box ftco-animate">
					<h3 class="heading-sidebar">Contents Categories</h3>
					<ul class="categories">
						<li><a href="#">Review</a></li>
						<li><a href="#">With Us</a></li>
						<li><a href="${pageContext.request.contextPath }/freeboard/list.do">FreeBoard</a></li>
						<li><a href="${pageContext.request.contextPath }/gallery/list.do">Gallery</a></li>
					</ul>
				</div>
			</div>
		</div><!-- row -->		
	</div><!--container -->	  	
</section><!-- contents1 섹션-->
    			
<!------------- footer ------------->    
<jsp:include page="../include/footer.jsp"></jsp:include>


<!-------------script 스크립트------------->
<jsp:include page="../include/resource_script.jsp"></jsp:include> 

</body>
</html>