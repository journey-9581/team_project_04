<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FreeBoard Notice</title>
<!------------- css 영역------------->  
<jsp:include page="../include/resource.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<!-- css  -->

<style>	
	/*한글 폰트 적용 (사용법 id="font_1")*/
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
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
				<h2 class="mb-4"><a href="${pageContext.request.contextPath }/freeboard/list.do">FreeBoard</a></h2>
				<!--소분류 한글 -->
				<p id="font_1">자유게시판</p>				
			</div>
		</div>	

		<!-- Post 메인 -->		
		<div id="font_1" class="row">			
			
			<div class="col-lg-12 ftco-animate">
			<!-- 글 제목 -->
			<h2 id="font_1" class="mb-3" style="text-align: center;">공지</h2>			            
				<div class="about-author d-flex p-6 bg-light">
					<table id="font_1" class="board_list">
						<thead>
							<tr>
								<th style="font-weight:bold; color: black;">공지</th>
								<th>관리자</th>									
							</tr>
						</thead>					
					</table>			
				</div>
	            <!-- 컨텐츠 내용 -->
	            <div style="text-align: center;">
	            	<p>자유게시판 양식</p>
	            </div>
			</div> 	
		</div><!-- row -->			
	</div><!--container -->	  	
</section><!-- contents1 섹션-->
 			
<!------------- footer ------------->    
<jsp:include page="../include/footer.jsp"></jsp:include>


<!-------------script 스크립트------------->
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<jsp:include page="../include/resource_script.jsp"></jsp:include>
</body>
</html>