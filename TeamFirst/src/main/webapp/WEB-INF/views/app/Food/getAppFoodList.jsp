<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$(document).on('click', '.tr', function(e) {
			$.ajax({
				url: 'getAppFood',
				data: {diet_no : $(this).find('#td').text()},
				dataType: 'json',
				success: function(res) {
					e.preventDefault();
					$('#exampleModal').modal("show");
				
						$('#diet_no').text(res.diet_no);
						$('#diet_title').text(res.diet_title);
						$('#diet_content').text(res.diet_content); 
						$('#total_calorie').text(res.total_calorie);

				},
				error:function() {
					alert('ERROR!');
				}
			});
		});
	});
	
	function insertFoodForm() {
		var no = $('#diet_no').text();
		console.log(no);
		location.href='updateFood?diet_no=' + no;
	}
	
</script>

<div>
<h1>추천별 식단</h1>
<br>
	<div>
		<table border="1">
			<tr>
				<td>식단 번호</td>
				<td>추천별 식단</td>
				<td>총 칼로리</td>
			</tr>
		<c:forEach var="food" items="${list }">
			<tr class="tr">
				<td id="td">${food.diet_no }</td>
				<td>${food.diet_title }</td>
				<td>${food.total_calorie }</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<br>
	<div>
		<button type="button" onclick="location.href='insertFood'">추가하기</button>
	</div>
</div>
<br>
<div>

</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
   		<table border="1">
   			<tr>
   				<td>식단번호</td>
   				<td>제목</td>
   				<td>식단내용</td>
   				<td>총 칼로리</td>
   			</tr>
   			<tr>
   				<td id="diet_no"></td>
   				<td id="diet_title"></td>
   				<td id="diet_content"></td>
   				<td id="total_calorie"></td>
   			</tr>
   		</table>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="insertFoodForm()">수정하기</button>
      </div>
    </div>
  </div>
</div>
