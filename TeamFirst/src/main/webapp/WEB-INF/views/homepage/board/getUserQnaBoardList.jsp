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
					<h1 class="page-header">유저 1대1 문의 게시판</h1>
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
									<th>문의내용</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>멤버쉽ID</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="UserQnaBoardVO">
									<tr>
										<td>${UserQnaBoardVO.qna_no}</td>
										<td>${UserQnaBoardVO.title}</td>
										<td>${UserQnaBoardVO.question}</td>
										<td>${UserQnaBoardVO.user_id}</td>
										<td><fmt:formatDate 
											pattern="yyyy-MM-dd HH:mm"
											value="${UserQnaBoardVO.reg_date}" /></td>
										<td>${UserQnaBoardVO.mem_reg_id}</td>
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
