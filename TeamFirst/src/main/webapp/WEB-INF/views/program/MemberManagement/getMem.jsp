<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>

<title>수강회원 상세보기</title>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
		$("#summernote").summernote('code',  '${us.content}');
		$('#summernote').next().find(".note-editable").attr("contenteditable", false);
});
</script>
<script>
	function del(board_no) {
		var check = confirm("정말 삭제하시겠습니까?");
		if (check) {
			location.href='MemDelete?board_no='+course_reg_no;
		}
	}	
</script>
</head>
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

textarea {
	width: 100%;
}

#outter {
	display: block;
	width: 30%;
	margin: auto;
}
</style>
<body>
<body>
	<div style="width: 60%; margin: auto;">
	<h2 style="text-align: center;">수강회원 상세보기 페이지</h2>
	<br>
	<br>
		<form method="post" action="getUserh">
			카테고리 : <input readonly="readonly" type="text" name="category"
				value="${cosmem.category}"><br> 게시물번호 : <input
				readonly="readonly" type="text" name="board_no"
				value="${cosmem.board_no}"><br> 제목 : <input
				readonly="readonly" type="text" name="title" style="width: 30%;"
				placeholder="제목" value="${cosmem.title}" />

			<textarea readonly="readonly" id="summernote" name="content"></textarea>

			<input id="subBtn" type="button" value="수정하기" style="float: right;"
				onclick="location.href='userUpdate?board_no=${cosmem.board_no}';" />
			<!--"goModify(this.form)"  -->
			<input type="button" value="삭제" style="float: right;"
				onclick="del(${cosmem.board_no})"> <input type="button"
				value="목록으로" style="float: right;"
				onclick="location.href='manageList';">
		</form>
	</div>
</body>
</html>