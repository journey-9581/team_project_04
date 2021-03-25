<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIBUS</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<jsp:include page="../include/resource_script.jsp"></jsp:include>
<style>
   #myDivTitle1 {
      font-family: 'Noto Sans KR', sans-serif;
   }
   #myDivTitle2 {
      font-family: 'Noto Sans KR', sans-serif;
   }
   #myDivContent1 {
      font-family: 'Noto Sans KR', sans-serif;
   }
   #myDivContent2 {
      font-family: 'Noto Sans KR', sans-serif;
   }
   #myDivBtn1 {
      font-family: 'Noto Sans KR', sans-serif;
   }
   #myDivBtn2 {
      font-family: 'Noto Sans KR', sans-serif;
   }
</style>
</head>
<body>
<jsp:include page="../include/navbar2.jsp"></jsp:include>
   <br>
   <br>
   <br>
   <section class="ftco-section" id="contents-section">
      <div class="card w-50 offset-md-3" id="myDiv1">
        <div class="card-body">
          <h5 class="card-title" id="myDivTitle1">무료 회원 가입</h5>
          <p class="card-text" id="myDivContent1">다양한 게시판 및 갤러리를 이용 할 수 있습니다.</p>
          <a href="${pageContext.request.contextPath }/user/signupform_nonpay.do" class="btn btn-primary" id="myDivBtn1">회원가입 하기</a>
        </div>
      </div>
      <br>
      <br>
      <div class="card w-50 offset-md-3" id="myDiv2">
        <div class="card-body">
          <h5 class="card-title" id="myDivTitle2">유료 회원 가입</h5>
            <p class="card-text" id="myDivContent2">게시판과 갤러리 이용과 더불어, 홍보 게시판에 사업장 홍보 및 추천 글을 작성 할 수 있습니다.</p>
            <a href="${pageContext.request.contextPath }/user/signupform_pay.do" class="btn btn-primary" id="myDivBtn2">회원가입 하기</a>
        </div>
      </div>
   </section>
</body>
</html>