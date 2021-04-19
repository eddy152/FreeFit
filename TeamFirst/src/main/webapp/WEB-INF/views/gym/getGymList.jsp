<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>getGym.jsp</title>

	<script type="text/javascript">
	
		$(function () {
			$(".dataRow").click(function () {
			var id = $(this)[0].children[0].attr("id")			
			location = "getGym?id=" + id
					
		})
  });
		function search() {
			location = "getGymList?search=" + $("#search_text").val();
		}
	
	</script>

</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">free fit </h1>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input type="text" id="search_text" style="width: 300px;" value="${search}"/>
						<input type="button" value="검색"
							   onclick="search()">
						<!--  </button>-->
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Free Fit</div>
					<div align="center" class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>헬스장이름</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>이메일</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr class="dataRow">
										<td id="${list.id}">${list.fitness_name}</td>
										<td>${list.adress.concat(' ').concat(list.adress_detail)}</td>
										<td>${list.email}</td>
								</c:forEach>
							</tbody>
							
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>