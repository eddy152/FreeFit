<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>trainer List</title>

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
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-5">
					<h1 class="page-header">트레이너 리스트</h1>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input type="button" value="트레이너추가" style="float: right;"
							   onclick="location.href='/spring/members/joinformP'">
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Free fit</div>
					<div align="center" class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>피트니스ID</th>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>