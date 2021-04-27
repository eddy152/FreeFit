<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>공지사항/이벤트 작성</title>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
	});
</script>
	
<script>
			function goWrite(frm) {
				var title = frm.title.value;
				var content = frm.content.value;
				//var category = frm.category.value;
				
				if (title.trim() == '') {
					alert("제목을 입력해주세요");
					return false;
				}
				if (content.trim() == '') {
					alert("내용을 입력해주세요");
					return false;
				}
				
				//if (category.trim() == '') {
				//	alert("카테고리를 선택해주세요");
				//	return false;
				//}
				frm.submit();
			}
			
</script>
<style>

	div#divTag1 {
    right: -390px;
    margin-right: ;
	}
	
	.button {
  	background-color: #01DFD7;
  	border: none;
  	color: white;
	padding: 10px 20px;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 13px;
  	margin: 3px 1px;
  	cursor: pointer;
	}
	
</style>
</head>
<body>
	<div id="divTag1" class="col-lg-7" style="color:white; background-color:#01DFD7; padding:20px;">
	<h2 style="text-align: center;">공지사항 작성</h2>
	</div>
	<div style="width: 60%; margin: auto;">
		<form method="post" action="insertAdminNoticeBoard">
		 	 <br>
		 	 제목 :  <input type="text" name="title" style="width: 40%;" placeholder="제목" /><br>
			<label for="category">카테고리 : </label>
			<select id="category" name="category">
				<option value="공지">공지</option>
				<option value="이벤트">이벤트</option>
			</select>
			<br>
			<textarea id="summernote" name="content"></textarea>
	
		<input class="btn btn-primary" type="button" value="글작성" style="float: right;"
			   onclick="goWrite(this.form)">
      	<input class="btn btn-primary" type="button" value="목록으로" style="float: right;"
			   onclick="location.href='getAdminNoticeBoardList';">
		</form>
	</div>
</body>
</html>

