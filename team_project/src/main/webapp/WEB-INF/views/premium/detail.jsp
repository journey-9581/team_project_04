<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
<!-------------타이틀 (페이지 제목)------------->
<title>Premium Post</title>
<!------------- css 영역------------->  
<jsp:include page="../include/resource.jsp"></jsp:include>

<style>   
   /*한글 폰트 적용 (사용법 id="font_1")*/
   #font_1{
      font-family: 'Noto Sans KR', sans-serif;
   }
   /*이미지 사이즈*/
   .img-fluid{
      Weight: 800px;         
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
<body>
<!-------------navbar 네비바------------->
<jsp:include page="../include/navbar2.jsp"></jsp:include>

<!-- floting bar -->
<div class="bg-primary" id="floatMenu" style="color: white; border-radius: 1em;">
   </br>
   <a href="${pageContext.request.contextPath }/premium/list.do">
      <p>Special</p>
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

<section class="ftco-section" id="contents-section">
   <div class="container">
      <div class="comment-form-wrap pt-5">
         <!---- 제목 부분 ---->
         <div class="row justify-content-center pb-5">
            <div class="col-md-12 heading-section text-center ftco-animate">
               <!--카테고리-->
               <span class="subheading"><a href="${pageContext.request.contextPath }/premium/list.do">Special Pick</a></span>
               <!--내용-->
               <h2 class="mb-4">${dto.caption }</h2>   
               <!-- 이미지 삭제 버튼 -->      
               <!-- 아이디가 같으면 삭제 -->
               <c:if test="${dto.writer eq id || manage eq 'yes'}">
                  <a id="font_1" href="private/updateform.do?num=${dto.num}" class="btn btn-primary px-5 py-8 mt-1"> Update Post</a>
                  <a id="font_1" href="javascript:deleteConfirm()" class="btn btn-primary px-5 py-8 mt-1"> Delete Post</a>
               </c:if>
            </div>
         </div>
         <!--detail에 섬네일 이미지 출력 
         <p style="text-align: center">
            <img src="${pageContext.request.contextPath }${dto.imagePath}" class="img-fluid" alt="No Image" style="text-align: center">
         </p>-->
         
         <!-- 컨텐츠 내용 -->
         <p>${dto.content } </p>
         <div id="map_ma"></div>                  
         <div class="text py-5" style="text-align: center">
            <!-- 작성자 -->
            <h3><a href="#">${dto.writer }</a></h3>
            <!-- 날짜 -->
            <p class="pos">${dto.regdate}</p>               
            <!-- 이전글 다음글 이동 -->
            <c:choose>
               <c:when test="${dto.prevNum ne 0 }">
                  <a href="detail.do?num=${dto.prevNum }" class="btn btn-secondary">Prev</a>
               </c:when>
               <c:otherwise>
                  <a href="javascript:" class="btn btn-secondary">Prev</a>
               </c:otherwise>
            </c:choose>
            <c:choose>
               <c:when test="${dto.nextNum ne 0 }">
                  <a href="detail.do?num=${dto.nextNum }" class="btn btn-primary">Next</a>
               </c:when>
               <c:otherwise>
                  <a href="javascript:" class="btn btn-primary">Next</a>
               </c:otherwise>
            </c:choose>                               
         </div>         
      </div>
   </div><!-- container -->
</section>
<!------------- footer ------------->    
<jsp:include page="../include/footer.jsp"></jsp:include>   
  
<!-------------script 스크립트------------->
<jsp:include page="../include/resource_script.jsp"></jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCFdmAEtL9f93C6VneG-ZbAY6PRhjtU45k" ></script>

<script>
//글 삭제 
function deleteConfirm(){
   var isDelete=confirm("이 글을 삭제 하시겠습니까?");
   if(isDelete){
      location.href="${pageContext.request.contextPath }/premium/private/delete.do?num=${dto.num}";
   }
}

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
<!-- 게시글 내부 html 편집에 구글맵 삽입 

<div id="map_ma" style="width:100%; height:400px; clear:both;"></div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCFdmAEtL9f93C6VneG-ZbAY6PRhjtU45k"></script>
<script>
$(document).ready(function() { 
   var myLatlng = new google.maps.LatLng(36.742516,126.298982); // 위치값 위도 경도 
   var Y_point = 36.742516; // Y 좌표 
   var X_point = 126.298982; // X 좌표 
   var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼 
   var markerTitle = "파파홈"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보 
   var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기 
   // 말풍선 내용 
   var contentString = '<div>' + 
   '<h2>파파홈</h2>'+ 
   '</div>'; 
   var myLatlng = new google.maps.LatLng(Y_point, X_point); 
   var mapOptions = { 
         zoom: zoomLevel, 
         center: myLatlng, 
         mapTypeId: google.maps.MapTypeId.ROADMAP
         } 
   var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions); 
   var marker = new google.maps.Marker({ 
      position: myLatlng, 
      map: map, 
      title: markerTitle
      }); 
   var infowindow = new google.maps.InfoWindow({ 
      content: contentString, 
      maxWizzzdth: markerMaxWidth
      });
   google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map, marker);
      }); 
   });
</script>

-->
</body>
</html>