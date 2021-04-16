<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>트레이너 상세조회</title>
	<script type="text/javascript">

	function cancel(){
			location = "getTrainer?id=" + $("#id").val();
	}
</script>
</head>
<body>
	<div class="page-wrapper">
		<div align="center" class="container-fluid">
			<div class="col-lg-15">
				<!--게시판 넓이 -->
				<div class="col-lg-15">
					<h1 class="page-header">트레이너 상세조회</h1>
				</div>
				<div class="row"></div>
				<div class="panel panel-default">
					<div class="panel-heading">Free Fit</div>
					<form class="needs-validation" method="post" action="updateTrainer" novalidate>
					<div align="center" class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>멤버쉽</th>
									<td><input name="mem_reg_id" value="${emp.mem_reg_id}" readonly="readonly"></td>
								</tr>
								<tr>
									<th>ID</th>
									<td><input id="id"  name="id" value="${emp.id}" readonly="readonly"></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input name="name" value="${emp.name}"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input name="phone_number" value="${emp.phone_number}"></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input name="gender" value="${emp.gender}"></td>
								</tr>
								<tr>
									<th>입사날짜</th>
									<td><input name="hire_date" value="${emp.hire_date}" readonly="readonly"></td>
								</tr>
						</table>
					</div>
					<button type="submit">저장</button>
					<button type="button" onclick="javascript:cancel()">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>