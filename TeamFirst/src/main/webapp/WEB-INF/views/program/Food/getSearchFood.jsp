<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script type="text/javascript">

   	$(document).ready(function() {
   		$('.btnClick').click(function(e) {
   			e.preventDefault();
			$('#staticBackdrop').modal("show");	
   		});
   	});
</script>
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


	<br>
	<div>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>전화번호</td>
			<td>식단상세</td>
		</tr>
		<c:forEach var="list" items="${list }">
		<tr>
			<td id="id">${list.id }</td>
			<td>${list.name }</td>
			<td>${list.age }</td>
			<td>${list.gender }</td>
			<td>${list.phone_number }</td>
			<td><button type="button" onclick="location.href='getFood?id=${list.id}'">식단</button></td>
		</tr>
		</c:forEach>
	</table><br>
	</div>
