<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html><head>
<title>productManagement.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<!-- <script>
		function productDel(){
			var check = confirm("강습을 삭제합니까?");
			if(check){
				location.href='productDel?course_no='+${cor.course_no}
				//location.href='productDel?course_no='+document.querySelector("#proDel").parentNode.parentNode.firstElementChild.innerText;
			}
		}
	
	</script>  -->
</head>
<body>
	<div class="container my-3">
		<h2>상품(강습정보) 페이지</h2>
		<table class="table">
			<thead>
				<tr class="thead-dark">
					<th>강습번호</th>
					<th>강습명</th>
					<th>강습시작일</th>
					<th>강습종료일</th>
					<th>담당트레이너</th>
					<th>정원</th>
					<th>강습수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="cor">
					<tr>
						<td>${cor.course_no}</td>
						<td>${cor.course_title}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" type="BOTH" value="${cor.start_date}"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" type="BOTH" value="${cor.end_date}"/></td>
						<td>${cor.trainer_id}</td>
						<td>${cor.limit}</td>
						<td align="left"><input class="button" type="button" value="강습수정" onclick="location.href='productUpdate?course_no=${cor.course_no}'" >
										<input class="button" type="button" value="강습삭제" onclick="location.href='proDel?course_no=${cor.course_no}'" id="proDel" >
						</td>			
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- button -->
		<input class="button" type="button" value="강습등록" onclick="location.href='productWrite' " style="float: right">
	</div>
</body>
</html>