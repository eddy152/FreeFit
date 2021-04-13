<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>트레이너 추가</title>
<!-- <script>
 		function goAdd(frm) {
			var phone_number = frm.phone_number.value;
			var name = frm.name.value;
			var gender = frm.gender.value;
			
			//var category = frm.category.value;
				
			if (phone_number.trim() == '') {
					alert("제목을 입력해주세요");
				return false;
			}
			if (name.trim() == '') {
				alert("이름을 입력해주세요");
				return false;
			}
			var (gender.trim() =='') {
				alert("성별을 선택해주세요")
			}
			
			//if (category.trim() == '') {
			//	alert("카테고리를 선택해주세요");
			//	return false;
			//}
			frm.submit();
			}
		</script>  -->
</head>
<body>
	<h2 style="text-align: center;">트레이너 추가</h2>
	<br>
	<br>
	<br>
	<div style="width: 60%; margin: auto;">
		<form method="post" action="insertAdminNoticeBoard">
		 	 아이디 :  <input type="text" name="id" style="width: 40%;" placeholder="아이디" /><br>
			<label for="category">카테고리 : </label>
			<select id="category" name="category">
				<option value="0">0</option>
				<option value="1">1</option>
			
			
			</select>
	
		<input id="subBtn" type="button" value="트레이너추가" style="float: right;"> 
							<!-- onclick="goAdd(this.form)" -->
		<!-- 목록으로 -->
      	<input type="button" value="목록으로" style="float: right;"
			   onclick="location.href='trainerList';">
		</form>
	</div>
</body>
</html>