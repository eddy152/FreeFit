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
<title>공지사항 작성</title>

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

		if (title.trim() == '') {
			alert("제목을 입력해주세요");
			return false;
		}
		if (content.trim() == '') {
			alert("내용을 입력해주세요");
			return false;
		}

		frm.submit();
	}
</script>
</head>
<body>
	<h2 style="text-align: center;">글 작성</h2>
	<br>
	<br>
	<br>
	<div style="width: 100%; margin: auto;">
		<form method="post" action="userNW">
			제목 : <input type="text" name="title" style="width: 100%;"
				placeholder="제목" /><br> <label for="category">카테고리 : </label>
			<select id="category" name="category">
				<option value="공지">공지</option>
				<option value="홍보">홍보</option>
				<option value="이벤트">이벤트</option>
			</select> <br>
			<textarea id="summernote" id="content" name="content"></textarea>

			<input id="subBtn" type="button" value="글작성" style="float: right;"
				onclick="goWrite(this.form)">
			<!-- 목록으로 -->
			<input type="button" value="목록으로" style="float: right;"
				onclick="location.href='userNList';">
		</form>
	</div>
</body>
</html>

