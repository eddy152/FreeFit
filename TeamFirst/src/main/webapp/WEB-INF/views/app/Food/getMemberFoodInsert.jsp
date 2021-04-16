<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<div>
	<h1>ȸ���� �Ĵ�</h1>
	<div>
		<button type="button" class="insertForm">�ۼ��ϱ�</button>
	</div><br>
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
				<td>${user.weight }<input type="text" hidden="hidden" name="weight" value="${user.weight }">
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
			�Ĵ� ��ȣ : <input type="text" value="${food.real_diet_no }" id="real_diet_no1">
			
			<div>${food.diet_content }</div>
			<div>Į�θ� : <input type="text" value="${food.calorie }"></div>
			${food.diet_comment}
			<hr>
			<div class="comments">
				<c:forEach var="com" items="${comment }">
					<div id="priv_comment">
						<input type="text" value="${com.diet_comment }">
						<input type="text" value="${com.comment_no }" name="comment_no" hidden="hidden">
						<a href="#" class="updateComment">[����]</a>
						<a href="#" class="deleteComment">[����]</a>
					</div>
					<br>
				</c:forEach>
			</div>
			
			<div>
				<h6>��� �����</h6>
				<input type="text" name="diet_comment">
				<button type="button" onclick="comment()">��� �����</button>
			</div>
			<hr>

	</div>
</div>
<div id="photo">
	
</div>
<div id="columnchart_material" style="width: 500px; height: 500px;"></div>
<div>${food.take_date }</div>

<!-- Modal start -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">�Ĵ� �ۼ��ϱ�</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   
<!-- 		<form action="insertImg" method="post"> -->
		<form id="frm" method="post">
			<textarea name="diet_content" id="summernote"></textarea>
			<input name="real_diet_no" value="${food.real_diet_no }" hidden="hidden"><br>
		</form>
<!-- 		</form> -->

      </div>
      <div class="modal-footer">
			<button type="button" class="btn btn-primary" onclick="foodInsert()">����</button>
      <!--   <button type="button" class="btn btn-primary" onclick="foodInsert()">����ϱ�</button> -->
        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal end -->

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script type="text/javascript">

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
		var weight = $('input:text[name="weight"]').val(); // = ������
		var result = weight * 12 * 1.5;
		var arr =[]; 
		arr.push( ['���볯¥', '�������뷮', '���差']);
	
		    arr.push(['${food.take_date}', parseInt(${food.calorie }), result]);
		
	  var data = google.visualization.arrayToDataTable(arr);
	
	  var options = {
	          chart: { title: '�̹��� �Ĵ�',  subtitle: $('input:text[name="name"]').val() + ' ȸ������ �Ĵ� ���'},
	          vAxis: { viewWindow: { max: 3000 } },
	          seriesType: 'bars' };
	
	  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
	
	  chart.draw(data, options);
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
					'<input type="text" value="'+ response.diet_comment +'">'		
				);
				
			},
			error : function() {
				alert('Error!');
			}
			
		});
	}
	
	// ��� ����
	$(document).ready(function() {
		$(document).on('click', '.updateComment', function(e) {
			console.log($(this).closest('div').children('input').val());
			$.ajax({
				url: 'updateComment',
				data: { comment_no : $(this).closest('div').children('input')[1].value,
						diet_comment : $(this).closest('div').children('input').val() 		
				}, // no , comment
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
		});
	});
	
	// ��� ����
	$(document).ready(function() {
		$(document).on('click', '.deleteComment', function(e) {
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
			console.log($(this).closest('div').children('input')[1].value);
			
		});
	});
	
	// �Ĵ� ����ϱ�
/* 	function foodInsert(){
		$.ajax({
			url : '',
			type: 'post',
		});
	}
	 	 */
</script>
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
	        height: 120,
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