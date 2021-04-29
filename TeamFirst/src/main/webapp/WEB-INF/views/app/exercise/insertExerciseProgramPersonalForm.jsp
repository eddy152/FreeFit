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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).on("click", "#prPut", function() {
		var trainer_id = $("#trainer_id").val();
		var exep_name = $("#exep_name").val();
		var exep_trainer_id = $("#exep_trainer_id").val();
		var user_id = $("#user_id").val();
		
		$.ajax({
			url: "insertExerciseProgramPersonal", 
			method: 'POST',
			data: "trainer_id=" + trainer_id + "&exep_name=" + exep_name + "&exep_trainer_id=" + exep_trainer_id + "&user_id=" + user_id,
			success: function(result) {
				alert("등록 성공");
				opener.location.reload();
				window.close();
			}
		})  // End of ajax
	})
</script>
<style type="text/css">
input{ border: none;}
td{background-color: white; }
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1.3em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
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
		<form>
			<table style="text-align: center;" border="1" class="table table-striped table-dark">
				<tr>
					<th scope="col">트레이너 아이디</th>
					<th scope="col">프로그램명</th>
					<th scope="col">트레이너 이름</th>
					<th scope="col">유저 아이디</th>
				</tr>
				<tr>
					<td><input type="text" id="trainer_id"></td>
					<td><input type="text" id="exep_name"></td>
					<td><input type="text" id="exep_trainer_id"></td>
					<td><input type="text" id="user_id"></td>
				</tr>
			</table><br>
			<button type="button" onclick="window.close()">창 닫기</button>&nbsp;
			<button type="button" id="prPut">추가하기</button>
		</form>
    </div>
</body>
</html>