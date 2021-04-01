<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
	$(function() {
		$(".menuLink").on("click", function() {
			var url = "getExerciseListProc?exe_part=" + $(this)[0].id;
			$("#tbl1").load(url);
		});
	});
</script>
<style type="text/css">
#topMenu {
	height: 30px;
	width: 850px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div style="height: 800px; width: 800px;">
			<div id="div1">
				<table id="tbl1" border="1" style="height: 150px; width: 800px;">
					<nav id="topMenu">
						<ul>
							<li><a class="menuLink" id="가슴">가슴</a></li>
							<li><a class="menuLink" id="등">등</a></li>
							<li><a class="menuLink" id="이두">이두</a></li>
							<li><a class="menuLink" id="삼두">삼두</a></li>
							<li><a class="menuLink" id="하체">하체</a></li>
						</ul>
					</nav>
				</table>
			</div>
			<div
				style="border: 1px solid yellow; float: left; width: 30%; padding: 10px;">
				<table border="1">
					<tr>
						<th>준비 운동</th>
					</tr>
					<tr>
						<td><input type="number" id="0" name="0" min="0" max="15">회
						</td>
					</tr>
				</table>
			</div>
			<div
				style="border: 1px solid red; float: left; width: 30%; padding: 10px;">
				<table border="1">
					<tr>
						<th></th>
					<tr>
				</table>
			</div>
			<div
				style="border: 1px solid blue; float: left; width: 30%; padding: 10px;">
				<table border="1">
					<tr>
						<th></th>
					<tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>