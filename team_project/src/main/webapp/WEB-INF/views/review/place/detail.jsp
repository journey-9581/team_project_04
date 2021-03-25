<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
<!-------------타이틀 (페이지 제목)------------->
<title>Detail</title>
<!------------- css 영역------------->  
<jsp:include page="../../include/resource.jsp"></jsp:include>

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
<section class="ftco-section" id="contents-section">
   <div class="container">
      <div class="comment-form-wrap pt-5">
         <!---- 제목 부분 ---->
         <div class="row justify-content-center pb-5">
            <div class="col-md-12 heading-section text-center ftco-animate">
               <!--카테고리-->
               <span class="subheading"><a href="${pageContext.request.contextPath }/review/list.do">Review&Recommand</a></span>
               <!--내용-->
               <h2 class="mb-4"><a href="${pageContext.request.contextPath }/review/place/list.do">Place</a></h2>   
               <!--수정,삭제 버튼  -->
               <!-- 아이디가 같으면 수정or삭제 -->
               <c:if test="${dto.writer eq id || manage eq 'yes'}">
                  <a id="font_1" href="private/updateform.do?num=${dto.num}" class="btn btn-primary px-5 py-8 mt-1"> Update Post</a>   
                  <a id="font_1" href="javascript:deleteConfirm()" class="btn btn px-5 py-8 mt-1"> Delete Post</a>                     
               </c:if>
            </div>
         </div>   
         
         <!-- 이전글 다음글 이동 -->      
         <div class="text py-5" style="text-align: center">            
            
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
         
         <!-- Post 메인 -->      
         <div id="font_1" class="row">         
            <div class="col-lg-12 ftco-animate">
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
                  <p>${dto.content } </p>
            </div>    
      </div><!-- row -->         
      </div>
   </div><!-- container -->
</section>
<!------------- footer ------------->    
<jsp:include page="../../include/footer.jsp"></jsp:include>   
  
<!-------------script 스크립트------------->
<jsp:include page="../../include/resource_script.jsp"></jsp:include>
<script>
//글 삭제 
function deleteConfirm(){
   var isDelete=confirm("이 글을 삭제 하시겠습니까?");
   if(isDelete){
      location.href="${pageContext.request.contextPath }/review/place/private/delete.do?num=${dto.num}";
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
</body>
</html>