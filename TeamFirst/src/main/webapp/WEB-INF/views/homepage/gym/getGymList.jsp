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
	$(function() {
		$(".dataRow").click(function() {
			var id = $($(this)[0].children[0]).attr("id")
			location = "getGym?id="+id;
		})
	});
	function fn_paging(page){
			location = "getGymList?page="+page+"&search="+$("#search_text").val();
	}
	function search(){
			location = "getGymList?search="+$("#search_text").val();
	}
</script>
	
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">헬스장 리스트</h1>
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
					<div class="panel-heading">헬스장 상세목록</div>
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
										<td>${list.address.concat(' ').concat(list.address_detail)}</td>
										<td>${list.tel_number}</td>
										<td>${list.email}</td>
									</tr>
								</c:forEach>
							</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		<!-- 페이징 -->
	<div align="center">
		<c:if test="${pagination.curPage ne 1 }">
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
	
	<div>	총 게시글 수 : ${pagination.listCnt } 
			/ 총 페이지 수 :${pagination.pageCnt } 
			/ 현재 페이지 : ${pagination.curPage } 
			/ 현재 블럭  : ${pagination.curRange} 
			/ 총 블럭 수 : ${pagination.rangeCnt }
	</div>
</body>
</html>