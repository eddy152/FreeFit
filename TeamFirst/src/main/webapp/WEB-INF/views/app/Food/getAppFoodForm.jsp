<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>app/Food/getAppFoodForm.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
	
	// + Ŭ�� �� �ϴ��� div �±׿� ����, ���� �߰�
	$(document).ready(function() {
		$('.addFood').click(function() {
			var selectFood = $('#foods option:selected').val();
			var count = $('#Foodcount').val();
			
			$('.frm1').append(
				'<input name="food_name" value="' + selectFood + '">' + 
				'<input name="count" value="' + count + '">' +
				'��' + '<br>'
			);
			
			$('select').val('');
			$('#Foodcount').val('');
			
		});
	});
	
	function Click(){
		console.log($('.frm1').serialize());
		var size = $('input:text[name="food_name"]').length;
		var foods = '';
		for(i=0; i<size; i++) {
			var food = $('input:text[name="food_name"]').eq(i).attr("value");
			var count = $('input:text[name="count"]').eq(i).attr("value");
			alert(food + '��(��) ' + count + '��');
			console.log("i�� ���簹�� : " +i);
			if(i == 0) {
				foods = food + '/' + count;
			} else {
				foods = ' ' + food+ '/' + count;
			}
			console.log(foods);
			$('.frm').append(
				'<input type="text" name="diet_content" value="'+ foods +'">'
			)	
		}
		
		$('input:text[name="diet_title"]').val($('#diet_title1').val());
		$('input:text[name="trainer_id"]').val($('#trainer_id1').val());
		
		$('.frm').submit();
	}
	
</script>
</head>
<body>
<h1>�Ĵ� �߰��ϱ�</h1>
���� : <input type="text" id="diet_title1"><br>
�ۼ��� : <input type="text" id="trainer_id1"><br>
���� : <div class="addFoodInput">
<select id="foods">
	<option value="">����</option>
	<c:forEach var="food" items="${foodList }">
		<option value="${food.food_name }">${food.food_name }</option>
	</c:forEach>
</select>
<input type="text" id="Foodcount"> ��
</div>
	<button type="button" class="addFood">+</button>

<hr>
<div class="frm1">
���ĸ� : 
</div>
�� Į�θ� : <input type="text" name="calorie"><br>
<button type="button" onclick="Click()">���</button>

<form action="insertFood" method="post" class="frm">
	���� : <input type="text" name="diet_title"><br>
	�ۼ��� : <input type="text" name="trainer_id"><br>
</form>

</body>
</html>