<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	<div class="sidebar-sticky pt-1">
		<ul class="nav flex-column nav-fills">
			<li class="nav-item">
				<a class="nav-link active" href="/spring/tilesTestApp">
					<span data-feather="home"></span>메인(임시)
					<span class="sr-only">(current)</span>
				</a>
			</li>
			<!-- <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">
					<span data-feather="user-check"></span> 식단
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/spring/getAppFoodList">추천식단리스트</a>
					<a class="dropdown-item" href="/spring/Test">회원식단관리(트레이너용)</a>
					<a class="dropdown-item" href="#">식단관리(개인용,없음)</a>
				</div>
			</li>  -->
			<li class="nav-item">
				<a class="nav-link" href="/spring/appNoticeList">
					<span data-feather="user-check"></span> 유저 공지사항
				</a>
				<a class="nav-link" href="/spring/getAppFoodList">
					<span data-feather="user-check"></span> 추천식단리스트
				</a>
				<a class="nav-link" href="/spring/Test">
							<span data-feather="user-check"></span> 회원식단관리(트레이너용)
				</a>
				<a class="nav-link" href="#">
							<span data-feather="user-check"></span> 식단관리(개인용,없음)
				</a>
				<c:choose>
					<c:when test="">
						<a class="nav-link" href="/spring/Test">
							<span data-feather="user-check"></span> 회원식단관리(트레이너용)
						</a>
					</c:when>
					<c:when test="">
						<a class="nav-link" href="#">
							<span data-feather="user-check"></span> 식단관리(개인용,없음)
						</a>
					</c:when>
				</c:choose>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/spring/getSearchFFUser">
					<span data-feather="file"></span> 회원 운동 관리(트레이너용)
				</a>
				<form name="myForm" action="getFFUserProc" method="POST">
					<input type="hidden" name="id" value="some_value1" />
					<input type="hidden" name="user_id" value="some_value2" />
				</form>
				<a class="nav-link" href="#" onclick="javascript:document.myForm.submit();">
					<span data-feather="file"></span> 운동(개인용)
				</a>
				<c:choose>
					<c:when test="">
						<a class="nav-link" href="/spring/getSearchFFUser">
							<span data-feather="file"></span> 회원 운동 관리(트레이너용)
						</a>
					</c:when>
					<c:when test="">
						<form name="myForm" action="getFFUserProc" method="POST">
							<input type="hidden" name="id" value="some_value1" />
							<input type="hidden" name="user_id" value="some_value2" />
						</form>
						<a class="nav-link" href="#" onclick="javascript:document.myForm.submit();">
							<span data-feather="file"></span> 운동(개인용)
						</a>
					</c:when>
				</c:choose>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/spring/tilesTestHomepage">
					<span data-feather="user-check"></span> 홈페이지로
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/spring/tilesTestProgram">
					<span data-feather="thumbs-up"></span> 프로그램쪽으로
				</a>
			</li>
		</ul>
		<ul class="nav flex-column mb-2">
			<li class="nav-item text-nowrap">
				<a class="nav-link"id="loginBtn"> 로그인</a>
			</li>
		</ul>
	</div>
</nav>