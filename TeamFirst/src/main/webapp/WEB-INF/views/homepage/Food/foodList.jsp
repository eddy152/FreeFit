<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food/foodList.jsp</title>
</head>
<body>
<!-- 식단관리 - 회원 목록 -->
<h1>식단관리</h1>
<table>
	<tr>
		<td>회원명</td>
		<td>성별</td>
		<td>나이</td>
		<td>전화번호</td>
	</tr>
		<c:forEach var="" items="">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="submit">식단</td>
			</tr>
		</c:forEach>
</table>

<input onclick="location.href='foodListForm.jsp'">관리
</body>
</html>