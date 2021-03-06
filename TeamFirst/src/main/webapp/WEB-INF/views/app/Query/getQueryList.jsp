<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>getQueryList.jsp</title>

<script type="text/javascript">



</script>

<div>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">1대1문의</h1>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input type="text" id="search_text" style="width: 300px;" value="${search}"/>
						<input type="button" value="검색"
							   onclick="search()">
					</div> 
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input type="button" value="작성하기" style="float: right;"
							onclick="location.href='';">
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">1대1문의</div>
					<div align="center" class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr class="dataRow">
										<td>${list.}</td>
										<td>${list.}</td>
										<td>${list.}</td>
										<td>${list.}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${list.}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 페이징 -->
	<div align="center">
		<c:if test="${pagination.curRange ne 1 }">
		   <a href="#" onClick="fn_paging(1)" >[처음]</a>
		</c:if>
		<c:if test="${pagination.curPage ne 1}"	>
		   <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a>
		</c:if>
		
		<c:forEach var="pageNum" begin="${pagination.startPage }"
				   end="${pagination.endPage }">
		  <c:choose>
		    <c:when test="${pageNum eq  pagination.curPage}">
		      <span style="font-weight: bold;"><a href="#"
					onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
			</c:when>
			<c:otherwise>
					<a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
			</c:otherwise>
		  </c:choose>
		</c:forEach>
		<c:if
			test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a>
		</c:if>
		<c:if
			test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
		</c:if>
	</div>
	<div>총 게시글 수 : ${pagination.listCnt } 
		/ 총 페이지 수 :${pagination.pageCnt } 
		/ 현재 페이지 : ${pagination.curPage } 
		/ 현재 블럭  : ${pagination.curRange} 
		/ 총 블럭 수 : ${pagination.rangeCnt }
	</div>
