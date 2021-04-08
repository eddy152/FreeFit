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
	$(function(){  
		$("#btnRsv").on("click", function(){
			var url = "getSearchReservation?id=${list.id}";
			$(location).attr('href', url);
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<th>ID</th>
				<th>PHONE_NUMBER</th>
				<th>NAME</th>
				<th>AGE</th>
				<th>HEIGHT</th>
				<th>NOTICE</th>
				<th>GENDER</th>
				<th>MEM_REG_ID</th>
			</tr>
			<tr>
				<td>${list.id}</td>
				<td>${list.phone_number}</td>
				<td>${list.name}</td>
				<td>${list.age}</td>
				<td>${list.height}</td>
				<td>${list.notice}</td>
				<c:choose>
					<c:when test="${list.gender eq 1}">
						<td>남자</td>
					</c:when>
					<c:when test="${list.gender eq 2}">
						<td>여자</td>
					</c:when>
				</c:choose>
				<td>${list.mem_reg_id}</td>
			</tr>
		</table>
		<button onclick="history.back()">뒤로 가기</button>
		<button id="btnRsv">상담이력</button>
	</div>
</body>
</html>