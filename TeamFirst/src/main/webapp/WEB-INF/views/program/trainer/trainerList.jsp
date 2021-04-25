<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<title>trainer List</title>
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
	$(function() {
		$(".dataRow").click(function() {
			var id = $(this)[0].children[1].innerText
			location = "getTrainer?id=" + id;
		})
	});
</script>

</head>
<body>
			<div class="col-md-9 pr-30 padding-top-40">
				<!--게시판 넓이 -->
				<div align="center">
					<h1 class="page-header">트레이너 리스트</h1>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>멤버쉽</th>
									<th>ID</th>
									<th>이름</th>
									<th>연락처</th>
									<th>성별</th>
									<th>입사일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr class="dataRow">
										<td>${list.fitness_id}</td>
										<td>${list.id}</td>
										<td>${list.name}</td>
										<td>${list.phone_number}</td>
										<td>${list.gender}</td>
										<td>${list.hire_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
							<input type="button" value="트레이너추가" style="float: right;"
								class="btn btn-primary"
								onclick="location.href='/spring/members/joinformP'">
				</div>
			</div>
</body>
</html>