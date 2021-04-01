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
<script type="text/javascript">
	$(function() {
		$("tr").on("click", function() {
			var user_id = $(this)[0].firstElementChild.innerText;
			var url = "getFFUserProc?user_id=";
			$(location).attr('href', url + user_id);
		})
	})
</script>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<th>USER_ID</th>
				<th>NAME</th>
				<th>AGE</th>
				<th>GENDER</th>
				<th>PHONE_NUMBER</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.user_id}</td>
					<td>${list.name}</td>
					<td>${list.phone_number}</td>
					<td>${list.age}</td>
					<c:choose>
						<c:when test="${list.gender eq 1}">
							<td>남자</td>
						</c:when>
						<c:when test="${list.gender eq 2}">
							<td>여자</td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<button onclick="history.back()">뒤로 가기</button>
	</div>
</body>
</html>