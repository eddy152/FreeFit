<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>manageList.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-15">
				<h2>수강회원 리스트</h2>
				<div class="panel panel-default">
					<div align="center" class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr class="thead-dark">
									<th>수강번호</th>
									<th>유저ID</th>
									<th>강의번호</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>잔여횟수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memList}" var="mem">
									<tr class="dataRow">
										<td>${mem.course_reg_no}</td>
										<td>${mem.user_id}</td>
										<td>${mem.tuition_no}</td>
										<td><fmt:formatDate value="${mem.start_date}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${mem.end_date}"
												pattern="yyyy-MM-dd" /></td>
										<td>${mem.remains}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input type="button" value="수강회원 등록" style="float: right;"
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
					<a href="#" onClick="fn_paging('${pagination.prevPage}')"> [이전]</a>
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
			<div>총 게시글 수 : ${pagination.listCnt} / 총 페이지 수 :
				${pagination.pageCnt} / 현재 페이지 : ${pagenation.curPage} / 현재 블럭 :
				${pagination.curRange} / 총 블럭 수 : ${pagination.rangeCnt}</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			var no = $(this)[0].children[0].innerText
			location = "getMem?course_reg_no=" + no;
		})
	});

	function fn_paging(page) {
		location = "userNList?page=" + page + "&search="
				+ $("#search_text").val();
	}
</script>
</html>