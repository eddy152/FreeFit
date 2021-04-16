<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<div>
	<h1>회원의 식단</h1>
	<div>
		<button type="button" class="insertForm">작성하기</button>
	</div><br>
	<div>
		<input type="text" name="id" value="${user.id }" hidden="hidden">
		<table border="1">
			<tr>

				<td>이름</td>
				<td>${user.name }<input name="name" value="${user.name }" hidden="hidden">
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>${user.age }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${user.gender }</td>
			</tr>
			<tr>
				<td>키</td>
				<td>${user.height }</td>
			</tr>
			<tr>
				<td>몸무게</td>
				<td>${user.weight }<input type="text" hidden="hidden" name="weight" value="${user.weight }">
				</td>
			</tr>
			<tr>
				<td colspan="3" style="width: 200px;"><textarea>특이사항</textarea>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<div>	
			식단 번호 : <input type="text" value="${food.real_diet_no }" id="real_diet_no1">
			
			<div>${food.diet_content }</div>
			${food.diet_comment}
			<hr>
			<div class="comments">
				<c:forEach var="com" items="${comment }">
					<div id="priv_comment">
						<input type="text" value="${com.diet_comment }">
						<input type="text" value="${com.comment_no }" name="comment_no" hidden="hidden">
						<a href="#" class="updateComment">[수정]</a>
						<a href="#" class="deleteComment">[삭제]</a>
					</div>
					<br>
				</c:forEach>
			</div>
			
			<div>
				<h6>댓글 남기기</h6>
				<input type="text" name="diet_comment">
				<button type="button" onclick="comment()">댓글 남기기</button>
			</div>
			<hr>
			<div>
				<input type="text" value="${food.calorie }" hidden="hidden">
				<button type="button" id="calorieBtn">칼로리 계산하기</button>
			</div>

	</div>
</div>
<div id="photo">
	
</div>
<div id="columnchart_material" style="width: 500px; height: 500px;"></div>
<div>${food.take_date }</div>

<!-- Modal start -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">식단 작성하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   
<!-- 		<form action="insertImg" method="post"> -->
		<form id="frm" method="post">
			<textarea name="diet_content" id="summernote"></textarea>
			<input name="real_diet_no" value="${food.real_diet_no }" hidden="hidden"><br>
	         <input type="text" value="테스트">
		</form>
<!-- 		</form> -->

      </div>
      <div class="modal-footer">
			<button type="button" class="btn btn-primary" onclick="foodInsert()">전송</button>
        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal end -->

<!-- Calorie Modal start -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">칼로리 계산하기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   
			
			음식 : <div class="addFoodInput">
					<select id="foods">
						<option value="">선택</option>
						<c:forEach var="food" items="${foodList }">
							<option value="${food.calorie}">${food.food_name }</option>
						</c:forEach>
					</select>
					<input type="text" id="Foodcount"> 개
				 </div>
				<button type="button" class="addFood">+</button>
			<hr>
			<div class="frm1">
			음식명 : 
			</div>
			총 칼로리 : <input type="text" name="total_calorie1">
		<br>
		
		<form action="updateCalorie" method="post" class="frm">
			<input type="text" name="total_calorie">
		</form>

      </div>
      <div class="modal-footer">
			<button type="button" class="btn btn-primary" onclick="Click()">전송</button>
        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal end -->

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
		$('.addFood').click(function() {
			var selectFood = $('#foods option:selected').val();
			var count = $('#Foodcount').val();
			var selectFoodName = $('option:selected').text();
			
			console.log(selectFood + "-> selectFood");
			
			if( !selectFood || !count ) {
				alert('음식과 갯수를 선택하세요!');
			} else {
			
			var food_calorie = $('#foods option:selected').val();
			
			var result = TotalCalorie(food_calorie, count); 
			
			$('.frm1').append(
				'<div>' +
				'<input type="text" name="food_name" value="' 
				+ selectFoodName 
				+ '">' 
				+ '<input type="text" name="food_calorie" hidden="hidden" value="' 
				+ selectFood 
				+ '">' 
				+ '<input type="text" name="count" onchange="change(this)" value="' 
				+ count 
				+ '">' 
				+ '개'
				+ '<button type="button" class="deleteFood">-</button>'
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

	// - 클릭시 해당 음식명, 갯수 input 태그가 삭제됨
	$(document).ready(function() {
		$(document).on('click', '.deleteFood', function() {
			var selectFood = $(this).siblings().eq(1).val(); // 칼로리
			var count = $(this).siblings().eq(2).val(); // 갯수
			
			var result = TotalCalorie(selectFood, count); // 칼로리 * 갯수
			var calorie = $('input:text[name="total_calorie1"]').val(); // 총 칼로리
			$('input:text[name="total_calorie1"]').val(parseInt(calorie) - parseInt(result));				
			
			$(this).closest('div').remove();
			
		});
	});
	
	
	// 등록 버튼 클릭시 총 칼로리를 저장한다
	function Click(){
		
		$.ajax({
			url: 'updateCalorie',
			data: { real_diet_no : $('input:text[name="real_diet_no"]').val(),
					total_calorie : $('input:text[name="total_calorie1"]').val()	
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
	
	// 음싯 갯수 input 태그의 값을 변경할 때 발생하는 이벤트
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


	// 식단 사진 작성하기 폼(Modal)
	$(document).ready(function() {
		$(document).on('click', '.insertForm', function(e) {
			e.preventDefault();
			$('#exampleModal').modal("show");
			$('input:text[name="user_id"]').val($('#id').val());
		});
	});

	google.charts.load('visualization','1', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var weight = $('input:text[name="weight"]').val(); // = 몸무게
		var result = weight * 12 * 1.5;
		var arr =[]; 
		arr.push( ['섭취날짜', '실제섭취량', '권장량']);
	
		    arr.push(['${food.take_date}', parseInt(${food.calorie }), result]);
		
	  var data = google.visualization.arrayToDataTable(arr);
	
	  var options = {
			  width : '1000',
	          vAxis: { viewWindow: { max: 3000 } },
	          seriesType: 'bars' };
	
	  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
	
	  chart.draw(data, options);
	}
	
	// 댓글 등록
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
				alert('성공!');
				
				$('.comments').append(
					'<input type="text" value="'+ response.diet_comment +'">'
					+ '<a href="#" class="updateComment">[수정]</a>' 
					+ '<a href="#" class="deleteComment">[삭제]</a>'
				);
				
				$('input:text[name="diet_comment"]').val('');
			},
			error : function() {
				alert('Error!');
			}
			
		});
	}
	
	// 댓글 수정
	$(document).ready(function() {
		$(document).on('click', '.updateComment', function(e) {
			console.log($(this).closest('div').children('input').val());
			$.ajax({
				url: 'updateComment',
				data: { comment_no : $(this).closest('div').children('input')[1].value,
						diet_comment : $(this).closest('div').children('input').val() 		
				},
				dataType: 'json',
				type: 'post',
				success : function() {
					alert('성공');
					location.reload();
				},
				error: function() {
					alert('ERROR!');
				}
			});
		});
	});
	
	// 댓글 삭제
	$(document).ready(function() {
		$(document).on('click', '.deleteComment', function(e) {
			 $.ajax({
				url: 'deleteComment',
				data: { comment_no : $(this).closest('div').children('input')[1].value }, // no , comment
				dataType: 'json',
				type: 'post',
				success : function() {
					alert('성공');
					location.reload();
				},
				error: function() {
					alert('ERROR!');
				}
			});
			console.log($(this).closest('div').children('input')[1].value);
			
		});
	});
	
	// 식단 생성하기
	
	
	// 식단 변경하기
 	function foodInsert(){
		$.ajax({
			url : 'insertImg',
			type: 'post',
			data: {diet_content : $("textarea#summernote").val(),
				id : $('input:text[name="id"]').val()
			},
			dataType : 'json',
			success : function() {
				alert('SUCCESS!');
				$('#exampleModal').modal('hide');
				location.reload();
				
			},
			error: function() {
				alert('ERROR!');
			} 
		});
	}
	
	// 칼로리 계산하기 폼(Modal)
	$(document).ready(function() {
		$(document).on('click', '#calorieBtn', function(e) {
			e.preventDefault();
			$('#exampleModal2').modal("show");
		});
	});
	 	 
</script>
<!-- summer note -->
<script>
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
	    </script>