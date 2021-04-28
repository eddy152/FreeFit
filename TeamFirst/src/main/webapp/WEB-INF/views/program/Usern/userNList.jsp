<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
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
	width: 70%;
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
	<div class="page-wrapper">
		<div class="row justify-content-center">
			<div class="col-lg-10"">
				<!-- 게시판 col-lg-* 1200px이하에서 세로로 표시 시작-->
				<div class="col justify-content-center mb-4 text-center">
				<h1 align="center" class="page-header">
					오너 공지사항</h1>
					<p class="text-center">프리핏의 오너공지를 안내해 드립니다.</p>
				</div>
				
				
				<div class="row justify-content-center mb-3">
				<div class="col-3 input-group border border-secondary">
  <input type="text" id="search_text" class="form-control border-0" placeholder="검색" aria-label="Recipient's username" aria-describedby="button-addon2" value="${search}">
  <div class="input-group-append">
    <button class="btn" type="button" id="button-addon2" onclick="search()"><svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-search align-middle" viewBox="0 0 21 21">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></button>
  </div>
  </div>
</div>
				
				
				
				
				<div class="row">
						<table class="table table">
							<thead>
								<tr class="bg-secondary text-white text-center">
									<th>No</th>
									<th>카테고리</th>
									<th class="w-50">제목</th>
									<th>조회수</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${uList}" var="us">
									<tr class="dataRow">
										<td class="text-center">${us.board_no}</td>
										<td class="text-center">${us.category}</td>
										<td>${us.title}</td>
										<td class="text-center">${us.hit}</td>
										<td class="text-center"><fmt:formatDate value="${us.reg_date}"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				</div>
				<div class="mx-auto mt-5 search-bar input-group mb-3">
						<input type="text" id="search_text" style="width: 100px;" class="form-control rounded-pill"; placeholder="검색하기"; 
							value="${search}" /> 
						<input type="button" value="검색하기"  class="btn btn-primary";
							onclick="search()">&nbsp;&nbsp;
						<input type="button" value="글쓰기"   class="btn btn-primary"; style="width: 100px;"
							onclick="location.href='userNW';">					
				</div>
			</div>
			<!-- Paging -->
			<div align="center" class="container" >
			 <ul class="pagination pagination-lg">
				<c:if test="${pagination.curRange ne 1 }">
					<li class="page-item"><a href="#" onClick="fn_paging(1)">[처음]</a></li>
				</c:if>
				<c:if test="${pagination.curRange ne 1 }">
					<li class="page-item"><a href="#" onClick="fn_paging('${pagination.prevPage}')">[이전]</a></li>
				</c:if>
			</ul>
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
