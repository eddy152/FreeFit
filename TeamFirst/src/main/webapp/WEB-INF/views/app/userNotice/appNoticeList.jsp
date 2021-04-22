<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>appNoticeist.jsp</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-15">
				<div class="col-lg-15">
					<h2 class="page-header">앱  공지사항</h2>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">유저가 보는곳 삭제 수정기능없음 </div>
					<div align="center" class="panel-body">
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
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input type="text" id="search_text" style="width: 300px;"
							value="${search}" /> <input type="button" value="검색하기"
							onclick="search()">
					</div>
					<!-- col-lg-12끝 -->
				</div>
				<!--row 끝 -->
			</div>
			<!-- Paging -->
			<div align="center" class="row">
				<c:if test="${paginations.curRange ne 1 }">
					<a href="#" onClick="fn_paging(1)"> [처음]</a>
				</c:if>
				<c:if test="${paginations.curRange ne 1 }">
					<a href="#" onClick="fn_paging('${paginations.prevPage}')">
						[이전]</a>
				</c:if>

				<c:forEach var="pageNum" begin="${paginations.startPage}"
					end="${paginations.endPage}">
					<c:choose>
						<c:when test="${pageNum eq paginations.curPage}">
							<span style="font-weight: bold;"><a href="#"
								onclick="fn_paging('${pageNum}')">${pageNum}</a></span>
						</c:when>
						<c:otherwise>
							<a href="#" onClick="fn_paging('${pageNum}')">${pageNum}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if
					test="${paginations.curPage ne paginations.pageCnt && paginations.pageCnt > 0}">
					<a href="#" onClick="fn_paging('${paginations.nextPage}')">[다음]</a>
				</c:if>
				<c:if
					test="${paginations.curPage ne paginations.pageCnt && paginations.pageCnt > 0}">
					<a href="#" onClick="fn_paging('${paginations.nextPage}')">[끝]</a>
				</c:if>
			</div>
			<div>총 게시글 수 : ${pagination.listCnt} / 총 페이지 수 :
				${paginations.pageCnt} / 현재 페이지 : ${pagenations.curPage} / 현재 블럭 :
				${paginations.curRange} / 총 블럭 수 : ${paginations.rangeCnt}</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			var no = $(this)[0].children[0].innerText
			location ="appNoticeUserh?board_no="+no;
		})
	});

	function fn_paging(page) {
		location = "appNoticeList?page="+page+"&search="+$("#search_text").val();
	}

	function search() {
		location = "appNoticeList?search="+$("#search_text").val();
	}
</script>
</html>