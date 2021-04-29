<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script type="text/javascript">
	function onClick() {
		$("#exeAddForm").submit();
		alert('저장 완료.');
	}
</script>
<style type="text/css">
input{ border: none;}
td{background-color: white; }
button{
  background:#1AAB8A;
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
		<form action="insertExerciseList" id="exeAddForm">
			<table class="table table-striped table-dark">
				<tr>
					<!-- <th>운동 번호</th> -->
					<th>운동 종류</th>
					<th>운동 부위</th>
					<th>운동 이름</th>
				</tr>
				<tr>
					<td>
						<select name="exe_kinds" size="1">
							<option value="기구">기구운동</option>
							<option value="맨몸">맨몸운동</option>
						</select>
					</td>
					<td>
						<select name="exe_part" size="1">
							<option value="가슴">가슴</option>
							<option value="등">등</option>
							<option value="이두">이두</option>
							<option value="삼두">삼두</option>
							<option value="하체">하체</option>
							<option value="복근">복근</option>
						</select>
					</td>
					<td><input type="text" name=exe_name></td>
				</tr>
			</table><br>
			<button type="button" onclick="window.close()">창 닫기</button>&nbsp;
			<button type="button" id="prPut" onclick="onClick()">추가하기</button>
		</form>
	</div>
</body>
</html>