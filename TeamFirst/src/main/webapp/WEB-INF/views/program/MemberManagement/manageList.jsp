<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
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
<title>manageList.jsp</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-15">
				<div align="center">
					<h2>수강회원 리스트</h2>
				</div>
				<div class="panel panel-default">
					<div align="center" class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr class="dataRow">
									<th>수강번호</th>
									<th>유저ID</th>
									<th>강의번호</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>잔여횟수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memList}" var="mem">
									<tr class="dataRow">
										<td>${mem.course_reg_no}</td>
										<td>${mem.user_id}</td>
										<td>${mem.tuition_no}</td>
										<td><fmt:formatDate value="${mem.start_date}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${mem.end_date}"
												pattern="yyyy-MM-dd" /></td>
										<td>${mem.remains}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input type="button" value="수강회원 등록" style="float: right;"
							class="btn btn-primary" onclick="location.href='#';">
					</div>
				</div>
				<!--row 끝 -->
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			var no = $(this)[0].children[0].innerText
			location = "getMem?course_reg_no=" + no;
		})
	});

	function fn_paging(page) {
		location = "userNList?page=" + page + "&search="
				+ $("#search_text").val();
	}
</script>
</html>