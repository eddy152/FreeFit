<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<div>

<table border="1">
		<tr>
			<td>���̵�</td>
			<td>�̸�</td>
			<td>����</td>
			<td>����</td>
			<td>��ȭ��ȣ</td>
			<td>�Ĵܻ�</td>
		</tr>
		<c:forEach var="list" items="${list }">
		<tr>
			<td id="id">${list.id }</td>
			<td>${list.name }</td>
			<td>${list.age }</td>
			<td>${list.gender }</td>
			<td>${list.phone_number }</td>
			<td><button type="button" onclick="location.href='getMemberFoodList?id=${list.id}'">�Ĵܻ�</button></td>
		</tr>
		</c:forEach>
	</table><br>
</div>
