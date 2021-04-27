<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<div class="row mb-5">
<h2>회원 식단 리스트</h2>
</div>
<div class="row">

<br>
<c:forEach var="list" items="${list }">
	<div class="card" style="width: 100%;">
	  <div class="card-body">
	    <a href="getMemberFoodList?id=${list.id}" class="card-link">${list.name }</a>
	  </div>
	  
	</div>
	<br>
</c:forEach>
</div>
