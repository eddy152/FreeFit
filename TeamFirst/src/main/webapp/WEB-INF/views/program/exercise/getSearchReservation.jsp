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
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<th>reservation_no</th>
				<th>user_id</th>
				<th>trainer_id</th>
				<th>reservation_date</th>
				<th>content</th>
				<th>reg_date</th>
			</tr>
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.reservation_no}</td>
					<td>${list.user_id}</td>
					<td>${list.trainer_id}</td>
					<td>${list.reservation_date}</td>
					<td>${list.content}</td>
					<td>${list.reg_date}</td>
				</tr>
			</c:forEach>
		</table>
		<button onclick="history.back()">뒤로 가기</button>
	</div>
</body>
</html>