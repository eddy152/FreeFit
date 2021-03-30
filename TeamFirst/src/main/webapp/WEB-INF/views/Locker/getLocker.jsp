<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locker/getLocker.jsp</title>
<script type="text/javascript">
	function close(){
		window.open('','_self').close();  
	}
</script>
</head>
<body>
<!-- 락커관리 - 회원정보(팝업창) -->

<table border="1">
<tr>
	<td>락커 번호</td><td>${locker.lock_no }</td>
</tr>
<tr>
	<td>멤버쉽 등록 번호</td><td>${locker.mem_reg_id }</td>
</tr>
<tr>
	<td>고장 여부</td><td>${locker.first_date }</td>
</tr>
<tr>
	<td>종료일</td><td>${locker.final_date }</td>
</tr>
<tr>
	<td>유저아이디</td><td>${locker.user_id }</td>
</tr>
<tr>
	<td>락커룸 번호</td><td>${locker.room_no }</td>
</tr>
</table>

<input type="button" onclick="close()" value="OK">
</body>
</html>