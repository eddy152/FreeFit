<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ʈ���̳� �߰�</title>
<!-- <script>
 		function goAdd(frm) {
			var phone_number = frm.phone_number.value;
			var name = frm.name.value;
			var gender = frm.gender.value;
			
			//var category = frm.category.value;
				
			if (phone_number.trim() == '') {
					alert("������ �Է����ּ���");
				return false;
			}
			if (name.trim() == '') {
				alert("�̸��� �Է����ּ���");
				return false;
			}
			var (gender.trim() =='') {
				alert("������ �������ּ���")
			}
			
			//if (category.trim() == '') {
			//	alert("ī�װ��� �������ּ���");
			//	return false;
			//}
			frm.submit();
			}
		</script>  -->
</head>
<body>
	<h2 style="text-align: center;">Ʈ���̳� �߰�</h2>
	<br>
	<br>
	<br>
	<div style="width: 60%; margin: auto;">
		<form method="post" action="insertAdminNoticeBoard">
		 	 ���̵� :  <input type="text" name="id" style="width: 40%;" placeholder="���̵�" /><br>
			<label for="category">ī�װ� : </label>
			<select id="category" name="category">
				<option value="0">0</option>
				<option value="1">1</option>
			
			
			</select>
	
		<input id="subBtn" type="button" value="Ʈ���̳��߰�" style="float: right;"> 
							<!-- onclick="goAdd(this.form)" -->
		<!-- ������� -->
      	<input type="button" value="�������" style="float: right;"
			   onclick="location.href='trainerList';">
		</form>
	</div>
</body>
</html>