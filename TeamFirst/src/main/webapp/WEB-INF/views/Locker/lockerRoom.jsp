<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정하기</h1>
<form action="updateRoom" method="post">
<c:forEach items="${list }" var="room">
	락커룸 번호 : <input type="text" name="room_no" value="${room.room_no }">
	성별 : <input type="text" name="gender" value="${room.gender }">
	가로 락카 수 : <input type="text" name="lock_width" value="${room.lock_width }">
	<input type="submit" value="등록하기">
	<br>
</c:forEach>
</form>
</body>
</html>