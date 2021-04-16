<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
//�ش� ���İ� ������ ���� Į�θ� ���
	function TotalCalorie(a, b) {
		// �ش� ������ 1. Į�θ�, 2. ����
		var food_calorie = a;
		var food_count = b;
		var result = a * b;		
		return result;
	}
	
	// + Ŭ�� �� �ϴ��� div �±׿� ����, ���� �߰�
	$(document).ready(function() {
		$('.addFood').click(function() {
			var selectFood = $('#foods option:selected').val();
			var count = $('#Foodcount').val();
			var selectFoodName = $('option:selected').text();
			
			console.log(selectFood + "-> selectFood");
			
			if( !selectFood || !count ) {
				alert('���İ� ������ �����ϼ���!');
			} else {
			
			var food_calorie = $('#foods option:selected').val();
			
			var result = TotalCalorie(food_calorie, count); 
			
			$('.frm1').append(
				'<div>' +
				'<input type="text" name="food_name" value="' + selectFoodName + '">' + '<input type="text" name="food_calorie" hidden="hidden" value="' + selectFood + '">' +
				'<input type="text" name="count" onchange="change(this)" value="' + count + '">' +
				'��'	 + '<button type="button" class="deleteFood">-</button>'
				+ '</div>'
			);
			
			var calorie = $('input:text[name="total_calorie1"]').val();
			
			console.log(calorie + ', ' + result);
			if( !calorie ) {
				$('input:text[name="total_calorie1"]').val(parseInt(result));
			} else {
				$('input:text[name="total_calorie1"]').val(parseInt(calorie) + parseInt(result));				
			}
			
				$('select').val('');
				$('#Foodcount').val('');
			}
			
		});
	});
	
	// - Ŭ���� �ش� ���ĸ�, ���� input �±װ� ������
	$(document).ready(function() {
		$(document).on('click', '.deleteFood', function() {
			var selectFood = $(this).siblings().eq(1).val(); // Į�θ�
			var count = $(this).siblings().eq(2).val(); // ����
			
			var result = TotalCalorie(selectFood, count); // Į�θ� * ����
			var calorie = $('input:text[name="total_calorie1"]').val(); // �� Į�θ�
			$('input:text[name="total_calorie1"]').val(parseInt(calorie) - parseInt(result));				
			
			$(this).closest('div').remove();
			
		});
	});
	
	
	// ��� ��ư Ŭ���� �ش� form �����͸� ������ recommended_diet ���̺� �����Ѵ�.
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
			$('input:text[name="total_calorie"]').val($('input:text[name="total_calorie1"]').val());
			$('input:text[name="diet_no"]').val($('#diet_no1').val());
			
			$('.frm').submit();
	}
	
	function change(obj) {
		var total_foods = 0; 
		
		var size = $('.frm1').find('div').length;
		for(i=0; i<size; i++) {
			var calorie = $('.frm1').find('div')[i].children[1].value;
			var count = $('.frm1').find('div')[i].children[2].value;
			total_foods += (calorie * count);
			$('input:text[name="total_calorie1"]').val(total_foods);
		}
	}

</script>
<div>

	<h1>�Ĵ� �����ϱ�</h1> 
	�Ĵ� ��ȣ : <input type="text" id="diet_no1" value="${vo.diet_no}">
	���� : <input type="text" id="diet_title1" value="${vo.diet_title}"><br>
	�ۼ��� : <input type="text" id="trainer_id1" value="${vo.trainer_id}"><br>
	���� : <div class="addFoodInput">
			<select id="foods">
				<option value="">����</option>
				<c:forEach var="food" items="${list }">
					<option value="${food.calorie}">${food.food_name }</option>
				</c:forEach>
			</select>
			<input type="text" id="Foodcount"> ��
		 </div>
		<button type="button" class="addFood">+</button>
	<hr>
	<div class="frm1">
	���ĸ� : 
		<c:forEach var="content" items="${arr}">
			<div>
				<input type="text" value="${content.food_name }" name="food_name">
				<input type="text" value="${content.food_cnt }" name="count" onchange="change(this)">��
					<c:forEach var="food" items="${list }">
					<c:if test="${food.food_name eq content.food_name}">
						<input type="text" value="${food.calorie }" name="food_calorie">
					</c:if>
					</c:forEach>
				<button type="button" class="deleteFood">-</button>
			</div>
		</c:forEach>
	</div>
		�� Į�θ� : <input type="text" name="total_calorie1" value="${vo.total_calorie}">
		<br>
		<button type="button" onclick="Click()">���</button>
		
		<form action="updateFood" method="post" class="frm">
			<input type="text" name="diet_title"><br>
			<input type="text" name="trainer_id"><br>
			<input type="text" name="total_calorie"><br>
			<input type="text" name="diet_no">
		</form>
	<div>
		<button type="button" onclick="location.href='getAppFoodList'">�ڷΰ���</button>
	</div>
</div>