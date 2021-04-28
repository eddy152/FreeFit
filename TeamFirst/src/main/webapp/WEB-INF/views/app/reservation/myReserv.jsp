<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<div class="col-md-9 pr-30 padding-top-40">
		<div align="center">
			<h2>예약 관리</h2>
		<table class="table">
			<tr style="background-color: #D9D7D9;">
				<th>트레이너</th>
				<th>예약일</th>

			</tr>
			<c:forEach items="${ reserv}" var="res">
			<tr>
			
			<td>${res.trainer_name }</td>
			<td>${fn:split(res.reservation_date,'T')[0] } ${ fn:split(res.reservation_date,'T')[1] }</td>
			
			</tr>
			</c:forEach>
		</table>
		<button class="btn btn-dark" id="backBt" type="button" onclick="location.href='insertReserv'">예약하기</button>

	</div>
	</div>
