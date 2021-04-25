<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
	h1 {
		margin-top: 5%;
	}
	
	#counts {
		width: 70px;
	}
	
</style>
<script type="text/javascript">
	
	
	// �ش� ���İ� ������ ���� Į�θ� ���
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
			
			var calorie = $('input:text[name="total_calorie1"]').val();
			if( !selectFood || !count ) {
				alert('���İ� ������ �����ϼ���!');
			} else {
				console.log(calorie);
				if(calorie == '' || calorie == '0') {
					$('.frm1').append(
							'<div>' +
							'<input type="text" class="form-control" name="food_name" value="' 
							+ selectFoodName 
							+ '">' 
							+ '<input type="text" class="form-control" name="food_calorie" hidden="hidden" value="' 
							+ selectFood 
							+ '">' 
							+ '<input type="text" id="counts" class="form-control" name="count" onchange="change(this)" value="' 
							+ count 
							+ '">'
							+ '<button type="button" id="deleteFood" class="btn btn-outline-danger">-</button>'
							+ '</div>'
						);
					$('input:text[name="total_calorie1"]').val(TotalCalorie(selectFood, count));
				} else {
				var length = $('.frm1').find('div').length;
				for(i=0; i<length; i++) {
					console.log($('input:text[name="food_name"]')[i]);
					if($('input:text[name="food_name"]')[i].value == selectFoodName) {
						alert('�����Ͻ� ������ �̹� �����մϴ�.');
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
								+ '">' 
								+ '<input type="text" id="counts" name="count" class="form-control" onchange="change(this)" value="' 
								+ count 
								+ '">'
								+ '<button type="button" id="deleteFood" class="btn btn-outline-danger">-</button>'
								+ '</div>'
							);
							
							var result = TotalCalorie(selectFood, count); 

								$('input:text[name="total_calorie1"]').val(parseInt(calorie) + parseInt(result));				
						}
					}
				}
				
				}
			}
			$('select').val('');
			$('#Foodcount').val('');
			
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
		//console.log($('.frm1').serialize());
		var size = $('input:text[name="food_name"]').length;
		var foods = '';
		
			for(i=0; i<size; i++) {
				var food = $('input:text[name="food_name"]').eq(i).attr("value");
				var count = $('input:text[name="count"]')[i].value;
				//alert(food + '��(��) ' + count + '��');
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
			
			$('.frm').submit();
	}
	
	function change(obj) {
		var total_foods = 0;
		var size = $('.frm1').find('div').length;
		for(i=0; i<size; i++) {
		 	var calorie = $('.frm1').find('div')[i].children[1].value;
	     	var count = $('.frm1').find('div')[i].children[2].value;
			total_foods += (calorie * count);			
			$('input:text[name="count"]')[i].value=count;
		}
			$('input:text[name="total_calorie1"]').val(total_foods);
	}
	
</script>
<div>

	<h1>�Ĵ� �߰��ϱ�</h1>
	<br><br>
	<label for="inputEmail4">����</label><input type="text" id="diet_title1" class="form-control"><br>
	<label for="inputEmail4">�ۼ���</label>
	<input type="text" id="trainer_id1" class="form-control"><br>
	<label for="inputEmail4">����</label>
		<form class="form-inline">
		<div class="addFoodInput">
			<select id="foods" class="form-control">
				<option value="">����</option>
				<c:forEach var="food" items="${foodList }">
					<option value="${food.calorie}">${food.food_name }</option>
				</c:forEach>
			</select>
			<input type="text" id="Foodcount" class="form-control"  placeholder="������ �Է��ϼ���">
		</div>
		<button type="button" id="addFood" class="btn btn-outline-info">+</button>
		</form>
	<hr>
	<label for="inputEmail4">���ĸ�</label>
	<form class="form-inline">
	<div class="frm1">
	</div> 
	</form>
 	<hr>
		<label for="inputEmail4">�� Į�θ�</label>
		<input type="text" name="total_calorie1" class="form-control">
		<br>
		<br>
		<button type="button" onclick="Click()" class="btn btn-outline-primary">���</button>&nbsp;
		<button type="button" onclick="location.href='getAppFoodList'" class="btn btn-outline-secondary">�ڷΰ���</button>
		
		<form action="insertFood" method="post" class="frm">
			<input type="text" hidden="hidden" name="diet_title"><br>
			<input type="text" hidden="hidden" name="trainer_id"><br>
			<input type="text" hidden="hidden" name="total_calorie"><br>
			
		</form>
</div>