<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<div>
<h2>회원 식단 리스트</h2>
</div>
<br>

<div>
<table class="table">
  <thead>
    <tr>
      <th scope="col">이름</th>
      <th scope="col">나이</th>
      <th scope="col">성별</th>
      <th scope="col">번호</th>
      <th scope="col">상세</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="list" items="${list }">
    <tr>
      <td>${list.name }</td>
      <td>${list.age }</td>
      <c:if test="${list.gender eq '1' }">
      <td>남자</td>
      </c:if>
      <c:if test="${list.gender eq '2' }">
      <td>여자</td>
      </c:if>
      <c:if test="${list.gender ne '2' && list.gender ne '1' }">
      <td>X</td>
      </c:if>
      <td>${list.phone_number }</td>
      <td><a href="getMemberFoodList?id=${list.id}">상세보기</a>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>