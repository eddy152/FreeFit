<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<style type="text/css">
ul {display: table;}
li {list-style-type: none; float: left; margin-left: 5px; margin-bottom: 5px; display: table-cell;}
</style>
<title>Insert title here</title>
</head>
<body>
	<div>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="false">
			<c:set value="0" var="num" />
			<c:set value="0" var="num1" />
			<ol class="carousel-indicators">
				<c:forEach items="${list}" var="list">
					<c:choose>
						<c:when test="${num eq 0}">
							<li data-target="#carouselExampleIndicators" data-slide-to="${num }" class="active"></li>
						</c:when>
						<c:otherwise>
							<li data-target="#carouselExampleIndicators" data-slide-to="${num }"></li>
						</c:otherwise>
					</c:choose>
					<c:set value="${num + 1}" var="num" />
				</c:forEach>
			</ol>
			<div class="carousel-inner">
				<c:forEach items="${list}" var="list">
					<c:choose>
						<c:when test="${num1 eq 0}">
							<div class="carousel-item active">
								<div class="box">
									<iframe width="500" height="300" src="https://www.youtube.com/embed/${list.exer_url }"?rel=0&amp;autoplay=1&mute=1&amp;loop=1;playlist=${list.exer_url }" frameborder="0"></iframe>
								</div>
								<img src="" class="d-block w-100" alt="">
								<ul>
									<li>${list.user_id}</li>
									<li>${list.exer_count}</li>
									<li>${list.exer_date}</li>
									<li>${list.exer_end_date}</li>
									<li>${list.exer_weight}</li>
									<li>${list.exer_do_count}</li>
									<li>${list.exep_no}</li>
									<li>${list.exe_no}</li>
									<li>${list.epd_set}</li>
									<li>${list.exer_do_set}</li>
									<li>${list.exe_name}</li>
									<li>${list.exe_part}</li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item">
								<img src="" class="d-block w-100" alt="">
								<ul>
									<iframe width="500" height="300" src="https://www.youtube.com/embed/${list.exer_url }"?rel=0&amp;autoplay=1&mute=1&amp;loop=1;playlist=${list.exer_url }" frameborder="0"></iframe>
									<li>${list.user_id}</li>
									<li>${list.exer_count}</li>
									<li>${list.exer_date}</li>
									<li>${list.exer_end_date}</li>
									<li>${list.exer_weight}</li>
									<li>${list.exer_do_count}</li>
									<li>${list.exep_no}</li>
									<li>${list.exe_no}</li>
									<li>${list.epd_set}</li>
									<li>${list.exer_do_set}</li>
									<li>${list.exe_name}</li>
									<li>${list.exe_part}</li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
					<c:set value="${num1 + 1}" var="num1" />
				</c:forEach>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</body>
</html>