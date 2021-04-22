<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head>
<title>userNList.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="row row-2">
				<!-- 게시판 col-lg-* 1200px이하에서 세로로 표시 시작-->
				<div class="col-sm-5">
					<h1 class="page-header">오너 공지사항</h1>
				</div>

				<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>조회수</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${uList}" var="us">
									<tr class="dataRow">
										<td>${us.board_no}</td>
										<td>${us.category}</td>
										<td>${us.title}</td>
										<td>${us.hit}</td>
										<td><fmt:formatDate value="${us.reg_date}"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				</div>
				<div class="input-group mb-3">
						<input type="text" id="search_text" style="width: 100px;" class="form-control";
							value="${search}" />&nbsp;&nbsp; <input type="button" value="검색하기"  class="btn btn-secondary mb-5";
							onclick="search()">
					<!-- col-lg-12끝 -->
				</div>
				<!--row 끝 -->
				<div class="row">
					<div class="col-lg-12">
						<input type="button" value="글쓰기" style="float: right;" class="btn btn-secondary mb-3";
							onclick="location.href='userNW';">
					</div>
				</div>
				<!--row 끝 -->
			</div>
			<!-- Paging -->
			<div align="center" class="row">
				<c:if test="${pagination.curRange ne 1 }">
					<a href="#" onClick="fn_paging(1)"> [처음]</a>
				</c:if>
				<c:if test="${pagination.curRange ne 1 }">
					<a href="#" onClick="fn_paging('${pagination.prevPage}')">
						[이전]</a>
				</c:if>

				<c:forEach var="pageNum" begin="${pagination.startPage}"
					end="${pagination.endPage}">
					<c:choose>
						<c:when test="${pageNum eq pagination.curPage}">
							<span style="font-weight: bold;"><a href="#"
								onclick="fn_paging('${pageNum}')">${pageNum}</a></span>
						</c:when>
						<c:otherwise>
							<a href="#" onClick="fn_paging('${pageNum}')">${pageNum}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if
					test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
					<a href="#" onClick="fn_paging('${pagination.nextPage}')">[다음]</a>
				</c:if>
				<c:if
					test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
					<a href="#" onClick="fn_paging('${pagination.nextPage}')">[끝]</a>
				</c:if>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			var no = $(this)[0].children[0].innerText
			location ="getUserh?board_no="+no;
		})
	});

	function fn_paging(page) {
		location = "userNList?page="+page+"&search="+$("#search_text").val();
	}

	function search() {
		location = "userNList?search="+$("#search_text").val();
	}
</script>
</html>