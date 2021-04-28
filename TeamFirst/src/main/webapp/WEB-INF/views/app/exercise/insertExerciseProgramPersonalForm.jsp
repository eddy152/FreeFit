<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).on("click", "#prPut", function() {
		var trainer_id = $("#trainer_id").val();
		var exep_name = $("#exep_name").val();
		var exep_trainer_id = $("#exep_trainer_id").val();
		var user_id = $("#user_id").val();
		
		$.ajax({
			url: "insertExerciseProgramPersonal", 
			method: 'POST',
			data: "trainer_id=" + trainer_id + "&exep_name=" + exep_name + "&exep_trainer_id=" + exep_trainer_id + "&user_id=" + user_id,
			success: function(result) {
				alert("등록 성공");
				window.close();
			}
		})  // End of ajax
	})
</script>
</head>
<body>
	<div align="center">
		<form>
			<table style="text-align: center;" border="1">
				<tr>
					<th>트레이너 아이디</th>
					<th>프로그램명</th>
					<th>트레이너 이름</th>
					<th>유저 아이디</th>
				</tr>
				<tr>
					<td><input type="text" id="trainer_id"></td>
					<td><input type="text" id="exep_name"></td>
					<td><input type="text" id="exep_trainer_id"></td>
					<td><input type="text" id="user_id"></td>
				</tr>
			</table><br>
	    <input type="button" value="창닫기" onclick="window.close()">
	    <input type="button" value="추가하기" id="prPut">
		</form>
    </div>
</body>
</html>