<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
<!-------------타이틀 (페이지 제목)------------->
<title>Image upload</title>
<!------------- css 영역------------->  
<jsp:include page="../../include/resource.jsp"></jsp:include>

<style>	
/*한글 폰트 적용 (사용법 id="font_1")*/
	#font_1{
		font-family: 'Noto Sans KR', sans-serif;
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
					<span class="subheading">Gallery</span>
					<!--제목-->
					<h2 class="mb-4">Image Upload</h2>			
				</div>
			</div>
			<!-- 이미지 업로드 (image upload) 폼 -->
			<form action="upload.do" class="p-5 bg-light" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label id="font_1" for="caption">설명*</label>
					<input class="form-control" type="text" id="caption"/>
				</div>
				<div class="form-group">
					<label id="font_1" for="image">이미지*</label>
					<input class="form-control" type="file" id="image"
						accept=".jpg, .jpeg, .png, .JPEG"/>
				</div>
				<div class="form-group">
					<input class="btn py-3 px-4 btn-primary" type="submit" value="Upload">
				</div>
			</form>
		</div>
	</div>
</section>
<!------------- footer ------------->    
<jsp:include page="../../include/footer.jsp"></jsp:include>   
  
<!-------------script 스크립트------------->
<jsp:include page="../../include/resource_script.jsp"></jsp:include>
</body>
</html>