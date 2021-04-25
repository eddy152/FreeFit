<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<style type="text/css">
	h1 {
		margin-top: 5%;
	}
	btn.btn-primary.btn-lg {
		right: 0;	
	}
</style>
<script type="text/javascript">

	$(document).ready(function() {
		$(document).on('click', '.tr', function(e) {
			console.log("식단 번호 : " + $(this).find('#td').text());
			$.ajax({
				url: 'getAppFood',
				data: {diet_no : $(this).find('#td').text()},
				dataType: 'json',
				success: function(res) {
					e.preventDefault();
					$('#exampleModal').modal("show");
					
					var food = [];
					for(i=0; i<res.length; i++) {
					console.log(res[i].detail_food + " " + res[i].detail_count + "개");
					food += res[i].detail_food + " " + res[i].detail_count + "개";
					if(i<res.length-1) {
						food += ", ";
						}
					}
					console.log(food);
					$('#diet_content').text(food);
					$('#diet_no').text(res[0].diet_no);
					$('#diet_title').text(res[0].diet_title);
					$('#total_calorie').text(res[0].total_calorie);

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
	
	function deleteFood() {
		if(window.confirm('정말로 삭제하시겠습니까?')) {
			$.ajax({
				url: 'deleteFood',
				type: 'post',
				data: { diet_no : $('#diet_no').text() },
				dataType: 'json',
				success: function() {
					alert('삭제완료!');
					$('#exampleModal').modal('hide');
					location.reload();
				},
				error: function() {
					alert('ERROR!');
				}
			});
		} else {
			alert('취소');
		}
	}
	
</script>

<div>
<h1>추천별 식단</h1>
<br>
	<div class="table">
		<table class="table table-striped">
			<thead>
			<tr>
				<th scope="col" style="width:150px;">식단 번호</th>
				<th scope="col" style="width:700px;">추천별 식단</th>
				<th scope="col">총 칼로리</th>
			</tr>
			</thead>
		<tbody>
		<c:choose>
		<c:when test="${list eq '[]'}">
			<tr>
				<th colspan="3">현재 등록된 게시글이 없습니다.</th>
			</tr>		
		</c:when>
		<c:otherwise>
			<c:forEach var="food" items="${list }">
			<tr class="tr">
				<th scope="row" id="td">${food.diet_no }</th>
				<td>${food.diet_title }</td>
				<td>${food.total_calorie }</td>
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		</tbody>
		</table>
	</div>
	<br>
	<div>
		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='insertFood'">추가하기</button>
	</div>
</div>
<br>
<div>

</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">식단 리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
   		<table class="table table-striped">
   			<tr>
   				<td>식단번호</td>
   				<td style="width:20%;">제목</td>
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
        <button type="button" class="btn btn-primary" onclick="insertFoodForm()">수정하기</button>
        <button type="button" class="btn btn-danger" onclick="deleteFood()">삭제하기</button>
        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
