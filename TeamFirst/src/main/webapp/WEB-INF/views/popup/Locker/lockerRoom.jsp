<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('.roomTr').click(function() {
			$.ajax({
				url: 'getRoom',
				type: 'get',
				data: { room_no : $('.roomNO').val() },
				dataType: 'json',
				success: roomSelect, // 락커룸 조회
				error: function() {
					alert('조회 실패!!');
				} // error
			}); // ajax
		}); // click
	}); //ready
	
	// 락커룸 상세보기 응답
	function roomSelect(room) {
		$('input:text[name="room_no"]').val(room.room_no);
		$('input:text[name="gender"]').val(room.gender);
		$('input:text[name="lock_width"]').val(room.lock_width);
	}

</script>
</head>
<body>
<h1>수정하기</h1>
<%-- <form action="updateRoom" method="post">
	락커룸 번호 : <input  type="text" name="room_no" value="${room.room_no }">
	성별 : <input type="text" name="gender" value="${room.gender }">
	가로 락카 수 : <input type="text" name="lock_width" value="${room.lock_width }">
	<br>
	<input type="submit" value="등록하기">
</form> --%>

<table border="1">
	<tr>
		<td>락커룸번호</td>
		<td>성별</td>
		<td>가로락카수</td>
	</tr>
<c:forEach items="${list }" var="room">
	<tr class="roomTr">
		<td>${room.room_no }<input class="roomNO" type="hidden" value="${room.room_no }"></td>
		<td>${room.gender }</td>
		<td>${room.lock_width }</td>
	</tr>
</c:forEach>
</table>
<br>
<div>
<form action="" method="post">
	<table border="1">
		<tr>
			<td>락커룸번호</td>
			<td><input type="text" name="room_no"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" name="gender"></td>
		</tr>
		<tr>
			<td>가로락카수</td>
			<td><input type="text" name="lock_width"></td>
		</tr>
	</table>
	<input type="submit" value="등록하기">
</form>
</div>
</body>
</html>