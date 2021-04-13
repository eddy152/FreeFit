<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>app/Food/getAppFood.jsp</title>
</head>
<body>
<h1>추천별 식단</h1>
<table border="1">
	<tr>
		<td>식단 번호</td>
		<td>추천별 식단</td>
		<td>총 칼로리</td>
	</tr>
<c:forEach var="food" items="${list }">
	<tr>
		<td>${food.diet_no }</td>
		<td>${food.diet_title }</td>
		<td>총 칼로리</td>
	</tr>
</c:forEach>
</table>

<button type="button" onclick="location.href='insertFood'">추가하기</button>

</body>
</html>