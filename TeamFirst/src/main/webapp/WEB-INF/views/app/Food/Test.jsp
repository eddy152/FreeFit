<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<div>

<h2>회원 식단 리스트</h2>
<br>
<c:forEach var="list" items="${list }">
	<div class="card" style="width: 18rem;">
	  <div class="card-body">
	    <h5 class="card-title">${list.name }</h5>
	  </div>
	  <ul class="list-group list-group-flush">
	    <li class="list-group-item">${list.name }</li>
	    <li class="list-group-item">${list.gender }</li>
	    <li class="list-group-item">${list.phone_number }</li>
	  </ul>
	  <div class="card-body">
	    <a href="getMemberFoodList?id=${list.id}" class="card-link">식단상세</a>
	  </div>
	</div>
	<br>
</c:forEach>
</div>
