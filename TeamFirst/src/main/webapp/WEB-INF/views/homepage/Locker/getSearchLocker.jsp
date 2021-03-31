<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locker/getSearchLocker.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	// 락커 관리 팝업창
	function updateLocker() {
		var url = 'http://localhost/spring/getSearchRoom';
		window.open(url, "lockerRoom",
				"width=400, height=300, left=100, top=50");
	}

	// 해당 락커의 회원 상세조회
	$(document).ready(function() {
		$('.btn').click(function() { // 다중 값을 넘길 때는 class를 사용한다. 단건이면 id 속성 사용
			$.ajax({
				url : "getLocker",
				type : "get",
				data : { lock_no : $(this).val() },
				dataType : 'json',
				success : userSelect, // 회원 조회
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				}
			}) //ajax
		}); // click
	});// ready

	// 회원 상세보기 응답
	function userSelect(user) {
		$('input:text[name="lock_no"]').val(user.lock_no);
		$('input:text[name="broken_locker"]').val(user.broken_locker);
		$('input[name="first_date"]').val(user.first_date);
		$('input[name="final_date"]').val(user.final_date);
		$('input:text[name="user_id"]').val(user.user_id);
		$('input:text[name="room_no"]').val(user.room_no);
	}
	
	// 락커 등록
	$(document).ready(function() {
		$('#btnInsert').click(function() {
			$.ajax({
				url: 'insertLocker',
				method: 'Post',
				data: $('#form1').serialize(),
				dataType: 'json',
				success: function() {
					alert('등록 성공!!');
					 $('#form1').reset();
				},
				error: function() {
					alert('등록 실패!!');
				}
			})
		})
	})

	// 락커 수정
	$(document).ready(function() {
		$('#btnUpdate').click(function() { // 다중 값을 넘길 때는 class를 사용한다. 단건이면 id 속성 사용
			$.ajax({
				url : "updateLocker",
				method : "Post",
				data : $('#form1').serialize(),
				dataType : 'json',
				success : function(response) {
					alert('수정완료');
					
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				}
			}) //ajax
		}); // click
	});// ready

	// 락커 삭제
	$(document).ready(function() {
		$('#btnDelete').click(function() {
			$.ajax({
				url : 'deleteLocker',
				method : 'post',
				data : {
					lock_no : $('#lock_no').val()
				},
				dataType : 'json',
				success : function(response) {
					alert('삭제완료');
				},
				error : function(response) {
					alert('삭제 실패');
				}
			})
		})
	})
	
</script>

</head>
<body>
	<div>
		<h3>락커관리</h3>
		<input type="button" onclick="updateLocker()" value="관리">
		<button onclick="location.href='http://localhost/spring/getSearchLocker?gender=1'">남자</button>&nbsp;
		<button onclick="location.href='http://localhost/spring/getSearchLocker?gender=2'">여자</button>
		<hr>
		
		<c:forEach var="locker" items="${list }">
			<input type="button" class="btn" value="${locker.lock_no }">
		</c:forEach>
	</div>

		<h3>락커 상세보기</h3>
		<br>
	
			<form id="form1">
				<table border="1">
					<tr>
						<td>락커 번호</td>
						<td><input type="text" id="lock_no" name="lock_no" readonly="readonly"></td>
					</tr>
					<tr>
						<td>고장 여부</td>
						<td><input type="text" name="broken_locker"></td>
					</tr>
					<tr>
						<td>첫사용일자</td>
						<td><input type="date" name="first_date"></td>
					</tr>
					<tr>
						<td>종료일</td>
						<td><input type="date" name="final_date"></td>
					</tr>
					<tr>
						<td>유저아이디</td>
						<td><input type="text" name="user_id"></td>
					</tr>
					<tr>
						<td>락커룸 번호</td>
						<td><input type="text" name="room_no" readonly="readonly"></td>
					</tr>
				</table>
			</form>

		<div>
			<input type="button" id="btnInsert" value="추가">&nbsp; 
			<input type="button" value="수정" id="btnUpdate">&nbsp;
			<input type="button" value="삭제" id="btnDelete">&nbsp;
		</div>


</body>
</html>