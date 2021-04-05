<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Food/getSearchFood.jsp</title>
<script type="text/javascript">
	
	function member() {
		var id = $('input[name=id]').val();
		location.href='getFood?id=' + id;
	}
</script>
</head>
<body>
<h1>�Ĵ� ����(ȸ������)</h1>
<table border="1">
	<tr>
		<td>ȸ�� ���̵�</td>
		<td>ȸ�� �̸�</td>
		<td>ȸ�� ����</td>
		<td>ȸ�� ����</td>
		<td>ȸ�� ��ȭ��ȣ</td>
		<td>��</td>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr>
			<td><input name="id" value="${list.id }"></td>
			<td>${list.name }</td>
			<td>${list.age }</td>
			<td>${list.gender }</td>
			<td>${list.phone_number }</td>
			<td><button class="btn" onclick="member()" value="${list.id }">�Ĵ�</button></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>