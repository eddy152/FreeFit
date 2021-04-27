<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.right {
	display: inline-block;
	text-align: center;
	width: 100%;
	vertical-align: top;
	border: 0 10px;
	margin: 0 10px;
	padding: 0 10px;
	list-style: none;
}

table {
	width: 70%;
}

td {
	padding: 15px;
	text-align: center;
}

th {
	padding: 15px;
	text-align: center;
}

#t01 tr:nth-child(even) {
	background-color: #eee;
}

#t01 tr:nth-child(odd) {
	background-color: #fff;
}

#t01 th {
	background-color: black;
	color: white;
}
</style>
<title>트레이너 상세조회</title>
<script type="text/javascript">
	function cancel() {
		location = "getTrainer?id=" + $("#id").val();
	}
</script>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-15">
				<div align="center">
					<h1 class="page-header">트레이너 수정페이지</h1>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Free Fit</div>
					<form class="needs-validation" method="post" action="updateTrainer"
						novalidate>
						<div align="center" class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>피트니스ID</th>
										<td><input name="fitness_id" value="${emp.fitness_id}"
											readonly="readonly"></td>
									</tr>
									<tr>
										<th>ID</th>
										<td><input id="id" name="id" value="${emp.id}"
											readonly="readonly"></td>
									</tr>
									<tr>
										<th>이름</th>
										<td><input name="name" value="${emp.name}"></td>
									</tr>
									<tr>
										<th>연락처</th>
										<td><input name="phone_number"
											value="${emp.phone_number}"></td>
									</tr>
									<tr>
										<th>성별</th>
										<td><input name="gender" value="${emp.gender}"></td>
									</tr>
									<tr>
										<th>입사날짜</th>
										<td><input name="hire_date" value="${emp.hire_date}"
											readonly="readonly"></td>
									</tr>
							</table>
							<br>
							<button class="btn btn-primary" type="submit">저장</button>
							<button class="btn btn-primary" type="button"
								onclick="javascript:cancel()">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>