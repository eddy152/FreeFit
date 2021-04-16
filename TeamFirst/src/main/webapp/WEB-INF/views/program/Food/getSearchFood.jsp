<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

   	$(document).ready(function() {
   		$('.btnClick').click(function(e) {
   			e.preventDefault();
			$('#staticBackdrop').modal("show");	
   		});
   	});
   	
</script>



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
