<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>app/Food/getAppFood.jsp</title>
</head>
<body>
<h1>��õ�� �Ĵ�</h1>
<table border="1">
	<tr>
		<td>�Ĵ� ��ȣ</td>
		<td>��õ�� �Ĵ�</td>
		<td>�� Į�θ�</td>
	</tr>
<c:forEach var="food" items="${list }">
	<tr>
		<td>${food.diet_no }</td>
		<td>${food.diet_title }</td>
		<td>�� Į�θ�</td>
	</tr>
</c:forEach>
</table>

<button type="button" onclick="location.href='insertFood'">�߰��ϱ�</button>

</body>
</html>