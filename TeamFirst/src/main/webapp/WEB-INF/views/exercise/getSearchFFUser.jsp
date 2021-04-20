<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		$("tr").on("click", function() {
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
</script>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.id}</td>
					<td>${list.name}</td>
					<td>${list.phone_number}</td>
					<td>${list.age}</td>
					<c:choose>
						<c:when test="${list.gender eq 1}">
							<td>남자</td>
						</c:when>
						<c:when test="${list.gender eq 2}">
							<td>여자</td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<button onclick="history.back()">뒤로 가기</button>
	</div>
</body>
</html>