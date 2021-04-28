<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	#counts {
		width: 70px;
	}
</style>
<script type="text/javascript">
//해당 음식과 갯수로 인한 칼로리 계산
	function TotalCalorie(a, b) {
		// 해당 음식의 1. 칼로리, 2. 갯수
		var food_calorie = a;
		var food_count = b;
		var result = a * b;		
		return result;
	}
	
	// + 클릭 시 하단의 div 태그에 음식, 수량 추가
	$(document).ready(function() {
		$('#addFood').click(function() {
			var selectFood = $('#foods option:selected').val();
			var count = $('#Foodcount').val();
			var selectFoodName = $('option:selected').text();
			
			console.log(selectFood + "-> selectFood");
			var calorie = $('input:text[name="total_calorie1"]').val();
			if( !selectFood || !count ) {
				alert('음식과 갯수를 선택하세요!');
			} else {
				console.log(calorie);
				if(calorie == '' || calorie == '0') {
					$('.frm1').append(
							'<div>' +
							'<input type="text" name="food_name" class="form-control" value="' 
							+ selectFoodName 
							+ '">' 
							+ '<input type="text" name="food_calorie" class="form-control" hidden="hidden" value="' 
							+ selectFood 
							+ '">' + '&nbsp;'
							+ '<input type="text" id="counts" name="count" class="form-control" onchange="change(this)" value="' 
							+ count 
							+ '">'
							+ '<button type="button" id="deleteFood" class="btn btn-outline-danger">-</button>'
							+ '</div>'
						);
					$('input:text[name="total_calorie1"]').val(TotalCalorie(selectFood, count));
				} else {
					console.log('dddd')
				var length = $('.frm1').find('div').length;
				for(i=0; i<length; i++) {
					console.log($('input:text[name="food_name"]')[i]);
					if($('input:text[name="food_name"]')[i].value == selectFoodName) {
						alert('선택하신 음식이 이미 존재합니다.');
						break;
					} else {
						if(i == length -1) {
							$('.frm1').append(
								'<div>' +
								'<input type="text" name="food_name" class="form-control"  value="' 
								+ selectFoodName 
								+ '">' 
								+ '<input type="text" name="food_calorie" class="form-control"  hidden="hidden" value="' 
								+ selectFood 
								+ '">' + '&nbsp;'
								+ '<input type="text" id="counts" class="form-control" name="count" onchange="change(this)" value="' 
								+ count 
								+ '">' + '&nbsp;'
								+ '<button type="button" id="deleteFood" class="btn btn-outline-danger">-</button>'
								+ '</div>'
							);
							
							var result = TotalCalorie(selectFood, count); 

								$('input:text[name="total_calorie1"]').val(parseInt(calorie) + parseInt(result));				
						}
					}
				}
				
			
				$('select').val('');
				$('#Foodcount').val('');
				}
			}
			
		});
	});
	
	// - 클릭시 해당 음식명, 갯수 input 태그가 삭제됨
	$(document).ready(function() {
		$(document).on('click', '#deleteFood', function() {
			var selectFood = $(this).siblings().eq(1).val(); // 칼로리
			var count = $(this).siblings().eq(2).val(); // 갯수
			
			var result = TotalCalorie(selectFood, count); // 칼로리 * 갯수
			var calorie = $('input:text[name="total_calorie1"]').val(); // 총 칼로리
			$('input:text[name="total_calorie1"]').val(parseInt(calorie) - parseInt(result));				
			
			$(this).closest('div').remove();
			
		});
	});
	
	
	// 등록 버튼 클릭시 해당 form 데이터를 가지고 recommended_diet 테이블에 저장한다.
	function Click(){
		//console.log($('.frm1').serialize());
		var size = $('input:text[name="food_name"]').length;
		var foods = '';
		
			for(i=0; i<size; i++) {
				var food = $('input:text[name="food_name"]').eq(i).attr("value");
				var count = $('input:text[name="count"]')[i].value;
				//alert(food + '는(은) ' + count + '개');
				if(i == 0) {
					foods = food + '/' + count;
				} else {
					foods = ' ' + food+ '/' + count;
				}
				//console.log(foods);
				$('.frm').append(
					'<input type="text" name="diet_content" value="'+ foods +'">'
				)	
			}
			
			$('input:text[name="diet_title"]').val($('#diet_title1').val());
			$('input:text[name="trainer_id"]').val($('#trainer_id1').val());
			$('input:text[name="total_calorie"]').val($('input:text[name="total_calorie1"]').val());
			$('input:text[name="diet_no"]').val($('#diet_no1').val());
			
			$('.frm').submit();
	}
	
	function change(obj) {
		var total_foods = 0;
		var size = $('.frm1').find('div').length;
		for(i=0; i<size; i++) {
		 	var count = $('.frm1').find('div')[i].children[2].value;
	     	var calorie = $('.frm1').find('div')[i].children[1].value;
			total_foods += (calorie * count);			
			$('input:text[name="count"]')[i].value=count;
		}
			$('input:text[name="total_calorie1"]').val(total_foods);
	}

</script>
<div>

	<h1>식단 수정하기</h1> 
	<label for="inputEmail4">식단번호</label>
	<input type="text" id="diet_no1" value="${vo.diet_no}" class="form-control"><br>
	<label for="inputEmail4">제목</label>
	<input type="text" id="diet_title1" value="${vo.diet_title}" class="form-control"><br>
	<label for="inputEmail4">작성자</label>
	<input type="text" id="trainer_id1" value="${vo.trainer_id}" class="form-control"><br>
	<label for="inputEmail4">음식</label>
	
	<form class="form-inline">
		<div class="addFoodInput">
			<select id="foods" class="form-control">
				<option value="">선택</option>
				<c:forEach var="food" items="${foodList }">
					<option value="${food.calorie}">${food.food_name }</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<input type="text" id="Foodcount" class="form-control" placeholder="갯수를 입력하세요">
		</div>
		<div>
		<button type="button" id="addFood" class="btn btn-outline-info">+</button>
		</div>
		</form>
	<hr>
	<label for="inputEmail4">음식명</label>
	<form class="form-inline">
	<div class="frm1">
		<c:forEach var="content" items="${arr}">
			<div>
				<input type="text" value="${content.food_name }" name="food_name" class="form-control">
					<c:forEach var="food" items="${list }">
						<c:if test="${food.food_name eq content.food_name}">
							<input type="text" value="${food.calorie }" name="food_calorie" hidden="hidden" class="form-control">
						</c:if>
					</c:forEach>
				<input type="text" value="${content.food_cnt }" id="counts" name="count" onchange="change(this)" class="form-control">
				<button type="button" id="deleteFood" class="btn btn-outline-danger">-</button>
			</div>
		</c:forEach>
	</div> 
	</form>
	<br>
		<label for="inputEmail4">총칼로리</label>
		<input type="text" name="total_calorie1" value="${vo.total_calorie}" class="form-control">
		<br>
		<button type="button" onclick="Click()" class="btn btn-outline-primary">등록</button>
		<button type="button" onclick="location.href='getAppFoodList'" class="btn btn-outline-secondary">뒤로가기</button>
	
	</div>
		
		<form action="updateFood" method="post" class="frm">
			<input type="text" name="diet_title" hidden="hidden"><br>
			<input type="text" name="trainer_id" hidden="hidden"><br>
			<input type="text" name="total_calorie" hidden="hidden"><br>
			<input type="text" name="diet_no" hidden="hidden">
		</form>
