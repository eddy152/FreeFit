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
<title>getAdminNoticeBoardList.jsp</title>

<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			var no = $(this)[0].children[0].innerText
			location = "getAdminNoticeBoard?board_no="+no;
		})
	});
	function fn_paging(page){
			location = "getAdminNoticeBoardList?page="+page+"&search="+$("#search_text").val();
	}
	function search(){
			location = "getAdminNoticeBoardList?search="+$("#search_text").val();
	}
	</script>

<style>
	div#divTag1 {
    right: -180px;
    margin-right: ;
	}

	.button {
  	background-color: #01DFD7;
  	border: none;
  	color: white;
	padding: 10px 20px;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 13px;
  	margin: 3px 1px;
  	cursor: pointer;
	}
	
</style>
</head>
<body>
	<div  class="page-wrapper">
		<div  class="container-fluid">
			<div align="right" class="col-lg-8" id="divTag1">
				<!--게시판 넓이 -->
				<div class="col-lg-12" style="color:white; background-color:#01DFD7; padding:20px;">
					<h1 align="center" class="page-header">프리핏 관리자 공지사항</h1>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input type="text" id="search_text" style="width: 300px;" value="${search}"/>
						<input type="button" value="제목으로 검색"
							   onclick="search()">
					</div> 
				</div>
				<div class="row">
					<div class="col-lg-12">
					<!-- 원래자리 -->
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Free Fit</div>
					<div  class="panel-body">
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
								<c:forEach items="${list}" var="list">
									<tr class="dataRow">
										<td>${list.board_no}</td>
										<td>${list.category}</td>
										<td>${list.title}</td>
										<td>${list.hit}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${list.reg_date}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<input type="button" class="button" value="작성하기" onclick="location.href='adminBoard';"><!--style="float: right;"  -->
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
	<div> 총 게시글 수 : ${pagination.listCnt } 
		/ 총 페이지 수 :${pagination.pageCnt } 
		/ 현재 페이지 : ${pagination.curPage } 
		/ 현재 블럭  : ${pagination.curRange} 
		/ 총 블럭 수 : ${pagination.rangeCnt }
	</div>
</body>
</html>
