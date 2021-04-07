<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->

<title>Hello, world!</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
   	$(document).ready(function() {
   		$('.btnClick').click(function(e) {
   			e.preventDefault();
			$('#staticBackdrop').modal("show");	
   		});
   	});
   	
</script>

</head>
<body>

	<br>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>전화번호</td>
			<td>식단상세</td>
		</tr>
		<c:forEach var="list" items="${list }">
		<tr>
			<td id="id">${list.id }</td>
			<td>${list.name }</td>
			<td>${list.age }</td>
			<td>${list.gender }</td>
			<td>${list.phone_number }</td>
			<td><button type="button" onclick="location.href='getFood?id=${list.id}'">식단</button></td>
		</tr>
		</c:forEach>
	</table><br>
	
    <!-- Button trigger modal -->
	<button type="button" class="btnClick" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  		Click
	</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
    
  </body>
</html>