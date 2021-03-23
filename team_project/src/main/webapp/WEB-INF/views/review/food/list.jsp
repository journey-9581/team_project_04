<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Food</title>
<!------------- css 영역------------->  
<jsp:include page="../../include/resource.jsp"></jsp:include>
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
<jsp:include page="../../include/navbar2.jsp"></jsp:include>
<!-- floting bar -->
<div class="bg-primary" id="floatMenu" style="color: white; border-radius: 1em;">
	</br>
	<a href="${pageContext.request.contextPath }/review/place/list.do">
		<p>Place</p>
	</a>	
	<a href="${pageContext.request.contextPath }/review/food/list.do">
		<p>Food</p>
	</a>
	<a href="${pageContext.request.contextPath }/review/secret/list.do">
		<p>Secret</p>
	</a>
	<a href="${pageContext.request.contextPath }/review/month/list.do">
		<p>Month</p>
	</a>
	<a href="${pageContext.request.contextPath }/review/lantour/list.do">
		<p>Lan tour</p>
	</a>	
</div>
<!-------------contents1 컨텐츠 유료 ------------->
<section class="ftco-section" id="contents-section">
  	<div class="container">
		<!---- 제목 부분 ---->
		<div class="row justify-content-center pb-5">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<!--대분류-->
				<span class="subheading"><a href="${pageContext.request.contextPath }/review/list.do">Review&Recommand</a></span>
				<!--소분류 영어-->
				<h2 class="mb-4"><a href="${pageContext.request.contextPath }/review/food/list.do">Food</a></h2>
				<!--소분류 한글 -->
				<p id="font_1">맛집여행</p>
				<!-- 버튼 -->				
				<a id="font_1" href="${pageContext.request.contextPath }/review/food/private/insertform.do" class="btn btn-primary px-5 py-8 mt-1"> New Post</a>				
			</div>
		</div>	
				
		<div class="board_list_wrap">			
				<!-- category 카테고리 -->	
				<h3 class="heading-sidebar">Select Category</h3>
				<div id="font_1" class="tagcloud">
					<a href="list.do" class="tag-cloud-link">전체</a>
					<a href="list.do?category=서울" class="tag-cloud-link">서울</a>
					<a href="list.do?category=경기" class="tag-cloud-link">경기</a>
					<a href="list.do?category=강원" class="tag-cloud-link">강원</a>
					<a href="list.do?category=충청" class="tag-cloud-link">충청</a>
					<a href="list.do?category=전라" class="tag-cloud-link">전라</a>
					<a href="list.do?category=경상" class="tag-cloud-link">경상</a>
					<a href="list.do?category=제주" class="tag-cloud-link">제주</a>
				</div>
			<br/>
			<!-- 반복문 돌면서 사진 목록 출력 -->
			<div class="row">
			<c:forEach var="tmp" items="${list }">
				<!---- POST ---->
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<!-- 이미지1 -->
						<div class="img">
							<a href="detail.do?num=${tmp.num }">
								<img src="${pageContext.request.contextPath }${tmp.imagePath}" 
									class="img-fluid" alt="No Image">
							</a>
						</div>
						<!-- 텍스트 -->
						<div class="text">
							<!-- 카테고리 -->
							<h4 id="font_1" class="price">${tmp.category}</h4>
							<!-- 날짜 -->
							<span>${tmp.regdate }</span>
							<!-- 타이틀 -->
							<h3 id="font_1"><a href="detail.do?num=${tmp.num }">${tmp.title }</a></h3>
							<!-- 작성자 -->
							<span style="color: purple">${tmp.writer }</span>
							<!-- 조회수 -->
							<div class="float-right">
								<span style="color: #e2c0bb" class="rate">(${tmp.viewCount})</span>								
							</div>
							
	
						</div>
						<!-- 이미지1-1 -->
						<a href="${pageContext.request.contextPath }${tmp.imagePath}" 
							class="icon image-popup d-flex justify-content-center align-items-center">
							<!--이미지 오른쪽 상단 확대 아이콘2-->
							<span class="icon-expand"></span>
						</a>
					</div><!--project -->
				</div><!--POST -->
			</c:forEach>			
			</div><!--row -->
		</div><!-- board_list_wrap -->
		<!-- 페이징 처리 -->
			<div class="row mt-5">	
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<c:choose>
								<c:when test="${startPageNum ne 1 }">
									<li>
										<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }&category=${category}">&lt;</a>
									</li>
								</c:when>
							<c:otherwise>
								<li>
									<a href="javascript:">&lt;</a>
								</li>
							</c:otherwise>
							</c:choose>
							
							<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
								<c:choose>
									<c:when test="${i eq pageNum }">
										<li class="active">
											<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }&category=${category}">${i }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }&category=${category}">${i }</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${endPageNum lt totalPageCount }">						
									<li>
										<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }&category=${category}">&gt;</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="javascript:">&gt;</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div><!-- 페이징처리 -->
			<br>
			<!--검색 Search -->
			<div class="form-group">
				<form action="list.do" method="get" class="search-form">				
					<select id="font_1" name="condition" id="condition">
						<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
						<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
						<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>			
					<input id="font_1" class="form-control" type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
					<button class="btn btn-primary px-5 py-8 mt-1" type="submit">Search</button>		
				</form>
			</div>
			<%-- 만일 검색 키워드가 존재한다면 몇개의 글이 검색 되었는지 알려준다. --%>
			<c:if test="${not empty keyword }">
				<div class="alert alert-success">
					<strong>${totalRow }</strong> 개의 자료가 검색되었습니다.
				</div>
			</c:if>
			
	</div><!--container -->	  	
</section><!-- contents1 섹션-->
    			
<!------------- footer ------------->    
<jsp:include page="../../include/footer.jsp"></jsp:include>


<!-------------script 스크립트------------->
<jsp:include page="../../include/resource_script.jsp"></jsp:include> 
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