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
	
	
	// + 클릭 시 하단의 div 태그에 음식, 수량 추가
	$(document).ready(function() {
		$('.addFood').click(function() {
			var selectFood = $('#foods option:selected').val();
			var count = $('#Foodcount').val();
			
			$('.frm1').append(
				'<input name="food_name" value="' + selectFood + '">' + 
				'<input name="count" value="' + count + '">' +
				'개' + '<br>'
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
			alert(food + '는(은) ' + count + '개');
			console.log("i의 현재갯수 : " +i);
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
<h1>식단 추가하기</h1>
제목 : <input type="text" id="diet_title1"><br>
작성자 : <input type="text" id="trainer_id1"><br>
음식 : <div class="addFoodInput">
<select id="foods">
	<option value="">선택</option>
	<c:forEach var="food" items="${foodList }">
		<option value="${food.food_name }">${food.food_name }</option>
	</c:forEach>
</select>
<input type="text" id="Foodcount"> 개
</div>
	<button type="button" class="addFood">+</button>

<hr>
<div class="frm1">
음식명 : 
</div>
총 칼로리 : <input type="text" name="calorie"><br>
<button type="button" onclick="Click()">등록</button>

<form action="insertFood" method="post" class="frm">
	제목 : <input type="text" name="diet_title"><br>
	작성자 : <input type="text" name="trainer_id"><br>
</form>

</body>
</html>