<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">


<div>
	<h1>ȸ���� �Ĵ�</h1>
	<div>
		<c:if test="${food.real_diet_no eq null}">
			<button type="button" class="insertForm">�ۼ��ϱ�</button>
		</c:if>
	</div>
	<br>
	<div>
		<input type="text" name="id" value="${user.id }" hidden="hidden">
		<table border="1">
			<tr>

				<td>�̸�</td>
				<td>${user.name }<input name="name" value="${user.name }" hidden="hidden">
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${user.age }</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${user.gender }</td>
			</tr>
			<tr>
				<td>Ű</td>
				<td>${user.height }</td>
			</tr>
			<tr>
				<td>������</td>
				<td>${user.weight }<input type="text" hidden="hidden"
					name="weight" value="${user.weight }">
				</td>
			</tr>
			<tr>
				<td colspan="3" style="width: 200px;"><textarea>Ư�̻���</textarea>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<div>
		
		<c:if test="${food.real_diet_no ne null}">
			�Ĵ� ��ȣ : <input type="text" value="${food.real_diet_no }" id="real_diet_no1">
			<div>
				<div class="food_contents">${food.diet_content }</div>
				<div class="contentBtn">
					<button type="button" class="contentUpd">����</button>
					<button type="button" class="contentDel">����</button>
				</div>
			</div>
		</c:if>
		<hr>
		
		<div class="comments">
			<c:forEach items="${comment }" var="comm">
				<div>
					<input type="text" value="${comm.diet_comment }" name="comment_upd" readonly="readonly"> 
					<textarea class="hide_comment" style="display: none;">${comm.diet_comment }</textarea>
					<input type="text" value="${comm.comment_no }" name="comment_no" hidden="hidden">
					<a href="#" class="updateComment">[����]</a>
					<a href="#" class="updateComment2" style="display: none;">[����]</a>
					<a href="#" class="deleteComment">[����]</a><br><br>
				</div>
			</c:forEach>
		</div>	
<hr>
		<div>
			<h6>��� �����</h6>
			<input type="text" name="diet_comment">
			<button type="button" onclick="comment()">��� �����</button>
		</div>
		<hr>
		<div>
		<c:choose>
			<c:when test="${food.calorie ne null }">
				<input type="text" value="${food.calorie }" readonly="readonly" name="calorie_total">
			</c:when>
			<c:otherwise>
				<input type="text" value="0" readonly="readonly">
			</c:otherwise>
		</c:choose>
			<button type="button" id="calorieBtn">Į�θ� ���</button>
		</div>

	</div>
</div>
<div>
	<button type="button" onclick="before()"><</button>
	
	<input type="text" name="dates" value="${oneDay[0].sysdate}">
	<button type="button" onclick="after()">></button>
</div>
<div id="columnchart_material" style="width: 500px; height: 500px;"></div>
<div>${food.take_date }</div>

<!-- �Ĵ� �ۼ��ϱ� Modal start -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">�Ĵ� �ۼ��ϱ�</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<!-- 		<form action="insertImg" method="post"> -->
				<form id="frm" method="post">
					<textarea name="diet_content" id="summernote"></textarea>
					<input name="real_diet_no" value="${food.real_diet_no }"
						hidden="hidden"><br>
				</form>
				<!-- 		</form> -->

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="foodInsert()">����</button>
				<button class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal end -->

<!-- �Ĵ� �����ϱ� Modal -->
<div class="modal fade" id="exampleModal3" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">�Ĵ� �����ϱ�</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
	
				<form id="frm2" method="post">
					<textarea name="diet_content" id="summernote_upd"></textarea>
					<input name="real_diet_no2" value="${food.real_diet_no }"
						hidden="hidden"><br>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="foodUpdate()">����</button>
				<button class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal end -->

<!-- Calorie Modal start -->
<div class="modal fade" id="exampleModal2" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Į�θ� ����ϱ�</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">


				���� :
				<div class="addFoodInput">
					<select id="foods">
						<option value="">����</option>
						<c:forEach var="food" items="${foodList }">
							<option value="${food.calorie}">${food.food_name }</option>
						</c:forEach>
					</select> <input type="text" id="Foodcount" value="1" readonly="readonly">��
				</div>
				<button type="button" class="addFood">+</button>
				<hr>
				<div class="frm1">���ĸ� :
				<c:forEach items="${oneDay }" var="list">
					<c:if test="${list.real_diet_no eq food.real_diet_no}">
						<c:forEach items="${detail }" var="detail">
							<div>
								<input type="text" name="detail_food" value="${detail.detail_food}">
								<input type="text" name="detail_count" onchange="change(this)" value="${detail.detail_count}">
								<input type="text" name="detail_calorie" value="${detail.detail_calorie}">��
								<button type="button" class="deleteFood">-</button><br>
							</div>					
						</c:forEach>
					</c:if>
				</c:forEach>
				</div>
				�� Į�θ� : <input type="text" name="total_calorie1" value="${food.calorie }"> <br>

				<form action="updateCalorie" method="post" class="frm">
					<input type="text" name="total_calorie" hidden="hidden">
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="Click()">����</button>
				<button class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal end -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
			
			if(selectFoodName != $('input:text[name="food_name"]').val()) {
			
			$('.frm1').append(
				'<div class="foods">' +
				'<input type="text" name="food_name" value="' 
				+ selectFoodName 
				+ '">' 
				+ '<input type="text" name="food_calorie" hidden="hidden" value="' 
				+ selectFood 
				+ '">' 
				+ '<input type="text" name="count" onchange="change(this)" value="' 
				+ count 
				+ '">' 
				+ '��'
				+ '<button type="button" class="deleteFood">-</button>'
				+ '</div>'
			);
			} else {
				alert('������ ������ �̹� �����մϴ�.');
			}
			var calorie = $('input:text[name="total_calorie1"]').val();
			
			console.log(calorie + ', ' + result);
			if( !calorie ) {
				$('input:text[name="total_calorie1"]').val(parseInt(result));
			} else {
				$('input:text[name="total_calorie1"]').val(parseInt(calorie) + parseInt(result));				
			}
				$('select').val('');
				$('#Foodcount').val('1');
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
	
	
	// ��� ��ư Ŭ���� �� Į�θ��� �����Ѵ�
	function Click(){
		var food = $('.foods');
		var foods = '';
		for(i=0; i<food.length; i++) {
			foods += food[i].children[0].value + ',' + food[i].children[1].value + ',' + food[i].children[2].value;
			if(i < food.length-1) {				
			foods += '/';
			}
		}
		
		console.log(foods);
		 $.ajax({
			url: 'updateCalorie',
			data: { real_diet_no : $('input:text[name="real_diet_no"]').val(),
					total_calorie : $('input:text[name="total_calorie1"]').val(),
					detail_content : foods
			},
			dataType: 'json',
			type: 'post',
			success: function() {
				alert('SUCCESS!');
				$('#exampleModal2').hide();
				location.reload();
			},
			error: function() {
				alert('ERROR!');
			}
		});
	}

	
	// ���� ���� input �±��� ���� ������ �� �߻��ϴ� �̺�Ʈ
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


	// �Ĵ� ���� �ۼ��ϱ� ��(Modal)
	$(document).ready(function() {
		$(document).on('click', '.insertForm', function(e) {
			e.preventDefault();
			$('#exampleModal').modal("show");
			$('input:text[name="user_id"]').val($('#id').val());
		});
	});
	
	// �Ĵ� ���� �����ϱ� ��(Modal)
	$(document).ready(function() {
		$(document).on('click', '.contentUpd', function(e) {
			e.preventDefault();
			$('#exampleModal3').modal("show");
			$('.note-editable').html($('.food_contents').html());
		});
	});

	google.charts.load('visualization','1', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var weight = $('input:text[name="weight"]').val(); // = ������
		var result = weight * 12 * 1.5;
		var arr =[]; 
		arr.push( ['���볯¥', '�������뷮', '���差']);
	
		    arr.push(['${food.take_date}', parseInt(${food.calorie }), result]);
		
	  var data = google.visualization.arrayToDataTable(arr);
	
	  var options = {
			  width : '300',
	          vAxis: { viewWindow: { max: 3000 } },
	          seriesType: 'bars' };
	
	  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
	
	  chart.draw(data, options);
	}
	
	var cnt = 0;
	
	function before() {
		cnt += (-1);
		$.ajax({
			url: 'getDay',
			data : { id : $('input:text[name="id"]').val(),
			    	cnt : cnt 	    	
			},
			dataType: 'json',
			type: 'get',
			success: function drawChart(result) {
				
				var today = result[0].take_date;
				var calorie = result[0].calorie;
				  $('.food_contents').html(result[0].diet_content);
				  $('input:text[name="calorie_total"]').val(calorie);
				  //$('.comments').empty();
				  
				  console.log(result[0].real_diet_no + "======result �迭");
				  
				  // ��� ������ ������
				if(result[0].diet_content != null) {
					
				 var real_diet_no = result[0].real_diet_no;
				 console.log(result[0].diet_content + "-- ������ ���� ����ddd" + real_diet_no);
				$.ajax({
					url:'getComment',
					data:{real_diet_no : real_diet_no},
					dataType: 'json',
					type: 'get',
					success : function(response) {
				  
					  $('.comments').empty();
					  for(i=0; i<response.length; i++) {
						  $('.comments').append(
							  '<div>'
							  + '<input type="text" value="' + response[i].diet_comment + '" name="comment_upd" readonly="readonly">'
							  + '<textarea class="hide_comment" style="display: none;">' + response[i].diet_comment + '</textarea>'
							  + '<input type="text" value="' + response[i].comment_no + '" name="comment_no" hidden="hidden">'
							  + '<a href="#" class="updateComment">[����]</a>'
							  + '<a href="#" class="updateComment2" style="display: none;">[����]</a>'
							  + '<a href="#" class="deleteComment">[����]</a><br><br>'
							  + '</div>'
						  );
					  }
					  
				  },
					error: function() {
						alert('ERROR');
				  }
				}); // �����ȸ ���۽�
				
				  }
				 // �ο� ��ü�� ���ٸ�(=����� ������)
				if(result[0].age == '0') {
					$.ajax({
						url : 'currentDay',
						data : {cnt : cnt},
						dataType: 'json',
						success: function(e) {
							console.log(e.sysdate);
							$('input:text[name=dates]').val(e.sysdate);
							$('#real_diet_no1').val('');
							
							console.log($('.contentBtn').children().hide());
							$('.contentBtn').children().hide()
							
							var weight = $('input:text[name="weight"]').val(); // = ������
							var total = weight * 12 * 1.5;
							var arr =[]; 
							arr.push( ['���볯¥', '�������뷮', '���差']);
						
							    arr.push(['', 0, total]);
							
							  var data = google.visualization.arrayToDataTable(arr);
							
							  var options = {
									  width : '300',
							          vAxis: { viewWindow: { max: 3000 } },
							          seriesType: 'bars' };
							
							  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
							
							  chart.draw(data, options);
							
						}
					});
			  
				// �ο� ���� �ִٸ�
				} else {
					$('.contentBtn').children().show()
					$('input:text[name="calorie_total"]').val(calorie);
					$('input:text[name=dates]').val(today);
					$('#real_diet_no1').val(result[0].real_diet_no);
					
					var weight = $('input:text[name="weight"]').val(); // = ������
					var total = weight * 12 * 1.5;
					var arr =[]; 
					arr.push( ['���볯¥', '�������뷮', '���差']);
				
					arr.push([today, parseInt(calorie), total]);
					
					  var data = google.visualization.arrayToDataTable(arr);
					
					  var options = {
							  width : '300',
					          vAxis: { viewWindow: { max: 3000 } },
					          seriesType: 'bars' };
					
					  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
					
					  chart.draw(data, options);
				}
					
					 
			} // ���۽� success
		});
	}
	
	function after() {
	cnt += 1;
	$.ajax({
		url: 'getDay',
		data : { id : $('input:text[name="id"]').val(),
		    	cnt : cnt 	    	
		},
		dataType: 'json',
		type: 'get',
		success: function drawChart(result) {
			
			var today = result[0].take_date;
			var calorie = result[0].calorie;
			  $('.food_contents').html(result[0].diet_content);
			  $('input:text[name="calorie_total"]').val(calorie);
			  //$('.comments').empty();
			  
			  console.log(result[0].real_diet_no + "======result �迭");
			  
			  // ��� ������ ������
			if(result[0].diet_content != null) {
				
			 console.log(result[0].diet_content + "-- ������ ���� ����" + result[0].real_diet_no);
			$.ajax({
				url: 'getComment',
				data: {real_diet_no : result[0].real_diet_no},
				dataType: 'json',
				success : function(response) {
					console.log(response.length + "=====��� ��ȸ ���۽� ���ϰ�z");
			  
				  $('.comments').empty();
				  for(i=0; i<response.length; i++) {
					  console.log(response + "ooooooooooo");
					  $('.comments').append(
						  '<div>'
						  + '<input type="text" value="' + response[i].diet_comment + '" name="comment_upd" readonly="readonly">'
						  + '<textarea class="hide_comment" style="display: none;">' + response[i].diet_comment + '</textarea>'
						  + '<input type="text" value="' + response[i].comment_no + '" name="comment_no" hidden="hidden">'
						  + '<a href="#" class="updateComment">[����]</a>'
						  + '<a href="#" class="updateComment2" style="display: none;">[����]</a>'
						  + '<a href="#" class="deleteComment">[����]</a><br><br>'
						  + '</div>'
					  );
				  }
				  
			  },
				error: function() {
					alert('ERROR');
			  }
			}); // �����ȸ ���۽�
			
			  }
			 // �ο� ��ü�� ���ٸ�(=����� ������)
			if(result[0].age == '0') {
				$.ajax({
					url : 'currentDay',
					data : {cnt : cnt},
					dataType: 'json',
					success: function(e) {
						console.log(e.sysdate);
						$('input:text[name=dates]').val(e.sysdate);
						$('#real_diet_no1').val('');
						
						console.log($('.contentBtn').children().hide());
						$('.contentBtn').children().hide()
						
						var weight = $('input:text[name="weight"]').val(); // = ������
						var total = weight * 12 * 1.5;
						var arr =[]; 
						arr.push( ['���볯¥', '�������뷮', '���差']);
					
						    arr.push(['', 0, total]);
						
						  var data = google.visualization.arrayToDataTable(arr);
						
						  var options = {
								  width : '300',
						          vAxis: { viewWindow: { max: 3000 } },
						          seriesType: 'bars' };
						
						  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
						
						  chart.draw(data, options);
						
					}
				});
		  
			// �ο� ���� ������ ����� ���ٸ�
			} else {
				$('.contentBtn').children().show()
				$('input:text[name="calorie_total"]').val(calorie);
				$('input:text[name=dates]').val(today);
				$('#real_diet_no1').val(result[0].real_diet_no);
				$('.comments').empty();
				var weight = $('input:text[name="weight"]').val(); // = ������
				var total = weight * 12 * 1.5;
				var arr =[]; 
				arr.push( ['���볯¥', '�������뷮', '���差']);
			
				arr.push([today, parseInt(calorie), total]);
				
				  var data = google.visualization.arrayToDataTable(arr);
				
				  var options = {
						  width : '300',
				          vAxis: { viewWindow: { max: 3000 } },
				          seriesType: 'bars' };
				
				  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
				
				  chart.draw(data, options);
			}
				
				 
		} // ���۽� success
	});
}
	
	// ��� ���
	function comment() {
		$.ajax({
			url : 'addComment',
			data: { real_diet_no: $('#real_diet_no1').val(),
					diet_comment : $('input:text[name="diet_comment"]').val()
			},
			dataType: 'json',
			type: 'post',
			success: function(response) {
				console.log(response.diet_comment);
				alert('����!');
			
			
				$('.comments').append(
					'<input type="text" name="comment_upd" value="'+ response.diet_comment +'">'
					+ '<textarea class="hide_comment" style="display: none;">' + response.diet_comment + '</textarea>'
					+ '<a href="#" class="updateComment">[����]</a>'
					+ '<a href="#" class="updateComment2" style="display: none;">[����]</a>'
					+ '<a href="#" class="deleteComment">[����]</a>'
				);
				
				$('input:text[name="diet_comment"]').val('');
			},
			error : function() {
				alert('Error!');
			}
			
		});
	}
	
	// ��� ����
	$(document).ready(function() {
		$(document).on('click', '.updateComment', function(e) {/* 
			console.log($(this).closest('div').children('input').eq(0));
				console.log($(this).closest('div').children('input').eq(0));	 */	
				console.log($(this).closest('div').children('input').val() + "====> �ش� input ��")
				$(this).closest('div').children('input').hide();
				console.log($(this).closest('div').children('a.updateComment').hide() + "======");
				$(this).closest('div').children('a.updateComment').hide();
				$(this).closest('div').children('a.updateComment2').show();
				$(this).closest('div').children('textarea').show();

		});
	});
	
	$(document).ready(function() {
		$(document).on('click', '.updateComment2', function(e) {
			
			if(confirm('�����Ͻðڽ��ϱ�?')) {
				
			$.ajax({
				url: 'updateComment',
				data: { comment_no : $(this).closest('div').children('input')[1].value,
						diet_comment : $(this).closest('div').children('textarea').val()
				},
				dataType: 'json',
				type: 'post',
				success : function() {
					alert('����');
					location.reload();
				},
				error: function() {
					alert('ERROR!');
					}
				});
			} else {
				alret('���');
			}
		})
	})
	
	// ��� ����
	$(document).ready(function() {
		$(document).on('click', '.deleteComment', function(e) {
			if(confirm('�����Ͻðڽ��ϱ�?')) {
				
			 $.ajax({
				url: 'deleteComment',
				data: { comment_no : $(this).closest('div').children('input')[1].value }, // no , comment
				dataType: 'json',
				type: 'post',
				success : function() {
					alert('����');
					location.reload();
				},
				error: function() {
					alert('ERROR!');
				}
			});
			} else {
				alert('���!');
			}
		});
	});
	

	
	// �Ĵ� �����ϱ�
 	function foodInsert(){
		console.log($('input:text[name="dates"]').val());
		$.ajax({
			url : 'insertImg',
			type: 'post',
			data: {diet_content : $("textarea#summernote").val(),
				id : $('input:text[name="id"]').val(),
				take_date : $('input:text[name="dates"]').val()
			},
			dataType : 'json',
			success : function(response) {
				$('.food_contents').val(response.diet_content);
				alert('SUCCESS!');
				$('#exampleModal').modal('hide');
				location.reload();
			},
			error: function() {
				alert('ERROR!');
			} 
		});
	}
	
	// �Ĵ� �����ϱ�
	function foodUpdate(e) {
		$.ajax({
			url : 'foodUpdate',
			type: 'post',
			data: {diet_content : $("textarea#summernote_upd").val(),
				real_diet_no : $('#real_diet_no1').val()
			},
			dataType : 'json',
			success : function(response) {
				console.log(response + "------------------->");
				
				alert('SUCCESS!');
				$('#exampleModal3').modal('hide');
				location.reload();
				
			},
			error: function() {
				alert('ERROR!');
			} 
		});
	}
	
	// �Ĵ� �����ϱ�
	$(document).ready(function() {
		$(document).on('click', '.contentDel', function() {
			if(!window.confirm('���� �����Ͻðڽ��ϱ�?')) {
				alert('���');
			} else {
				$.ajax({
					url: 'foodDel',
					data: {real_diet_no : $('#real_diet_no1').val()},
					dataType: 'json',
					success: function() {
						alert('������ �Ϸ�Ǿ����ϴ�.');
						location.reload();
					},
					error: function() {
						alert('ERROR!');
					}
				});
			}
		});
	});
	
	// Į�θ� ����ϱ� ��(Modal)
	$(document).ready(function() {
		$(document).on('click', '#calorieBtn', function(e) {
			e.preventDefault();
			$('#exampleModal2').modal("show");
		});
	});
	 	 
</script>
<!-- summer note -->
<script>
$(document).ready(function() {
	      $('#summernote').summernote({
	    	  callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				},
	        placeholder: 'Hello stand alone ui',
	        tabsize: 2,
	        height: 500,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', [ 'picture']],
	          ['view', [ 'codeview']]
	        ]
	      });
	      
	     

	    	function sendFile(file, el) {
	    		var form_data = new FormData();
	    		form_data.append('file', file);
	    		$.ajax({
	    			data : form_data,
	    			type : "POST",
	    			url : "/spring/files/upload",
	    			cache : false,
	    			contentType : false,
	    			enctype : 'multipart/form-data',
	    			processData : false,
	    			success : function(img_name) {
	    				$('#summernote').summernote('editor.insertImage', img_name);
	    			}
	    		});
	    	}
}) 

	$(document).ready(function() {
	      $('#summernote_upd').summernote({
	    	  callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				},
	        tabsize: 2,
	        height: 500,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', [ 'picture']],
	          ['view', [ 'codeview']]
	        ]
	      });
	      
	     

	    	function sendFile(file, el) {
	    		var form_data = new FormData();
	    		form_data.append('file', file);
	    		$.ajax({
	    			data : form_data,
	    			type : "POST",
	    			url : "/spring/files/upload",
	    			cache : false,
	    			contentType : false,
	    			enctype : 'multipart/form-data',
	    			processData : false,
	    			success : function(img_name) {
	    				$('#summernote_upd').summernote('editor.insertImage', img_name);
	    			}
	    		});
	    	}
}) 
	    </script>

	   