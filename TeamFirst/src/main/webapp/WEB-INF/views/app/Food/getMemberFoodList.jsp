<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	<c:if test="${file ne null and file ne 'error'}">
	var link = '${file}';
	document.getElementById("img").src = link;
	</c:if>
	
	$(document).ready(function() {
		$(document).on('click', '.insertForm', function(e) {
			e.preventDefault();
			$('#exampleModal').modal("show");
			$('input:text[name="user_id"]').val($('#id').val());
		});
	});
	
 	function foodInsert() {
	$.ajax({
		url: 'getMemberFoodInsert',
		method: 'post',
		data: { user_id : $('input:text[name="user_id"]').val(), 
				take_date : $('input[name="take_date"]').val(),
				diet_content: $('.diet_content').val(),
				calorie: $('input:text[name="calorie"]').val() 
			  }, 
		dataType: 'json',
		success: function() {
			alert('성공');
		},
		error: function() {
			alert('ERROR!');
		}
	});
} 


</script>
<div>
	<h1>회원의 식단</h1>
	<div>
		<button type="button" class="insertForm">작성하기</button>
	</div>
	<br>
	<div>
		<c:forEach var="food" items="${list }">
			<div>
				<h6>${food.take_date }</h6>
			</div>
			<div>${food.diet_content }</div>
			<div>${food.calorie }</div>
			<div><input type="text" value="${food.user_id }" id="id"></div>
			<hr>
			<div>
				<h6>댓글 남기기</h6>
				<input type="text"><button>전송</button>
			</div>
			<hr>
		</c:forEach>
	</div>
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
        작성자 : <input type="text" name="user_id">
   		작성 날짜 : <input type="date" name="take_date">
   		<br>
   		<h6>식단내용</h6>
   		칼로리 : <input type="text" name="calorie">
   		<div>
			<div style="margin: 10% 10% 10% 10%;">
				<!--  파일첨부 -->
				<form action="/spring/files/upload" method="post"
					enctype="multipart/form-data">
					<input type="file" name="file" /> <input
						class="btn btn-primary btn-sm" type="submit" value="업로드" />
				</form>
			</div>
			<div>
				<img src="" id="img">
			</div>
		</div>
   		<textarea rows="5" cols="50" class="diet_content"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="foodInsert()">등록하기</button>
        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
