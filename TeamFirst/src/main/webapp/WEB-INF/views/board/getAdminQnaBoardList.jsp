<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>boardList</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">어드민 문의 리스트</h1>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<button type="button"
							class="btn btn-outline btn-primary pull-right">
							<i class="fa fa-edit fa-fw"></i> 공지사항 작성
						</button>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">공지사항</div>
					<div align = "center" class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>문의</th>
									<th>작성일</th>
									<th>관리자ID</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="AdminQnaBoardVO">
									<tr>
										<td>${AdminQnaBoardVO.qna_no}</td>
										<td>${AdminQnaBoardVO.title}</td>
										<td>${AdminQnaBoardVO.question}</td>
										<td><fmt:formatDate 
											pattern="yyyy-MM-dd HH:mm"
											value="${AdminQnaBoardVO.reg_date}" /></td>
										<td>${AdminQnaBoardVO.admin_id}</td>
										<td>${AdminQnaBoardVO.hit}</td>
									</tr>
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
