<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>트레이너 상세조회</title>

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
<script type="text/javascript">
	function modify() {
		location = "getTrainerModify?id=" + $("#id").val();
	}
	function deleteEmp() {
		if (confirm("삭제하시겠습니까?")) {
			location = "deleteTrainer?id=" + $("#id").val();
		}
	}
	function list() {
		location = "trainerList";
	}
</script>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-15">
				<div align="center">
					<h1>트레이너 상세조회</h1>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Free Fit</div>
					<div align="center" class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr class="dataRow">
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
									<td><input name="name" value="${emp.name}"
										readonly="readonly"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input name="phone_number" value="${emp.phone_number}"
										readonly="readonly"></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input name="gender" value="${emp.gender}"
										readonly="readonly"></td>
								</tr>
								<tr>
									<th>입사날짜</th>
									<td><input name="hire_date" value="${emp.hire_date}"
										readonly="readonly"></td>
								</tr>
						</table>
						<br>
						<button class="btn btn-primary" onClick="javascript:modify()">수정</button>
						<button class="btn btn-primary" onClick="javascript:deleteEmp()">삭제</button>
						<button class="btn btn-primary" onClick="javascript:list()">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
