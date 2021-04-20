<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).on("click", "[name=exeDel]", function() {
		var exeNo = $(this).closest('tr')[0].children[0].children[0].value;
		console.log(exeNo);
		var jbResult = confirm( '운동을 삭제하시겠습니까?' );
		if(jbResult) {
			location.href = "deleteExerciseList?exe_no=" + exeNo;
		}
	})
</script>
</head>
<body>
	<div align="center">
			<table>
				<tr>
					<th>운동번호</th>
					<th>운동종류</th>
					<th>운동부위</th>
					<th>운동이름</th>
					<th>삭제하기</th>
				</tr>
				<c:forEach items="${listAll}" var="listAll">
					<tr>
						<td><input type="hidden" value="${listAll.exe_no }" name="exe_no"> ${listAll.exe_no }</td>
						<td>${listAll.exe_kinds }</td>
						<td>${listAll.exe_part }</td>
						<td>${listAll.exe_name }</td>
						<td><input type="button" value="삭제하기" name="exeDel"></td>
					</tr>
				</c:forEach>
			</table><br>
		    <input type="button" value="창닫기" onclick="window.close()">
	</div>
</body>
</html>