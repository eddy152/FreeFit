<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>수정페이지</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	  // Summernote에 글 내용 추가하는 코드
	  $("#summernote").summernote('code',  '${board.content}');
	});
</script>
</head>
<body>
<h2 style="text-align: center;">글 수정</h2><br><br><br>
<div style="width: 60%; margin: auto;">
	<form method="post" action="updateAdminNoticeBoard" >
		<input type="hidden" name="board_no" value="${board.board_no}">
		<input type="text" name="title" style="width: 40%;" placeholder="제목" value="${board.title}"/>
		<br><br> 
		<textarea id="summernote" name="content"></textarea>
		<input id="subBtn" type="button" value="글수정" style="float: right;" onclick="goModify(this.form)"/>
	</form>
</div>
<script>
function goModify(frm) {
	var title = frm.title.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	
		//if (category.trim() ==''){
		//alert("카테고리를 입력해주세요");
		//return false;
	 //}
	}
	frm.submit();
}
</script>
</body>
</html>