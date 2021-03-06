<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width: 100%;
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
		$(".ffuser").on("click", function() {
			var id = $(this)[0].firstElementChild.innerText;
			var form = document.createElement('form');
			var objs;
			var objs2;

			objs = document.createElement('input');
			objs.setAttribute('type', 'hidden');
			objs.setAttribute('name', 'id');
			objs.setAttribute('value', id);

			objs2 = document.createElement('input');
			objs2.setAttribute('type', 'hidden');
			objs2.setAttribute('name', 'user_id');
			objs2.setAttribute('value', id);

			form.appendChild(objs);
			form.appendChild(objs2);
			form.setAttribute('method', 'post');
			form.setAttribute('action', "getFFUserProc");

			document.body.appendChild(form);

			form.submit();
		})
	})
	
	$(document).on("click", "#btnBack", function() {
		var form = document.createElement('form');
		
		form.setAttribute('method', 'get');
		form.setAttribute('action', "tilesTestApp");

		document.body.appendChild(form);

		form.submit();
	})
</script>
<style type="text/css">
 tr.ffuser:hover { background-color: #D9D7D9; }
</style>
</head>
<body>
	<div class="col-md-9 pr-30 padding-top-40">
		<div align="center">
			<h2>?????? ????????????</h2>
			<table class="table">
				<tr>
					<th>?????????</th>
					<th>??????</th>
					<th>????????????</th>
					<th>??????</th>
					<th>??????</th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr class="ffuser">
						<td>${list.id}</td>
						<td>${list.name}</td>
						<td>${list.phone_number}</td>
						<td>${list.age}</td>
						<c:choose>
							<c:when test="${list.gender eq 1}">
								<td>??????</td>
							</c:when>
							<c:when test="${list.gender eq 2}">
								<td>??????</td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			<br>
			<br>
			<div class="col-sm-10 col-sm-offset-1">
				<button id="btnBack" class="btn btn-primary">????????????</button>
			</div>
		</div>
	</div>
</body>
</html>