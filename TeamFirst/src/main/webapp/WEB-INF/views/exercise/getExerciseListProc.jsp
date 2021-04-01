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
		$("a").on("click", function() {
			$("#exeDiv").append('<button/>');
		});
	});
</script>
<style>
body {
	margin: 20px auto;
	padding: 0;
	font-family: "맑은 고딕";
	font-size: 0.9em;
}

ul#navi {
	text-indent: 10px;
}

ul#navi, ul#navi ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group {
	margin-bottom: 3px;
}

li.group div.title {
	height: 35px;
	line-height: 35px;
	background: #9ab92e;
	cursor: pointer;
}

ul.sub li {
	margin-bottom: 2px;
	height: 35px;
	line-height: 35px;
	background: #f4f4f4;
	cursor: pointer;
}

ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: #000;
}

ul.sub li:hover {
	background: #cf0;
}
</style>
</head>
<body>
	<div style="float: left; width: 30%; padding: 10px;">
		<ul id="navi">
			<li class="group" style="text-align: center;">
				<div class="title">${list.exe_part }</div>
				<ul class="sub">
					<li><a id="All">전체</a></li>
					<li><a id="기구">기구</a></li>
					<li><a id="맨몸">맨몸</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="exeDiv" style="float: left; width: 60%; padding: 10px;">
		<c:forEach items="exeList" var="exeList">
			<button onclick=""></button>
		</c:forEach>
	</div>
</body>
</html>