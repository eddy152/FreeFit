<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>트레이너 추가</title>
<script>
 		function goAdd(frm) {
			var id = frm.id.value;
			var name = frm.name.value;
			var phone_number = frm.phone_number.value;
			var hire_date = frm.hire_date.value;
			//var category = frm.category.value;
				
			if (id.trim() == '') {
					alert("ID를 입력해주세요");
				return false;
			}
			if (name.trim() == '') {
				alert("이름을 입력해주세요");
				return false;
			}
			var (phone_number.trim() =='') {
				alert("연락처를 입력해주세요")
			}
			var (hire_date.trim() =='') {
				alert("입사날짜를 입력해주세요")
			}
			
			//if (category.trim() == '') {
			//	alert("카테고리를 선택해주세요");
			//	return false;
			//}
			frm.submit();
			}
		</script> 
</head>
<body>
	<h2 style="text-align: center;">트레이너 등록</h2>
	<br>
	<br>
	<br>
	<div align="center">
		<font size=5> 트레이너 등록하기 </font>
	</div>
	<br>
	<div align="center">
		<br> <br>
		<form action="addTrainerMember">
			<table border=1 width=600>
				<tr>
					<td align=center>멤법쉽등록ID</td>
					<td><input type=text name=memregid size=10></td>
				</tr>
				<tr>
					<td align=center>ID</td>
					<td><input type=text name=id size=20></td>
				</tr>
				<tr>
					<td align=center>이름</td>
					<td><input type=text name=name size=40></td>
				</tr>
				<tr>
					<td align=center>연락처</td>
					<td><input type=text name=phone size=10></td>
				</tr>
				<tr>
					<td align=center>성별<br>[1:남자,0:여자]</td>
					<td><input type=text name=gender size=10></td>
				</tr>
				<tr>
					<td align=center>수상</td>
					<td><input type=text name=awards size=10></td>
				</tr>
				<tr>
					<td align=center>경력</td>
					<td><input type=text name=career size=10></td>
				</tr>
				<tr>
					<td align=center>입사일</td>
					<td><input type=text name=hiredate size=10></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input id="subBtn" type="button" value="등록하기"
							   onclick="goAdd(this.form)">
						&emsp; 
						<input type=button value="목록으로" 
						onclick="location.href='trainerList';"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>