<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).on("click", "[name=exeDel]", function() {
		var exeNo = $(this).closest('tr')[0].children[0].children[0].value;
		console.log(exeNo);
		var jbResult = confirm( '운동을 삭제하시겠습니까?' );
		if(jbResult) {
			alert("삭제완료");
			location.href = "deleteExerciseList?exe_no=" + exeNo;
			window.close();
		}
	})
</script>
<style type="text/css">
button{
  background:#E66761;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:1.2em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#E63B02;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #E63B02;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
</head>
<body>
	<div align="center">
		<table class="table table-striped table-dark">
			<tr>
				<th scope="col">운동번호</th>
				<th scope="col">운동종류</th>
				<th scope="col">운동부위</th>
				<th scope="col">운동이름</th>
				<th scope="col">삭제하기</th>
			</tr>
			<c:forEach items="${listAll}" var="listAll">
				<tr>
					<td><input type="hidden" value="${listAll.exe_no }" name="exe_no"> ${listAll.exe_no }</td>
					<td>${listAll.exe_kinds }</td>
					<td>${listAll.exe_part }</td>
					<td>${listAll.exe_name }</td>
					<td>
					<button type="button" name="exeDel">삭제</button>
				</tr>
			</c:forEach>
		</table><br>
		<button type="button" onclick="window.close()">창 닫기</button>
	</div>
</body>
</html>