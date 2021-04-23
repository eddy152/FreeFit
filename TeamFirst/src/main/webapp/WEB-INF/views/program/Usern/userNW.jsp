<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<style>
.right {

  display: inline-block;
  text-align: center;
  width: 100%;
  vertical-align: top;
  border: 0 10px;
  margin: 0 10px;
  padding: 0 10px;
  list-style: none;
}

table {
	width: 70%;
}


td {
	padding: 15px;
	text-align: center;
}

th {
	padding: 15px;
	text-align: center;
}

#t01 tr:nth-child(even) {
	background-color: #eee;
}

#t01 tr:nth-child(odd) {
	background-color: #fff;
}

#t01 th {
	background-color: black;
	color: white;
}

</style>


<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
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
	
	<br>
	<br>
	<br>
	<div style="width: 90%; margin: auto;">
		<form method="post" action="userWrite">
		<div align="center">
	<h2 style="text-align: center;">글쓰기</h2>
	</div>
			<input type="text" name="title" style="width: 30%;" placeholder="제목" class="form-control" /><br> <br> 
			<select id="category" name="category" class="form-control">
				<option value="공지" >공지</option>
				<option value="홍보">홍보</option>
				<option value="이벤트">이벤트</option>
			</select> <br>
			<textarea id="summernote" name="content"></textarea>

			<input id="subBtn" type="button" value="글작성" style="float: right;"
				onclick="goWrite(this.form)">
			<!-- 목록으로 -->
			<input type="button" value="목록으로" style="float: right;"
				onclick="location.href='userNList';">
		</form>
	</div>
</body>
</html>

