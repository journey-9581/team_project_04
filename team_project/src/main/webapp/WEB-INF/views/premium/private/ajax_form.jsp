<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
<!-------------타이틀 (페이지 제목)------------->
<title>POST</title>
<!------------- css 영역------------->  
<jsp:include page="../../include/resource.jsp"></jsp:include>

<style>   
/*한글 폰트 적용 (사용법 id="font_1")*/
   #font_1{
      font-family: 'Noto Sans KR', sans-serif;
   }
   .img-wrapper{
      height: 800px;
   }
</style>
</head>
<body>
<!-------------navbar 네비바------------->
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<section class="ftco-section" id="contents-section">
	<div class="container">
    	<div class="comment-form-wrap pt-5">
        	<!---- 제목 부분 ---->
        	<div class="row justify-content-center pb-5">
		       	<div class="col-md-12 heading-section text-center ftco-animate">
		           	<!--소제목-->
		               <span class="subheading"><a href="${pageContext.request.contextPath }/premium/list.do">Premium</a></span>
		               <!--제목-->
		               <h2 class="mb-4">Premium</h2>         
		       	</div>
    		</div>      
    	</div>
	    <!-- 글제목, 글내용, 폼 -->
		<form action="insert.do" method="post" id="insertForm">
		<input type="hidden" name="imagePath" id="imagePath"/>
	        <div class="form-group">
	            <label for="caption">Caption</label>
	        	<input class="form-control" type="text" name="caption" id="caption"/>
	        </div>
			<label for="content">Content</label>
	    	<textarea class="form-control" name="content" id="content"></textarea>
	    </form>      
	    <button class="btn py-3 px-4 btn-primary" onclick="submitContents(this);" id="submitBtn">Post</button>
		<div class="img-wrapper">
			<br/>
			   <!-- 섬네일 이미지 업로드 폼 -->
			<div>            
				<form style="width:25%;" action="ajax_upload.do" method="post" id="ajaxForm" enctype="multipart/form-data">
				<div class="form-group">
			       	<label for="image">Thumnail Image</label>
			       	<input class="form-control" type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
				</div>
				</form>
			</div>
			<div>
				<img style="width:auto; height:250px;"/>
			</div>
		</div>
    </div><!-- container -->
</section>
<!-- jquery form 플러그인 javascript 로딩 -->
<!-------------script 스크립트------------->
<jsp:include page="../../include/resource_script.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
	//폼 전송 버튼을 눌렀을때 호출되는 함수 
	//<button type="submit" onclick="submitContents(this);"></button>	
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}

   //form 플러그인을 이용해서 form 이 ajax 전송(페이지 전환없이) 되도록 한다.
   $("#ajaxForm").ajaxForm(function(data){
      // data 는 {imagePath:"업로드된 이미지경로"} 형태의 object 이다.
      console.log(data);
      //로딩할 이미지의 경로 구성
      let src="${pageContext.request.contextPath}"+data.imagePath;
      // img 요소의 src 속성으로 지정을 해서 이미지를 표시한다.
      $(".img-wrapper img").attr("src", src);
      // 업로드 경로를 insertForm 에 input type="hidden" 에 value 로 넣어준다.
      $("#imagePath").val(data.imagePath);
   });
   
   //이미지를 선택하면 강제로 폼 전송 시키기
   $("#image").on("change", function(){
      // id 가 ajaxForm  인 form 을 강제 submit 시키기
      $("#ajaxForm").submit();
   });
   
   //버튼을 누르면 insertForm 강제 제출해서 이미지 정보가 저장되도록 한다.
   $("#submitBtn").on("click", function(){
      $("#insertForm").submit();
   });
   
</script>
</body>
</html>