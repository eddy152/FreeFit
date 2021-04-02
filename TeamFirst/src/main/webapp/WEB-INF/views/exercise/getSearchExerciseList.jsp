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
</style>
</head>
<body>
	<div style="float: left; width: 60%; padding: 10px;">
		<ul id="navi">
			<li class="group" style="text-align: center;">
				<ul class="exercise">
				<c:forEach items="${list}" var="list">
					<li><a>${list.exe_name }</a></li>
				</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>