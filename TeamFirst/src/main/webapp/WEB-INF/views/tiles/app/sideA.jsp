<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	<div class="sidebar-sticky pt-1">
		<ul class="nav flex-column nav-fills">
		<!-- 	<li class="nav-item"><a class="nav-link active"
				href="/spring/appMain"> <span data-feather="home"></span>메인
					<span class="sr-only">(current)</span>
			</a></li> -->
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
			<li class="nav-item"><a class="nav-link"
				href="/spring/appNoticeList"> <span data-feather="user-check"></span>
					유저 공지사항
			</a> <a class="nav-link" href="/spring/getAppFoodList"> <span
					data-feather="user-check"></span> 추천식단리스트
			</a> <sec:authorize access="hasRole('ROLE_USER')">
					<a class="nav-link" href="/spring/getEachMember"> <span
						data-feather="user-check"></span> 식단관리
					</a>
					<a class="nav-link" href="#"
						onclick="javascript:document.myForm.submit();"> <span
						data-feather="file"></span> 운동(개인용)
					</a>
					<a class="nav-link" href="/spring/insertReserv"> <span
						data-feather="user-check"></span>트레이너예약
					</a>
					<a class="nav-link" href="/spring/myReserv"> <span
						data-feather="user-check"></span>예약관리
					</a>
				</sec:authorize> <sec:authorize access="hasRole('ROLE_TRAINER')">
					<a class="nav-link" href="/spring/Test"> <span
						data-feather="user-check"></span> 회원식단관리(트레이너용)
					</a>
					<a class="nav-link" href="/spring/getSearchFFUser"> <span
						data-feather="file"></span> 회원 운동 관리(트레이너용)
					</a>
<a class="nav-link" href="/spring/getTrainerReserv"> <span
						data-feather="user-check"></span>예약확인
					</a>
				</sec:authorize></li>

		</ul>
		<ul class="nav flex-column mb-2">
			<li class="nav-item text-nowrap"><a class="nav-link"
				id="loginBtn"> 로그인</a></li>
		</ul>
	</div>
</nav>