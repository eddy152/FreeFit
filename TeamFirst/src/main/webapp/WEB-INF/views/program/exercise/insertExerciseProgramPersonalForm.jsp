<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<div align="center">
		<form action="insertExerciseProgramPersonal" method="post">
			<table style="text-align: center;" border="1">
				<tr>
					<th>트레이너 아이디</th>
					<th>프로그램명</th>
					<th>트레이너 이름</th>
					<th>유저 아이디</th>
				</tr>
				<tr>
					<td><input type="text" name="trainer_id"></td>
					<td><input type="text" name="exep_name"></td>
					<td><input type="text" name="exep_trainer_id"></td>
					<td><input type="text" name="user_id"></td>
				</tr>
			</table><br>
	    <input type="button" value="창닫기" onclick="window.close()">
	    <input type="submit" value="추가하기" id="prPut">
		</form>
    </div>
</body>
</html>