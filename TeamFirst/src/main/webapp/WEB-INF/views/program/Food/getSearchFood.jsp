<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head>
<title>userNList.jsp</title>
<link href="http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</head>
<script>

$(document).ready(function() { $('.btnClick').click(function(e) {
e.preventDefault(); $('#staticBackdrop').modal("show"); }); });
</script>
<style>

.jm{font-family: 'Jeju Myeongjo', serif;}
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
<body>
	<br>
	<br>
	<div class="page-wrapper">
		<div class="container-fluid">
		<div class="row row-2">
			<div class="col-sm-5">
				<h1 class="jm">회원 식단관리</h1>
			</div><br>
			<div class="table-responsive">
				<table class="table table-striped">	
					<thead>
					<tr>  
						<th>아이디</th>
						<th>이름</th>
						<th>나이</th>
						<th>성별</th>
						<th>전화번호</th>
						<th>식단상세</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list }">
						<tr>
							<td id="id">${list.id }</td>
							<td>${list.name }</td>
							<td>${list.age }</td>
							<c:if test="${list.gender eq '1' }">
							<td>남자</td>
							</c:if>
							<c:if test="${list.gender eq '2' }">
							<td>여자</td>
							</c:if>
							<c:if test="${list.gender ne '2' && list.gender ne '1'}">
							<td>X</td>
							</c:if>
							<td>${list.phone_number }</td>
							<td><button type="button" class="btn btn-info"
									onclick="location.href='getFood?id=${list.id}'">식단</button></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<br>
			</div>
		</div>
		</div>
	</div>
</body>
</html>