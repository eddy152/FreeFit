<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<style>
.right {
	display: inline-block;
	text-align: center;
	width: 100%;
	vertical-align: top;
	border: 0 10px;
	margin: 0 10px;
	padding: 0 10px;
	list-style: none;
}

table {
	width: 100%;
}

td {
	padding: 15px;
	text-align: center;
}

th {
	padding: 15px;
	text-align: center;
}

#t01 tr:nth-child(even) {
	background-color: #eee;
}

#t01 tr:nth-child(odd) {
	background-color: #fff;
}

#t01 th {
	background-color: black;
	color: white;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(document).on(
						'click',
						'.tr',
						function(e) {
							console
									.log("�Ĵ� ��ȣ : "
											+ $(this).find('#td').text());
							$
									.ajax({
										url : 'getAppFood',
										data : {
											diet_no : $(this).find('#td')
													.text()
										},
										dataType : 'json',
										success : function(res) {
											e.preventDefault();
											$('#exampleModal').modal("show");
											console.log(res + ", "
													+ res.detail_food + ", "
													+ res.detail_calorie + ", "
													+ res.detail_count);
											$('#diet_no').text(res.diet_no);
											$('#diet_title').text(
													res.diet_title);
											$('#diet_content').text(
													res.diet_content);
											$('#total_calorie').text(
													res.total_calorie);

										},
										error : function() {
											alert('ERROR!');
										}
									});
						});
			});

	function insertFoodForm() {
		var no = $('#diet_no').text();
		console.log(no);
		location.href = 'updateFood?diet_no=' + no;
	}

	function deleteFood() {
		if (window.confirm('������ �����Ͻðڽ��ϱ�?')) {
			$.ajax({
				url : 'deleteFood',
				type : 'post',
				data : {
					diet_no : $('#diet_no').text()
				},
				dataType : 'json',
				success : function() {
					alert('�����Ϸ�!');
					$('#exampleModal').modal('hide');
					location.reload();
				},
				error : function() {
					alert('ERROR!');
				}
			});
		} else {
			alert('���');
		}
	}
</script>

<div class="col-md-9 pr-30 padding-top-40">
	<div align="center">
		<h1>��õ�� �Ĵ�</h1>
		<br>
		<div>
			<table class="table">
				<tr>
					<td>�Ĵ� ��ȣ</td>
					<td>��õ�� �Ĵ�</td>
					<td>�� Į�θ�</td>
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
			<button type="button" onclick="location.href='insertFood'">�߰��ϱ�</button>
		</div>
	</div>
	<br>
	<div></div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<table border="1">
						<tr>
							<td>�Ĵܹ�ȣ</td>
							<td>����</td>
							<td>�Ĵܳ���</td>
							<td>�� Į�θ�</td>
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
					<button type="button" class="btn btn-primary"
						onclick="insertFoodForm()">�����ϱ�</button>
					<button type="button" class="btn btn-danger" onclick="deleteFood()">�����ϱ�</button>
					<button class="btn btn-secondary" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
