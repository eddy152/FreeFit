<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	
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
		<div class="row justify-content-center">
			<div class="col-lg-10" id="divTag1">
				<!--게시판 넓이 -->
				<div class="col justify-content-center mb-4 text-center">
					<h1 align="center" class="page-header">프리핏 이용 헬스장</h1>
					<p class="text-center">프리핏을 이용중인 헬스장 목록입니다.</p>
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
						<table class="table table-hover">
							<thead>
								<tr class="bg-secondary text-white text-center">
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