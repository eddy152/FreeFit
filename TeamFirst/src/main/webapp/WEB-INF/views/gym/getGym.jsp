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
	
	function list() {
		location = "getGymList"
	}

</script>
<title>getGym</title>
</head>
<body>
	<div class="page-wrapper">
		<div align="center" class="container-fluid">
			<div class="col-lg-15">
				<!--게시판 넓이 -->
				<div class="col-lg-15">
				<h1 class="page-header">헬스장 상세조회</h1>
			</div>
			<div class="row"></div>
			<div class="panel panel-default">
					<div class="panel-heading">Free Fit 헬스장</div>
						<div align="center" class="panel-body">
							<table class="table table-hover">
								<thead> 
									<tr> 
										<th>이름</th>
										<td><input value="${gym.name}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>사업자번호</th>
										<td><input value="${gym.business_number}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>매장주소</th>
										<td><input value="${gym.address.concat(' ').concat(gym.address_detail)}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>연락처</th>
										<td><input value="${gym.tel_number}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>영업시간</th>
										<td>전화문의</td>
									</tr>
									<tr>
										<th>멤버쉽등급</th>
										<td><input value="${gym.membership_name}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>기타</th>
										<td>기타 문의사항 전화문의</td>
									</tr>
							</table>
						</div>
				<button onClick="javascript:list()">목록</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>