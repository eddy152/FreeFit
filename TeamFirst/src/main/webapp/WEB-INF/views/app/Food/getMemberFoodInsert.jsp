<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style type="text/css">

	
	#buttons {
		float: right;	}
		
	#columnchart_material {
		float: left;
	}
	
	.form-control {
		width: 200px;
	}
	
	div.each_food > input {
		width: 100px;
	}
	
	.cent {
 		margin: 45px;
 	}
 	
 	.cent2 {
 		margin: auto;
 	}
 	
 	.cent-contents {
 		margin: auto;
 	}
 	.form-cent2 {
 	 	margin-left: 0px;
 	}
 	
 	.form-cent3 {
 		margin: auto;
 	}
 	
 	.insertBtn {
 		margin-right: 0px;
 		margin-top: 30px;
 	}
 	
 	#input-comment {
 	  padding: 5px 5px;
	  border: 3px solid #ccc;
	  transition: 0.5s;
	  outline: none;
 	}
 	
 	#input-comment:focus {
 		border: 3px solid #555;
 	}
 	
 	#com_btn {
 		border-radius: 4px;
 		background-color: #f44336;
 		color : white;
 		border: 0px;
 		padding: 5px;
 	}
 	
 	.cent3 {
 		margin: 75px;
 	}
 	
 	.comments {
 		margin-left: 50px;
 	}
 	
 	p {
 		margin: 0px;
 	}
</style>


<div class="cent2">
	<h1>${user.id } ȸ������ �Ĵ�</h1>
	<input type="text" name="role_exist" hidden="hidden" value="${member.role_name }">
</div>

<div class="insertBtn">
<div class="insertFood" <c:if test="${food.diet_content ne null }"> style="display: none;"</c:if> >
		<button id="insertForm" type="button" class="btn btn-outline-info">�ۼ��ϱ�</button>
</div>
</div>

	
	<br>
	<div class="row">
		<input type="text" name="id" value="${user.id }" hidden="hidden">
	</div>
	<div>
		<table style="display: none;">
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
				<td>${user.height }
					<input type="text" hidden="hidden"
					name="height" value="${user.height }">
				</td>
			</tr>
			<tr>
				<td>������</td>
				<td>${user.weight }<input type="text" hidden="hidden"
					name="weight" value="${user.weight }">
				</td>
			</tr>
		</table>
	</div>
	<br>
	<div class="row" style="display: none;">
	<p class="form-control border-0">�Ĵܹ�ȣ</p>
	<input type="text" value="${food.real_diet_no }" id="real_diet_no1" class="form-control border-0">
	</div>
	<div class="form-cent2">
	<c:if test="${food.real_diet_no ne null}">
			<button type="button" id="contentUpd" class="btn btn-primary">����</button>
			<button type="button" id="contentDel" class="btn btn-danger">����</button>
	</c:if>
	</div>
	<div class="form-cent3">
			<div class="cent-contents">
				<div class="food_contents">${food.diet_content }</div>
	</div>
</div>
	
<br>
<div class="cent">
<form class="form-inline">
		<button type="button" onclick="before()" class="btn btn-light"><</button>&nbsp;
		<div class="form-group mx-sm-3 mb-2">
		<input type="text" name="dates" value="${oneDay.sysdate}" class="form-control">
		</div>&nbsp;
		<button type="button" onclick="after()" class="btn btn-light">></button>
</form>
</div>
<br>
<div>
	<div id="columnchart_material"></div>
	
</div>
<div class="cent3">
		<div class="row">
		<c:choose>
			<c:when test="${food.calorie ne null }">
				<input type="text" value="${food.calorie }" class="form-control" readonly="readonly" name="calorie_total">
			</c:when>
			<c:otherwise>
				<input type="text" value="0" class="form-control" readonly="readonly">
			</c:otherwise>
		</c:choose>
			<button type="button" id="calorieBtn" class="btn btn-outline-primary">���</button>
		</div>
</div>	

<p>���</p>
<hr style="border:1px color:gray; height: !important; display: block !important; width: 100% !important;"/>
<c:if test="${member.role_name ne 'ROLE_USER'}">
	<div>
		<div class="comments">
			<c:forEach items="${comment }" var="comm">
				<div class="form-inline">
					<input type="text" class="border-0" value="${comm.diet_comment }" name="comment_upd" readonly="readonly" style="width: 200px;">
					<input style="display: none;" value="${comm.diet_comment }" class="hide_comment">
					<input type="text" value="${comm.comment_no }" name="comment_no" hidden="hidden">
					<button id="updateComment" class="userCantSeeBtn">����</button>
					<button id="updateComment2" style="display: none;" class="userCantSeeBtn">����</button>
					<button id="deleteComment" class="userCantSeeBtn">����</button><hr><br>
				</div>
			</c:forEach>
		</div>	
	</div>
</c:if>

<div class="user_comments">
<c:choose>
<c:when test="${comment ne '[]'}">
<c:forEach items="${comment }" var="comm">
	<div class="form-inline">
	<input type="text" class="form-control" style="width:60px;" value="${comm.diet_comment }">
	<input type="text" class="form-control border-0" value="${comm.comment_no }">
	</div>
	<hr style="border:1px color:gray; height: !important; display: block !important; width: 100% !important;"/>	
</c:forEach>
</c:when>
<c:otherwise>
	����� �����ϴ�.
</c:otherwise>
</c:choose>
</div>

<c:if test="${member.role_name ne 'ROLE_USER'}">
<hr style="border:1px color:gray; height: !important; display: block !important; width: 100% !important;"/>
<form style="float: right;">
	<div class="form-inline">
		<input type="text" name="diet_comment" id="input-comment">&nbsp;
		<button type="button" class="btn btn-primary btn-sm" onclick="comment()">post</button><!--  class="btn btn-outline-warning" -->
	</div>
</form>
</c:if>


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
			
						
				<button type="button" class="btn btn-primary summernotesubmitBtn" onclick="foodInsert()">����</button>
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
			
				<form method="post" id="myForm">
					<input type="file" name="image" id="imageF" /> 
					<input class="btn btn-primary btn-sm" type="button" value="���ε�" id="upbtn" />
				</form>
				<form id="frm2" method="post">
					<textarea name="diet_content" id="summernote_upd">
					</textarea>
						
					<div contenteditable="true" id="summernote_upd">
						<img src="" id="img">
					</div>
					<input name="real_diet_no2" value="${food.real_diet_no }"
						hidden="hidden"><br>
				</form>

			</div>
			<div class="modal-footer">
			<c:if test="${food.diet_content ne null}">
				<button type="button" class="btn btn-primary" onclick="foodUpdate()">����</button>
			</c:if>
						<c:if test="${food.diet_content ne null}">
				<button type="button" class="btn btn-primary" onclick="foodUpdate()">����</button>
			</c:if>
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
						<c:if test="${detail ne null }">
							 <div class="foods">
							 <c:forEach items="${detail}" var="detail">
								<div class="each_food">
									<input type="text" name="detail_food" value="${detail.detail_food}">
									<input type="text" name="detail_calorie" value="${detail.detail_calorie}" hidden="hidden">
									<input type="text" name="detail_count" onchange="change(this)" value="${detail.detail_count}">��
									<button type="button" class="deleteFood">-</button><br>
								</div>
							 </c:forEach>
							</div>
						</c:if>
				</div>
				�� Į�θ� : <input type="text" name="total_calorie1" value="${food.calorie }"><br>

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

<sec:authorize></sec:authorize>

<!-- Modal end -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script type="text/javascript">
var nowData='${food.diet_content}';
	

window.onload= function() {
<sec:authorize access="hasRole('ROLE_USER')">
	document.querySelectorAll('.userCantSeeBtn')
		.forEach(function(r){
			r.remove();
			console.log(r);
		})
	</sec:authorize>
}

	
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
			var calorie = $('input:text[name="total_calorie1"]').val();
			
			if( !selectFood || !count ) {        
				alert('������ �����ϼ���!');
			} else {
			
			var result = parseInt($('input:text[name="total_calorie1"]').val());
			
			if($('input:text[name="total_calorie1"]').val() == "0") {
				
				$('.frm1').append(
					'<div class="foods">' 
				  + '<div class="each_food">'
				  + '<input type="text" class="form-control" name="detail_food" value="' 
				  + selectFoodName
				  + '">'
				  + '<input type="text" class="form-control" name="detail_calorie" hidden="hidden" value="'
				  + selectFood
				  + '">'
				  + '<input type="text" class="form-control" name="detail_count" onchange="change(this)" value="'
				  + count
				  + '">'
				  + '<button type="button" class="deleteFood">-</button>'
				  + '</div>'
				  + '</div>'
				);
				
				result += TotalCalorie(parseInt(selectFood), parseInt(count));
				$('input:text[name="total_calorie1"]').val(parseInt(result));
				console.log(result + " --> �� Į�θ��� 0 �϶�");
				
			} else {
			
			var size = $('.each_food').length;		
				
			for(i=0; i<size; i++) {
				var food = $('.each_food ')[i].children[0].value; // ���ĸ�
				if(selectFoodName != food) {
					if(i==size-1) {
					$('.frm1').append(
						'<div class="foods">' 
						+ '<div class="each_food">'
						+ '<input type="text" class="form-control" name="detail_food" value="' 
						+ selectFoodName 
						+ '">' 
						+ '<input type="text" class="form-control" name="detail_calorie" hidden="hidden" value="' 
						+ selectFood 
						+ '">' 
						+ '<input type="text" class="form-control" name="detail_count" onchange="change(this)" value="' 
						+ count 
						+ '">' 
						+ '<button type="button" class="deleteFood">-</button>'
						+ '</div>'
						+ '</div>'
						);

					result = TotalCalorie(selectFood, count);
					}
				} else {
					result = 0;
					alert('������ ������ �̹� �����մϴ�.');	
					break;
				} 
					
			}
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
			//console.log($(this).siblings().eq(2).val());
			var count = $(this).siblings().eq(2).val(); // ����
			
			var result = TotalCalorie(selectFood, count); // Į�θ� * ����
			var calorie = $('input:text[name="total_calorie1"]').val(); // �� Į�θ�
			$('input:text[name="total_calorie1"]').val(parseInt(calorie) - parseInt(result));				
			
			$(this).closest('div.foods').remove();
			
		});
	});
	
	
	// ��� ��ư Ŭ���� �� Į�θ��� �����Ѵ�
	function Click(){
		
		
		var food = $('.foods');
		var foods = '';
		for(i=0; i<food.length; i++) {
			var name = $('input:text[name="detail_food"]').eq(i).val();
			var cal = $('input:text[name="detail_calorie"]').eq(i).val();
			var cnt = $('input:text[name="detail_count"]').eq(i).val();
		console.log(name + ", " + cal + ", " + cnt);
			foods +=  name + "," + cal + "," + cnt;
			if(i < food.length-1) {				
			foods += '/';
			}
		}
		
		 $.ajax({
			url: 'updateCalorie',
			data: { real_diet_no : $('#real_diet_no1').val(),
					total_calorie : $('input:text[name="total_calorie1"]').val(),
					detail_content : foods
			},
			dataType: 'json',
			type: 'post',
			success: function() {
				alert('SUCCESS!');
				$('#exampleModal2').hide();
				
			},
			error: function() {
				alert('ERROR!');
			}
		}); 
	}

	
	// ���� ���� input �±��� ���� ������ �� �߻��ϴ� �̺�Ʈ
	function change(obj) {
		var total_foods = 0; 
		
		var size = $('.foods').find('div').length;
		for(i=0; i<size; i++) {
			var calorie = $('.foods').find('div')[i].children[1].value;
			console.log($('.foods').find('div')[i].children[2].value);
			var count = $('.foods').find('div')[i].children[2].value;
			total_foods += (calorie * count);
			$('input:text[name="total_calorie1"]').val(total_foods);
		}
	}


	// �Ĵ� ���� �ۼ��ϱ� ��(Modal)
	$(document).ready(function() {
		$(document).on('click', '#insertForm', function(e) {
			e.preventDefault();
			$('#exampleModal').modal("show");
			$('input:text[name="user_id"]').val($('#id').val());
			
			
			if (nowData == '' || nowData ==null){ 
				console.log(nowData);
				$('.summernotesubmitBtn')[0].innerText="�ۼ�";
				$('.summernotesubmitBtn')[0].onclick=foodInsert;
				} 

		});
	});
	
	// �Ĵ� ���� �����ϱ� ��(Modal)
	$(document).ready(function() {
		$(document).on('click', '#contentUpd', function(e) {
			e.preventDefault();
			$('#exampleModal').modal("show");
			$('.note-editable').html($('.food_contents').html());
			
			if (nowData != '' || nowData !=null){ 
				console.log(nowData);
				$('.summernotesubmitBtn')[0].innerText="����";
				$('.summernotesubmitBtn')[0].onclick=foodUpdate;
				} 
			
		});
	});

	// ���� ��Ʈ
	google.charts.load('visualization','1', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var height = $('input:text[name="height"]').val();
		var weight = (height-100) * 0.9; // = ������
		var total = weight * 30;
		var arr =[]; 
		arr.push(['���볯¥', '�������뷮', '������']); 		   				

		arr.push(['${oneDay.sysdate}', parseInt(${food.calorie}), total]);
		
		var data = google.visualization.arrayToDataTable(arr);
	 
	  var options = {
			  legend: 'bottom',
			  width: '400',
			  height : '500',
	          vAxis: { viewWindow: { max: 3000 } },
	          seriesType: 'bars' };
	
	  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
	
	  chart.draw(data, options);
	}
	
	function drawChart_re(e) {
		var height = $('input:text[name="height"]').val();
		var weight = (height-100) * 0.9; // = ������
		var total = weight * 30;
		var arr =[]; 
		arr.push(['���볯¥', '�������뷮', '������']); 		   				
		var dates = $('input:text[name="dates"]').val()
		console.log($('input:text[name="dates"]').val());
		
		arr.push([dates, e, total]);
		
		var data = google.visualization.arrayToDataTable(arr);
	 
	  var options = {
			  legend: 'bottom',
			  width: '400',
			  height : '500',
	          vAxis: { viewWindow: { max: 3000 } },
	          seriesType: 'bars' };
	
	  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
	
	  chart.draw(data, options);
	}
	
	var cnt = 0;
	
	function before() {
		loadingModal();
		$('#Loadingmodal').modal('show'); //��� ���̱�
		cnt += (-1);
		$.ajax({
			url: 'getDay',
			data : { id : $('input:text[name="id"]').val(),
			    	cnt : cnt 	    	
			},
			dataType: 'json',
			type: 'get',
			success: function drawChart(result) {
			
			if(result.real_diet_no == null) {
				$('.insertFood').show();
				$('.contentBtn').find('button').remove();
			}
			$('input:text[name="total_calorie1"]').val(result.calorie);

			if(result.detail_content != null) {
				var contents = result.detail_content.split("/");
			$('.foods').remove();
			for(i=0; i<contents.length; i++) {
				var contents2 = contents[i].split(",");
				
				$('.frm1').append(
					'<div class="foods">'
					+ '<div class="each_food">'
					+ '<input type="text" class="form-control" name="detail_food" value="' + contents2[0] + '">'
					+ '<input type="text" class="form-control" name="detail_calorie" hidden="hidden" value="' + contents2[1] + '">'
					+ '<input type="text" class="form-control" name="detail_count" onchange="change(this)" value="' + contents2[2] + '">'
					+ '<button type="button" class="deleteFood">-</button>'
					+ '</div>'
					+ '</div>'
				);
				
			}
				
		} else {
			$('.foods').remove();
		}
			
			var today = result.take_date;
			var calorie = result.calorie;
			  $('.food_contents').html(result.diet_content);
			  $('input:text[name="calorie_total"]').val(calorie);
			  
			  // �Ĵ� ������ �ְ� ����� ��� �� ��
			//if(result.diet_content != null) {
			 var real_diet_no = result.real_diet_no;

			$.ajax({
				url:'getComment',
				data:{real_diet_no : real_diet_no},
				dataType: 'json',
				type: 'get',
				success : function(response) {
				console.log(response.length);
				  $('.comments').empty();
				  $('.user_comments').empty();
				  if(response.length == 0) {
						console.log(response.length);
						$('.user_comments').append(
							'<div>' +'����� �����ϴ�.' + '</div>'
						);
					}
				  if($('input:text[name="role_exist"]').val() == 'ROLE_USER') {
					  for(i=0; i<response.length; i++) {
						  
						if(response.length != 0) {
							console.log(response.length);					
						  $('.user_comments').append(
							'<div class="form-inline">'
							+ '<input type="text" class="form-control" style="width:60px;" value="' + response[i].comment_no + '">'
							+ '<input type="text" class="form-control border-0" value="' + response[i].diet_comment + '">'
							+ '</div>'
							+ '<hr style="border:1px color:gray; height: !important; display: block !important; width: 100% !important;"/>'
						  );
						}
					  }
					  
					  
				  // ROLE_USER IF END
				  } else {
				
				  for(i=0; i<response.length; i++) {
					  $('.comments').append(
						  '<div class="form-inline">'
						  + '<input type="text" class="border-0" value="' + response[i].diet_comment + '" style="width: 200px;" name="comment_upd" readonly="readonly">'
						  + '<input style="display: none;" value="' + response[i].diet_comment +'"class="hide_comment" style="width: 200px;">'
						  + '<input type="text" class="form-control" value="' + response[i].comment_no + '" name="comment_no" hidden="hidden">'
						  + '<button id="updateComment" class="btn btn-primary btn-sm">����</button>'
						  + '<button id="updateComment2" style="display: none;" class="btn btn-primary btn-sm">����</button>'
						  + '<button id="deleteComment" class="btn btn-danger btn-sm">����</button><br><br>'
						  + '</div>'
					  );
				}
			}
				  
		  },
				error: function() {
					alert('ERROR');
			  }
			}); // �����ȸ ���۽�
				
			 // �ο� ��ü�� ���ٸ�(=�Ĵܹ�ȣ�� ������)
			if(result.age == '0') {
				$.ajax({
					url : 'currentDay',
					data : {cnt : cnt},
					dataType: 'json',
					success: function(e) {
						$('.contentBtn').find('button').remove();
						$('input:text[name=dates]').val(e.sysdate);
						$('#real_diet_no1').val('');
						
						var height = $('input:text[name="height"]').val();
						var weight = (height-100) * 0.9; // = ������
						var total = weight * 30;
						var arr =[]; 
						arr.push( ['���볯¥', '�������뷮', '���差']);
					
						    arr.push([e.sysdate, 0, total]);
						
						  var data = google.visualization.arrayToDataTable(arr);
						
						  var options = {
								  legend: 'bottom',
								  width: '400',
								  height: '500',
						          vAxis: { viewWindow: { max: 3000 } },
						          seriesType: 'bars' };
						
						  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
						
						  chart.draw(data, options);
						
					}
				});
		  
			// �ο� ���� �ִٸ�(�Ĵ� ������ �ְ� ����� ���� ��)
			} else {
				//$('.contentBtn').children().show() // ����, ���� ��ư�� show
				$('input:text[name="calorie_total"]').val(result.calorie);
				$('input:text[name=dates]').val(today);
				$('#real_diet_no1').val(result.real_diet_no);
				$('.contentBtn').find('button').remove();
				if($('#real_diet_no1').val() != '') {
					
					$('.contentBtn').append(
							  '<button type="button" id="contentUpd" class="btn btn-primary">����</button>'
							+ '<button type="button" id="contentDel" class="btn btn-danger">����</button>'
						);
				}
				
				
				var height = $('input:text[name="height"]').val();
				var weight = (height-100) * 0.9; // = ������
				var total = weight * 30;
				var arr =[]; 
				arr.push( ['���볯¥', '�������뷮', '���差']);
			
				arr.push([today, parseInt(calorie), total]);
				
				  var data = google.visualization.arrayToDataTable(arr);
				
				  var options = {
						  legend: 'bottom',
						  width: '400',
						  height: '500',
				          vAxis: { viewWindow: { max: 3000 } },
				          seriesType: 'bars' };
				
				  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
				
				  chart.draw(data, options);
			}
			
				
				 
		} // ���۽� success
	});
		
		$('.insertFood').hide();
		$('#Loadingmodal').modal('hide'); //��� �����
	}
	
	function after() {
		loadingModal();
		$('#Loadingmodal').modal('show');
		cnt += 1;
		$.ajax({
			url: 'getDay',
			data : { id : $('input:text[name="id"]').val(),
			    	cnt : cnt 	    	
			},
			dataType: 'json',
			type: 'get',
			success: function drawChart(result) {
			
			if(result.real_diet_no == null) {
				$('.insertFood').show();
				$('.contentBtn').find('button').remove();
			}
			$('input:text[name="total_calorie1"]').val(result.calorie);

			if(result.detail_content != null) {
				var contents = result.detail_content.split("/");
			$('.foods').remove();
			for(i=0; i<contents.length; i++) {
				var contents2 = contents[i].split(",");
				
				$('.frm1').append(
					'<div class="foods">'
					+ '<div class="each_food">'
					+ '<input type="text" class="form-control" name="detail_food" value="' + contents2[0] + '">'
					+ '<input type="text" class="form-control" name="detail_calorie" hidden="hidden" value="' + contents2[1] + '">'
					+ '<input type="text" class="form-control" name="detail_count" onchange="change(this)" value="' + contents2[2] + '">'
					+ '<button type="button" class="deleteFood">-</button>'
					+ '</div>'
					+ '</div>'
				);
				
			}
				
		} else {
			$('.foods').remove();
		}
			
			var today = result.take_date;
			var calorie = result.calorie;
			  $('.food_contents').html(result.diet_content);
			  $('input:text[name="calorie_total"]').val(calorie);
			  
			  // �Ĵ� ������ �ְ� ����� ��� �� ��
			//if(result.diet_content != null) {
			 var real_diet_no = result.real_diet_no;

			$.ajax({
				url:'getComment',
				data:{real_diet_no : real_diet_no},
				dataType: 'json',
				type: 'get',
				success : function(response) {
				console.log(response)
				  $('.comments').empty();
				  $('.user_comments').empty();
				  if(response.length == 0) {
						console.log(response.length)
					
						$('.user_comments').append(
							'<div>' +'����� �����ϴ�.' + '</div>'
						);
					}
				  if($('input:text[name="role_exist"]').val() == 'ROLE_USER') {
					  for(i=0; i<response.length; i++) {
						  
						if(response.length != 0) {
							console.log(response.length);					
						  $('.user_comments').append(
							'<div class="form-inline">'
							+ '<input type="text" class="form-control" style="width:60px;" value="' + response[i].comment_no + '">'
							+ '<input type="text" class="form-control border-0" value="' + response[i].diet_comment + '">'
							+ '</div>'
							+ '<hr style="border:1px color:gray; height: !important; display: block !important; width: 100% !important;"/>'
						  );
						}
					  }
					  
					  
				  // ROLE_USER IF END
				  } else {
				
				  for(i=0; i<response.length; i++) {
					  $('.comments').append(
						  '<div class="form-inline">'
						  + '<input type="text" class="border-0" value="' + response[i].diet_comment + '" style="width: 200px;" name="comment_upd" readonly="readonly">'
						  + '<input style="display: none;" value="' + response[i].diet_comment +'"class="hide_comment" style="width: 200px;">'
						  + '<input type="text" class="form-control" value="' + response[i].comment_no + '" name="comment_no" hidden="hidden">'
						  + '<button id="updateComment" class="btn btn-primary btn-sm">����</button>'
						  + '<button id="updateComment2" style="display: none;" class="btn btn-primary btn-sm">����</button>'
						  + '<button id="deleteComment" class="btn btn-danger btn-sm">����</button><br><br>'
						  + '</div>'
					  );
				}
			}
				  
		  },
				error: function() {
					alert('ERROR');
			  }
			}); // �����ȸ ���۽�
				
			 // �ο� ��ü�� ���ٸ�(=�Ĵܹ�ȣ�� ������)
			if(result.age == '0') {
				$.ajax({
					url : 'currentDay',
					data : {cnt : cnt},
					dataType: 'json',
					success: function(e) {
						$('.contentBtn').find('button').remove();
						$('input:text[name=dates]').val(e.sysdate);
						$('#real_diet_no1').val('');
						
						var height = $('input:text[name="height"]').val();
						var weight = (height-100) * 0.9; // = ������
						var total = weight * 30;
						var arr =[]; 
						arr.push( ['���볯¥', '�������뷮', '���差']);
					
						    arr.push([e.sysdate, 0, total]);
						
						  var data = google.visualization.arrayToDataTable(arr);
						
						  var options = {
								  legend: 'bottom',
								  width: '400',
								  height: '500',
						          vAxis: { viewWindow: { max: 3000 } },
						          seriesType: 'bars' };
						
						  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
						
						  chart.draw(data, options);
						
					}
				});
		  
			// �ο� ���� �ִٸ�(�Ĵ� ������ �ְ� ����� ���� ��)
			} else {
				//$('.contentBtn').children().show() // ����, ���� ��ư�� show
				$('input:text[name="calorie_total"]').val(result.calorie);
				$('input:text[name=dates]').val(today);
				$('#real_diet_no1').val(result.real_diet_no);
				$('.contentBtn').find('button').remove();
				if($('#real_diet_no1').val() != '') {
					
					$('.contentBtn').append(
							  '<button type="button" id="contentUpd" class="btn btn-primary">����</button>'
							+ '<button type="button" id="contentDel" class="btn btn-danger">����</button>'
						);
				}
				
				
				var height = $('input:text[name="height"]').val();
				var weight = (height-100) * 0.9; // = ������
				var total = weight * 30;
				var arr =[]; 
				arr.push( ['���볯¥', '�������뷮', '���差']);
			
				arr.push([today, parseInt(calorie), total]);
				
				  var data = google.visualization.arrayToDataTable(arr);
				
				  var options = {
						  legend: 'bottom',
						  width: '400',
						  height: '500',
				          vAxis: { viewWindow: { max: 3000 } },
				          seriesType: 'bars' };
				
				  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
				
				  chart.draw(data, options);
			}
			
				
				 
		} // ���۽� success
	});
	$('.insertFood').hide();
	$('#Loadingmodal').modal('hide'); //��� �����
}
	
	// ��� ���
	function comment() {
		if($('input:text[name="diet_comment"]').val() == ""){
			alert('����� �Է��ؾ� �մϴ�.');
		} else {
			
		
		$.ajax({
			url : 'addComment',
			data: { real_diet_no: $('#real_diet_no1').val(),
					diet_comment : $('input:text[name="diet_comment"]').val()
			},
			dataType: 'json',
			type: 'post',
			success: function(response) {
				alert('����!');

				if($('input:text[name="role_exist"]').val() == 'ROLE_USER') {
						  
					
						  $('.user_comments').append(
							'<div class="form-inline">'
							+ '<input type="text" class="form-control" style="width:60px;" value="' + response.comment_no + '">'
							+ '<input type="text" class="form-control border-0" value="' + response.diet_comment + '">'
							+ '</div>'
							+ '<hr style="border:1px color:gray; height: !important; display: block !important; width: 100% !important;"/>'
						  );

					 
				  // ROLE_USER IF END
				  } else {
	
					  $('.comments').append(
						  '<div class="form-inline">'
						  + '<input type="text" class="border-0" value="' + response.diet_comment + '" style="width: 200px;" name="comment_upd" readonly="readonly">'
						  + '<input style="display: none;" value="' + response.diet_comment +'"class="hide_comment" style="width: 200px;">'
						  + '<input type="text" class="form-control" value="' + response.comment_no + '" name="comment_no" hidden="hidden">'
						  + '<button id="updateComment" class="btn btn-primary btn-sm">����</button>'
						  + '<button id="updateComment2" style="display: none;" class="btn btn-primary btn-sm">����</button>'
						  + '<button id="deleteComment" class="btn btn-danger btn-sm">����</button><br><br>'
						  + '</div>'
					  );
	
			}

				  
				
				$('input:text[name="diet_comment"]').val('');
			},
			error : function() {
				alert('Error!');
			}
			
		});
		}
	}
	
	// ��� ����
	$(document).ready(function() {
		$(document).on('click', '#updateComment', function(e) {
				$(this).closest('div').children('input').hide();
				$(this).closest('div').children('#updateComment').hide();
				$(this).closest('div').children('#updateComment2').show();
				$(this).parent().find('.hide_comment').show();
				console.log($(this).parent().find('.hide_comment').val());

		});
	});
	
	$(document).ready(function() {
		$(document).on('click', '#updateComment2', function(e) {
			console.log($(this).closest('div').children('input')[2].value);
			console.log($(this).parent().find('.hide_comment').val());
			if(confirm('�����Ͻðڽ��ϱ�?')) {
			$(this).closest('div').hide();
				
			$.ajax({
				url: 'updateComment',
				data: { comment_no : $(this).closest('div').children('input')[2].value,
						diet_comment : $(this).parent().find('.hide_comment').val()
				},
				dataType: 'json',
				type: 'post',
				success : function(response) {
					alert('����');
					console.log(response.diet_comment);
					if($('input:text[name="role_exist"]').val() == 'ROLE_USER') {
					
							  $('.user_comments').append(
								'<div class="form-inline">'
								+ '<input type="text" class="form-control" style="width:60px;" value="' + response.comment_no + '">'
								+ '<input type="text" class="form-control border-0" value="' + response.diet_comment + '">'
								+ '</div>'
								+ '<hr style="border:1px color:gray; height: !important; display: block !important; width: 100% !important;"/>'
							  );				 
					  // ROLE_USER IF END
					  } else {

						  $('.comments').append(
							  '<div class="form-inline">'
							  + '<input type="text" class="border-0" value="' + response.diet_comment + '" style="width: 200px;" name="comment_upd" readonly="readonly">'
							  + '<input style="display: none;" value="' + response.diet_comment +'"class="hide_comment" style="width: 200px;">'
							  + '<input type="text" class="form-control" value="' + response.comment_no + '" name="comment_no" hidden="hidden">'
							  + '<button id="updateComment" class="btn btn-primary btn-sm">����</button>'
							  + '<button id="updateComment2" style="display: none;" class="btn btn-primary btn-sm">����</button>'
							  + '<button id="deleteComment" class="btn btn-danger btn-sm">����</button><br><br>'
							  + '</div>'
						  );
					}

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
		$(document).on('click', '#deleteComment', function(e) {
			if(confirm('�����Ͻðڽ��ϱ�?')) {
				$(this).closest('div').remove();
			 $.ajax({
				url: 'deleteComment',
				data: { comment_no : $(this).closest('div').children('input')[2].value }, // no , comment
				dataType: 'json',
				type: 'post',
				success : function() {
					alert('����');
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
			data: {diet_content : $("textarea#summernote").val(),
				real_diet_no : $('#real_diet_no1').val()
			},
			dataType : 'json',
			success : function(response) {
				console.log(response);
				alert('SUCCESS!');
				$('#exampleModal').modal('hide');
				$('.food_contents').html(response.diet_content);
				
			},
			error: function() {
				alert('ERROR!');
			} 
		});
	}
	
	// �Ĵ� �����ϱ�
	$(document).ready(function() {
		$(document).on('click', '#contentDel', function() {
			if(!window.confirm('���� �����Ͻðڽ��ϱ�?')) {
				alert('���');
			} else {
				$.ajax({
					url: 'foodDel',
					data: {real_diet_no : $('#real_diet_no1').val()},
					dataType: 'json',
					success: function(res) {
						console.log(res);
						alert('������ �Ϸ�Ǿ����ϴ�.');
						$('.food_contents').html('');
						$('.contentBtn').remove();
						$('.comments').remove();
						$('.real_diet_no1').val('');
						$('input:text[name="calorie_total"]').val('');
						$('#real_diet_no1').val('')
						drawChart_re(0);
		
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
			
			if($('#real_diet_no1').val() == '') {
				alert('���� �ۼ��� �Ĵ��� �����ϴ�.');
			} else {
				e.preventDefault();
				$('#exampleModal2').modal("show");
			}
		});
	});
	 	 
</script>
<script src="/spring/resources/assets/dist/js/function.js"></script>
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
	    		let jslink;
	    		let jsid;
	    		let json;
	    		
	    		var imgSize=file;
	    		if (imgSize.size<10000000){
	    			
	    			var myHeaders = new Headers();
	    			myHeaders.append("Authorization", "Client-ID 52d00d8257f11ed");

	    			var formdata = new FormData();
	    			formdata.append("image", file, "[PROXY]");

	    			var requestOptions = {
	    					  method: 'POST',
	    					  headers: myHeaders,
	    					  body: formdata,
	    					  redirect: 'follow'
	    					};

	    		fetch("https://api.imgur.com/3/image", requestOptions)
	    		  .then(response => response.json())
	    		  .then(result => {
	    			  json=result;
	    			  jsid=json.data.id;
	    			  jslink=json.data.link;
	    			  
	    		  }).then(
	    			function(){
	    				console.log(jslink);
	    				var formdata=new URLSearchParams();
	    				  formdata.append("fileName", jsid);
	    				  formdata.append("pathName", jslink);
	    				  fetch("/spring/files/upload", 
	    					{method:'POST', headers:{"Content-Type":"application/x-www-form-urlencoded"}, 
	    						body: formdata})
	    				  .then(response=>response.text())
	    				  .then(result=>{$('#summernote').summernote('editor.insertImage', result);})
	    				  .catch(error=>console.log('error',error));

	    			}	  
	    		  
	    		  )
	    		  .catch(error => console.log('error', error));
	    		}
	    		else { alert('���� �뷮�� 10MB�� �ʰ��մϴ�.');
	    		location.reload();}
	    	
	    	
	    	
	    	
	    	}//function sendfile
}) 

	    </script>

	   