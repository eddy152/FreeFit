<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<div>

<table class="table">
		<tr>
			<th>���̵�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>����</th>
			<th>��ȭ��ȣ</th>
			<th>�Ĵܻ�</th>
		</tr>
		<c:forEach var="list" items="${list }">
		<tr>
			<td id="id">${list.id }</td>
			<td>${list.name }</td>
			<td>${list.age }</td>
			<td>${list.gender }</td>
			<td>${list.phone_number }</td>
			<td><button type="button" class="btn btn-outline-primary" onclick="location.href='getMemberFoodList?id=${list.id}'">�Ĵܻ�</button></td>
		</tr>
		</c:forEach>
	</table><br>
</div>
