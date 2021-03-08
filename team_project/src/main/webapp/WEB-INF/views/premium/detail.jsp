<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Premium Detail</title>
<!------------- css 영역------------->  
<jsp:include page="../include/resource.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
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
	/* 글 내용을 출력할 div 에 적용할 css */
	.contents{
		width: 100%;
		border: 1px solid #f2f2f2; 
	}
	/* 댓글 프로필 이미지를 작은 원형으로 만든다. */
	.profile-image{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	/* ul 요소의 기본 스타일 제거 */
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 50px;
	}
	.comment-form textarea, .comment-form button{
		float: left;
		
	}
	.comments li{
		clear: left;
	}
	.comments ul li{
		border-top: 1px solid #f2f2f2;
	}
	.comment-form textarea{
		width: 80%;
		height: 50px;
		border: 1px solid #cecece;
		
	}
	.comment-form button{
		width: 15%;
		height: 50px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
	.comments .comment-form{
		display: none;
	}
	/* .reply_icon 을 li 요소를 기준으로 배치 하기 */
	.comments li{
		position: relative;
	}
	.comments .reply-icon{
		position: absolute;
		top: 1em;
		left: 1em;
		color: red;
	}
	pre {
	  display: block;
	  padding: 9.5px;
	  margin: 0 0 10px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #333333;
	  word-break: break-all;
	  word-wrap: break-word;
	  background-color: #f5f5f5;
	  border: 1px solid #f2f2f2;
	  border-radius: 4px;
	}
	/* 글 내용중에 이미지가 있으면 최대 폭을 100%로 제한하기 */
	.contents img{
		max-width: 100%;
	}
	.loader{
		position: fixed; /* 좌하단 고정된 위치에 배치 하기 위해 */
		width: 100%;
		left: 0;
		bottom: 0;
		text-align: center; /* 이미지를 좌우로 가운데  정렬 */
		z-index: 1000;
		display: none; /* 일단 숨겨 놓기 */
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
				<h2 class="mb-4"><a href="${pageContext.request.contextPath }/premium/list.do">Premium</a></h2>
				<!--소분류 한글 -->
				<p id="font_1">자유게시판</p>
				<!--수정,삭제 버튼  -->
				<!-- 아이디가 같으면 수정or삭제 -->
				<c:if test="${dto.writer eq id }">
					<a id="font_1" href="private/updateform.do?num=${dto.num}" class="btn btn-primary px-5 py-8 mt-1"> Update Post</a>	
					<a id="font_1" href="javascript:deleteConfirm()" class="btn btn px-5 py-8 mt-1"> Delete Post</a>							
				</c:if>
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
				<!--detail 이미지 출력 -->
				<p style="text-align: center">
					<img src="${pageContext.request.contextPath }${dto.imagePath}" class="img-fluid" alt="Colorlib Free Template" style="text-align: center">
				</p>
	            <!-- 컨텐츠 내용 -->
	            <p>${dto.content } </p>
			</div> 	
		</div>		
	</div><!--container -->	  	
</section><!-- contents1 섹션-->
<div class="loader">
	<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif"/>
</div>   			
<!------------- footer ------------->    
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-------------script 스크립트------------->
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<jsp:include page="../include/resource_script.jsp"></jsp:include> 
</body>
</html>