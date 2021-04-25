<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){  
		$("#btnRsv").on("click", function(){
			var form = document.createElement('form');
			var objs;
			
			objs = document.createElement('input');
			objs.setAttribute('type', 'hidden');
			objs.setAttribute('name', 'user_id');
			objs.setAttribute('value', "${list.id}");
			
			form.appendChild(objs);
			form.setAttribute('method', 'post');
			form.setAttribute('action', "getSearchExerciseRecord");
			
			document.body.appendChild(form);
			
			form.submit();
		})
		
		$("#btnPro").on("click", function(){
			var form = document.createElement('form');
			var objs;
			
			objs = document.createElement('input');
			objs.setAttribute('type', 'hidden');
			objs.setAttribute('name', 'user_id');
			objs.setAttribute('value', "${list.id}");
			
			form.appendChild(objs);
			form.setAttribute('method', 'post');
			form.setAttribute('action', "getSearchExerciseProgramPersonal");
			
			document.body.appendChild(form);
			
			form.submit();
		})
	});
</script>
<title>getFFUserProc</title>
</head>
<body>
		<div class="col-md-9 pr-30 padding-top-40">
		<div align="center">
			<h2>회원 운동관리 상세페이지</h2>
		<table class="table">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>나이</th>
				<th>키</th>
				<th>몸무게</th>
				<th>BMI</th>
				<th>판정</th>
				<th>성별</th>
				<th>피트니스ID</th>
				<th>참고사항</th>
			</tr>
			<tr>
				<td>${list.id}</td>
				<td>${list.name}</td>
				<td id="phoneNumber">${list.phone_number}</td>
				<td>${list.age}</td>
				<c:choose>
					<c:when test="${list.height eq null || list.height eq 0}">
						<td>No Data</td>
					</c:when>
					<c:otherwise>
						<td>${list.height}cm</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${list2.weight eq null || list2.weight eq 0}">
						<td>No Data</td>
					</c:when>
					<c:otherwise>
						<td>${list2.weight}kg</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${list.height ne null && list2.weight ne null}">
						<c:set var="height" value="${list.height * list.height / 10000}"/>
						<c:set var="bmi" value="${list2.weight / height}"  />
						<td><fmt:formatNumber value="${bmi }" pattern=".00" /></td>
						<c:choose>
							<c:when test="${bmi < 18.5}">
								<td>저체중</td>
							</c:when>
							<c:when test="${bmi >= 18.5 && bmi <= 25}">
								<td>정상체중</td>
							</c:when>
							<c:when test="${bmi > 25}">
								<td>과체중</td>
							</c:when>
						</c:choose>						
					</c:when>
					<c:otherwise>
						<td>No Data</td>
						<td>No Data</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${list.gender eq 1}">
						<td>남자</td>
					</c:when>
					<c:when test="${list.gender eq 2}">
						<td>여자</td>
					</c:when>
					<c:otherwise>
						<td>No Data</td>						
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${list.fitness_id ne null}">
						<td>${list.fitness_id }</td>
					</c:when>
					<c:otherwise>
						<td>No Data</td>						
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${list.notice ne null}">
						<td>${list.notice}</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>						
					</c:otherwise>
				</c:choose>
				<c:if test="">
					
				</c:if>
			</tr>
		</table>
		<button  class="btn btn-primary"  onclick="history.back()">뒤로 가기</button>
		<button  class="btn btn-primary" id="btnRsv">운동기록</button>
		<button  class="btn btn-primary"  id="btnPro">프로그램</button>
	</div>
	</div>
</body>
</html>