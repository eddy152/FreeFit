<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<title>appNoticeist.jsp</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-15">
				
				
				  <div class="card card-cascade narrower">

                    <!--Card header-->
                    <div class="view view-cascade py-3 gradient-card-header info-color-dark mx-4 d-flex justify-content-between align-items-center">

                        <div>
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                                <i class="fa fa-th-large mt-0"></i>
                            </button>
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                                <i class="fa fa-columns mt-0"></i>
                            </button>
                        </div>

                        <a class="white-text mx-3">앱  공지사항</a>

                        <div>
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
																<i class="fas fa-pencil-alt mt-0"></i>                            </button>
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                                <i class="fas fa-times mt-0"></i>
                            </button>
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                                <i class="fa fa-info-circle mt-0"></i>
                            </button>
                        </div>
                    </div>
								<c:forEach items="${uList}" var="us">
							 	<span class="subject-add">
							 		<span class="subjectin">제목 ${us.title}</span>
							 	</span>
									<ul class="dataRow">
										<li>No		${us.board_no} |
											조회수  	${us.hit} |
											등록일 <fmt:formatDate value="${us.reg_date}"
												pattern="yyyy-MM-dd" /></li>
									</ul>
								</c:forEach>
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
</div>
</body>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			var no = $(this)
			console.log(no);
			console.log(no.value);
		//	location ="appNoticeUserh?board_no="+no;
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