<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>

<title>글 상세보기</title>

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
	function del(board_no) {
		var check = confirm("정말 삭제하시겠습니까?");
		if (check) {
			location.href='deleteAdminNoticeBoard?board_no='+board_no;
		}
	}	
</script>
</head>
<style>
h2 {text-align: center;}
table {width: 100%;}
textarea {width: 100%;}
#outter {display: block;
		 width: 30%;
		 margin: auto; }
</style>
	<body>
	<body>
<h2 style="text-align: center;">상세보기</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="updateAdminNoticeBoard" >
		<input type="text" name="board_no" value="${board.board_no}">
		<input type="text" name="title" style="width: 40%;" placeholder="제목" value="${board.title }"/>
		<br><br> 
		<textarea id="summernote" name="content"></textarea>
		<input id="subBtn" type="button" value="글 수정" style="float: right;" onclick="goModify(this.form)"/>
	</form>
</div>

</body>
</html>