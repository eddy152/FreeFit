<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>getAppFoodForm.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<style>
.right {
	display: inline-block;
	text-align: center;
	width: 100%;
	vertical-align: top;
	border: 0 10px;
	margin: 0 10px;
	padding: 0 10px;
	list-style: none;
}

table {
	width: 100%;
}

td {
	padding: 15px;
	text-align: center;
}

th {
	padding: 15px;
	text-align: center;
}

#t01 tr:nth-child(even) {
	background-color: #eee;
}

#t01 tr:nth-child(odd) {
	background-color: #fff;
}

#t01 th {
	background-color: black;
	color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	// 해당 음식과 갯수로 인한 칼로리 계산
	function TotalCalorie(a, b) {
		// 해당 음식의 1. 칼로리, 2. 갯수
		var food_calorie = a;
		var food_count = b;
		var result = a * b;
		return result;
	}

	// + 클릭 시 하단의 div 태그에 음식, 수량 추가
	$(document)
			.ready(
					function() {
						$('.addFood')
								.click(
										function() {
											var selectFood = $(
													'#foods option:selected')
													.val();
											var count = $('#Foodcount').val();
											var selectFoodName = $(
													'option:selected').text();

											console.log(selectFood
													+ "-> selectFood");

											if (!selectFood || !count) {
												alert('음식과 갯수를 선택하세요!');
											} else {

												var food_calorie = $(
														'#foods option:selected')
														.val();

												var result = TotalCalorie(
														food_calorie, count);

												$('.frm1')
														.append(
																'<div>'
																		+ '<input type="text" name="food_name" value="' + selectFoodName + '">'
																		+ '<input type="text" name="food_calorie" hidden="hidden" value="' + selectFood + '">'
																		+ '<input type="text" name="count" onchange="change(this)" value="'
																		+ count
																		+ '">'
																		+ '개'
																		+ '<button type="button" class="deleteFood">-</button>'
																		+ '</div>');

												var calorie = $(
														'input:text[name="total_calorie1"]')
														.val();

												console.log(calorie + ', '
														+ result);
												if (!calorie) {
													$(
															'input:text[name="total_calorie1"]')
															.val(
																	parseInt(result));
												} else {
													$(
															'input:text[name="total_calorie1"]')
															.val(
																	parseInt(calorie)
																			+ parseInt(result));
												}

												$('select').val('');
												$('#Foodcount').val('');
											}

										});
					});

	// - 클릭시 해당 음식명, 갯수 input 태그가 삭제됨
	$(document)
			.ready(
					function() {
						$(document)
								.on(
										'click',
										'.deleteFood',
										function() {
											var selectFood = $(this).siblings()
													.eq(1).val(); // 칼로리
											var count = $(this).siblings()
													.eq(2).val(); // 갯수

											var result = TotalCalorie(
													selectFood, count); // 칼로리 * 갯수
											var calorie = $(
													'input:text[name="total_calorie1"]')
													.val(); // 총 칼로리
											$(
													'input:text[name="total_calorie1"]')
													.val(
															parseInt(calorie)
																	- parseInt(result));

											$(this).closest('div').remove();

										});
					});

	// 등록 버튼 클릭시 해당 form 데이터를 가지고 recommended_diet 테이블에 저장한다.
	function Click() {
		console.log($('.frm1').serialize());
		var size = $('input:text[name="food_name"]').length;
		var foods = '';

		for (i = 0; i < size; i++) {
			var food = $('input:text[name="food_name"]').eq(i).attr("value");
			var count = $('input:text[name="count"]').eq(i).attr("value");
			alert(food + '는(은) ' + count + '개');
			console.log("i의 현재갯수 : " + i);
			if (i == 0) {
				foods = food + '/' + count;
			} else {
				foods = ' ' + food + '/' + count;
			}
			console.log(foods);
			$('.frm')
					.append(
							'<input type="text" name="diet_content" value="'+ foods +'">')
		}

		$('input:text[name="diet_title"]').val($('#diet_title1').val());
		$('input:text[name="trainer_id"]').val($('#trainer_id1').val());
		$('input:text[name="total_calorie"]').val(
				$('input:text[name="total_calorie1"]').val());

		$('.frm').submit();
	}

	function change(obj) {
		var total_foods = 0;

		var size = $('.frm1').find('div').length;
		for (i = 0; i < size; i++) {
			var calorie = $('.frm1').find('div')[i].children[1].value;
			var count = $('.frm1').find('div')[i].children[2].value;
			total_foods += (calorie * count);
			$('input:text[name="total_calorie1"]').val(total_foods);
		}
	}
</script>
<body>
	<div class="col-md-9 pr-30 padding-top-40">
		<div align="center">
			<h1>식단 추가하기</h1>

			<label>제목 :</label> <input type="text" id="diet_title1"><br>
			<label>작성자 :</label> <input type="text" id="trainer_id1"><br>
			<label>음식</label> 
			<div class="addFoodInput">
				<select id="foods">
					<option value="">선택</option>
					<c:forEach var="food" items="${foodList }">
						<option value="${food.calorie}">${food.food_name }</option>
					</c:forEach>
				</select> <input type="text" id="Foodcount"> 개
				<button type="button" class="btn btn-primary" class="addFood">+</button>
			</div>
			<hr>
			<div class="frm1">음식명</div>
			<label>총 칼로리 :</label> <input type="text" name="total_calorie1">
			<button type="button" class="btn btn-primary" onclick="Click()">등록</button>

			<form action="insertFood" method="post" class="frm">
				<input type="text" hidden="hidden" class="btn btn-primary"
					name="diet_title"><br> <input type="text"
					hidden="hidden" class="btn btn-primary" name="trainer_id"><br>
				<input type="text" hidden="hidden" class="btn btn-primary"
					name="total_calorie">
			</form>
			<div>
				<button type="button" class="btn btn-primary"
					onclick="location.href='getAppFoodList'">뒤로가기</button>
			</div>
		</div>
	</div>
</body>
<