<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<div>
<h2>ȸ�� �Ĵ� ����Ʈ</h2>
</div>
<br>

<div>
<table class="table">
  <thead>
    <tr>
      <th scope="col">�̸�</th>
      <th scope="col">����</th>
      <th scope="col">����</th>
      <th scope="col">��ȣ</th>
      <th scope="col">��</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="list" items="${list }">
    <tr>
      <td>${list.name }</td>
      <td>${list.age }</td>
      <c:if test="${list.gender eq '1' }">
      <td>����</td>
      </c:if>
      <c:if test="${list.gender eq '2' }">
      <td>����</td>
      </c:if>
      <c:if test="${list.gender ne '2' && list.gender ne '1' }">
      <td>X</td>
      </c:if>
      <td>${list.phone_number }</td>
      <td><a href="getMemberFoodList?id=${list.id}">�󼼺���</a>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>