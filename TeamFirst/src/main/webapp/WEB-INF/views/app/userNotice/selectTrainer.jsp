<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>selectTrainer</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container my-4">
		<div align="center">
			<h3>트레이너 선택</h3>
			<br> <br>
		</div>
		<form class="form" id="insertappTrainer" name="frm" method="post" action="selectTrainer">
			<div align="center">
				<div class="form-group">
					<select class="form" id="fitness_id" name="fitness_id">
						<c:forEach items="${train}" var="trainer">
							<option value="${trainer.name}">${trainer.name}</option>
						</c:forEach>
						<td><input type="radio" name="id" value="${trainer.id}"></td>
					</select><br><br>
					<label for="title">강습 예약일</label>&nbsp;
						<input type="date" name="start_date"><br><br> 
				</div>
			</div>
			<div align="center">
				<input type="submit" class="btn  btn-primary"	id="insertappTrainer" value="선택하기">
			
			
				<input type="button" value="목록으로"  class="btn  btn-primary"
					onclick="location.href='tilesTestApp';">
			</div>	
		</form>
	</div>
</body>
</html>