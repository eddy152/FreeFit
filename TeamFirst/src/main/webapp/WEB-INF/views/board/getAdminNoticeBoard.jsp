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
		$("#summernote").summernote('code',  '${board.content}');
		$('#summernote').next().find(".note-editable").attr("contenteditable", false);
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

<!-- <script>
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
	}
	frm.submit();
}
</script> -->

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
<h2 style="text-align: center;">상세보기 페이지</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="updateAdminNoticeBoard" >
		카테고리 : <input readonly="readonly" type="text" name="category" value="${board.category}"><br>
		게시물번호 : <input readonly="readonly" type="text" name="board_no" value="${board.board_no}"><br>
		제목 : <input readonly="readonly" type="text" name="title" style="width: 30%;" placeholder="제목" value="${board.title}"/>
	
		<textarea readonly="readonly" id="summernote" name="content"></textarea>
		<input id="subBtn" type="button" value="수정하기" style="float: right;" 
			   onclick="location.href='updateAdminNoticeBoard?board_no=${board.board_no}';"/><!--"goModify(this.form)"  -->
		<input type="button" value="삭제" style="float: right;" onclick="del(${board.board_no})">
		<input type="button" value="목록으로" style="float: right;"
			   onclick="location.href='getAdminNoticeBoardList';">
	</form>
</div>
</body>
</html>