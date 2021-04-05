<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Food/getSearchFood.jsp</title>
<script type="text/javascript">
	
	function member() {
		var id = $('input[name=id]').val();
		location.href='getFood?id=' + id;
	}
</script>
</head>
<body>
<h1>식단 관리(회원정보)</h1>
<table border="1">
	<tr>
		<td>회원 아이디</td>
		<td>회원 이름</td>
		<td>회원 나이</td>
		<td>회원 성별</td>
		<td>회원 전화번호</td>
		<td>상세</td>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr>
			<td><input name="id" value="${list.id }"></td>
			<td>${list.name }</td>
			<td>${list.age }</td>
			<td>${list.gender }</td>
			<td>${list.phone_number }</td>
			<td><button class="btn" onclick="member()" value="${list.id }">식단</button></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>