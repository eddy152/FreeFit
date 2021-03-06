<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link href="http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" rel="stylesheet">
<style type="text/css">
	.jm{font-family: 'Jeju Myeongjo', serif;}

	h1 {
		margin-top: 5%;
	}
	btn.btn-primary.btn-lg {
		right: 0;	
	}
	
	.tbl-size {
		width : 390px;
	}
	
	.font-table {
		font-size: 12px;
		width : 380px;
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
					$('#diet_no').val(res[0].diet_no);
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
		var no = $('#diet_no').val();
		console.log(no);
		location.href='updateFood?diet_no=' + no;
	}
	
	function deleteFood() {
		if(window.confirm('정말로 삭제하시겠습니까?')) {
			$.ajax({
				url: 'deleteFood',
				type: 'post',
				data: { diet_no : $('#diet_no').val() },
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
<h1 class="jm">추천별 식단</h1>
<br>
	<div class="tbl-size">
		<table class="table table-striped">
			<thead>
			<tr>
				<th scope="col">식단 번호</th>
				<th scope="col">추천별 식단</th>
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
	<c:if test="${member.role_name ne 'ROLE_USER'}">
	<div>
		<button type="button" class="btn btn-primary btn-md" onclick="location.href='insertFood'">추가하기</button>
	</div>
	</c:if>
</div>
<br>
<div>

</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">식단 리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="font-table">
   		<table class="table">
   			<tr>
   				<th style="width: 20%">제목</th>
   				<th>내용</th>
   				<th style="width: 20%">총 칼로리</th>
   			</tr>
   			<tr>
   				<td id="diet_title"></td>
   				<td id="diet_content"></td>
   				<td id="total_calorie"></td>
   			</tr>
   		</table>
   		<input id="diet_no" type="text" hidden="hidden">
        </div>
        
      </div>
      <div class="modal-footer">
      <c:if test="${member.role_name ne 'ROLE_USER'}">
        <button type="button" class="btn btn-primary" onclick="insertFoodForm()">수정하기</button>
        <button type="button" class="btn btn-danger" onclick="deleteFood()">삭제하기</button>
      </c:if>
        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
