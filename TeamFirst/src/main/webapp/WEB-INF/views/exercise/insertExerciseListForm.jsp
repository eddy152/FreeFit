<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function onClick() {
		$("#exeAddForm").submit();
		alert('저장 완료.');
	}
</script>
</head>
<body>
	<div align="center">
		<form action="insertExerciseList" id="exeAddForm">
			<table border="1">
				<tr>
					<!-- <th>운동 번호</th> -->
					<th>운동 종류</th>
					<th>운동 부위</th>
					<th>운동 이름</th>
				</tr>
				<tr>
					<!-- <td><input type="text" name=exe_no></td> -->
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
			</table><br><br>
			<input type="button" value="창닫기" onclick="window.close()">
			<input type="submit" value="저장하기" onclick="onClick()">
		</form>
	</div>
</body>
</html>