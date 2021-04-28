<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	<div class="page-wrapper">
		<div class="row justify-content-center">
			<div class="col-lg-10" id="divTag1">
				<!--게시판 넓이 -->
				<div class="col justify-content-center mb-4 text-center">
					<h1 align="center" class="page-header">공지사항</h1>
					<p class="text-center">프리핏의 소식을 안내해 드립니다.</p>
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
									<th class="" >No</th>
									<th class="">카테고리</th>
									<th class="w-50">제목</th>
									<th class="">조회수</th>
									<th class="">작성일</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr class="dataRow">
										<td class="text-center">${list.board_no}</td>
										<td class="text-center">${list.category}</td>
										<td>${list.title}</td>
										<td class="text-center">${list.hit}</td>
										<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${list.reg_date}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					
				</div>
				<!-- 
				어차피 어드민으로는 로그인해서 뭐 안보여줄거라서 버튼 숨김
				<div class="row justify-content-end">
				<input type="button" class="btn btn-secondary" value="작성하기" onclick="location.href='adminBoard';">style="float: right;" 
				</div> -->
			</div>
		</div>
	</div>
	
	<!-- 페이징 -->
	<div class="row justify-content-center ">
		<c:if test="${pagination.curRange ne 1 }">
		   <a href="#" class="text-secondary px-2" onClick="fn_paging(1)" >[처음]</a>
		</c:if>
		<c:if test="${pagination.curPage ne 1}"	>
		   <a href="#" class="text-secondary px-2" onClick="fn_paging('${pagination.prevPage }')">◀</a>
		</c:if>
		
		<c:forEach var="pageNum" begin="${pagination.startPage }"
				   end="${pagination.endPage }">
		  <c:choose>
		    <c:when test="${pageNum eq  pagination.curPage}">
		      <span style="font-weight: bold;"><a href="#"  class="text-secondary px-2"
					onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
			</c:when>
			<c:otherwise>
					<a href="#" class="text-secondary px-2" onClick="fn_paging('${pageNum }')">${pageNum }</a>
			</c:otherwise>
		  </c:choose>
		</c:forEach>
		<c:if
			test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href="#" class="text-secondary px-2" onClick="fn_paging('${pagination.nextPage }')">▶</a>
		</c:if>
		<c:if
			test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a href="#" class="text-secondary px-2" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
		</c:if>
	 </div>
