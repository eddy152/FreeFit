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
				data: { room_no : $('.roomNO').eq($(".roomTr").index(this)).val() },
				dataType: 'json',
				success: roomSelect, // 락커룸 조회
				error: function() {
					alert('조회 실패!!');
				} // error
			});// ajax
		}); // click
	}); //ready
	
	// 락커룸 상세보기 응답
	function roomSelect(room) {
		$('input:text[name="room_no"]').val(room.room_no);
		$('input:text[name="gender"]').val(room.gender);
		$('input:text[name="lock_width"]').val(room.lock_width);
	}
	
	// 락커룸 삭제하기
	$(document).ready(function() {
		$('.deleteBtn').click(function() {
		confirm('정말 삭제하시겠습니까?');
		
		$.ajax({
			url: 'deleteRoom',
			type: 'post',
			data: { room_no : $('input:text[name="room_no"]').val() },
			dataType: 'json',
			success: function(data) {
				if(data == 1) {
				alert('삭제 성공!!');
				location.reload();
			}
				else {
					alert('삭제 실패!!');					
					}
			},
			error: function() {
				alert('에러!!');
			}
		});
	});
});
	
</script>
</head>
<body>
<h1>수정하기</h1>

<table border="1">
	<tr>
		<td>락커룸번호</td>
		<td>성별</td>
		<td>가로락카수</td>
	</tr>
<c:forEach items="${list }" var="room">
	<tr class="roomTr">
		<td>${room.room_no }
	<input class="roomNO" type="hidden" value="${room.room_no }">
		</td>
		<td>${room.gender }</td>
		<td>${room.lock_width }</td>
	</tr>
</c:forEach>
</table>
<br>
<div>
<form action="updateRoom" method="post">
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
	<input type="button" class="deleteBtn" value="삭제하기">
</div>
</body>
</html>