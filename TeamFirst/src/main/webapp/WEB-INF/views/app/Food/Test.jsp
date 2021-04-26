<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<div>

<table class="table">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>식단상세</th>
		</tr>
		<c:forEach var="list" items="${list }">
		<tr>
			<td id="id">${list.id }</td>
			<td>${list.name }</td>
			<td>${list.age }</td>
			<td>${list.gender }</td>
			<td>${list.phone_number }</td>
			<td><button type="button" class="btn btn-outline-primary" onclick="location.href='getMemberFoodList?id=${list.id}'">식단상세</button></td>
		</tr>
		</c:forEach>
	</table><br>
</div>
