<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locker/getSearchLocker.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	
	
 	function showLock(e) {
		var url = 'http://localhost/spring/getLocker?lock_no='+ e
		window.open(url, "getLocker", "width=400, height=300, left=100, top=50");
	}
 	
 	function updateLocker() {
		var url = 'http://localhost/spring/getSearchRoom';
		window.open(url, "lockerRoom", "width=400, height=300, left=100, top=50");
	}
	 
	/* function showLock(e){
		 
	var target = document.querySelectorAll('#btn');
    target.forEach(function(e){
        e.addEventListener('click',function(){
        	var url = 'http://localhost/spring/getLocker?lock_no='+ e
    		window.open(url, "getLocker", "width=400, height=300, left=100, top=50");
    	    });
	    });
	
	 } */
	 
	
</script>

<style type="text/css">
.float {
	float: right;
	border: 1px solid gold;
	width: 30%;
	height: 700px;
	align-content: center;
}

.w3-container {
	float: left;
	width: 70%;
}

#center {
	display: inline-block;
	width: 50%;
	height: 100px;
	margin:0 auto; 
}

</style>
<!-- 
<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<div class="w3-container">
	<h3>락커관리</h3>
	<input type="button" onclick="updateLocker()" value="관리">
	<button>남자</button>
	&nbsp;
	<button>여자</button>
	<hr>
		<c:forEach var="locker" items="${list }">
			<button id="btn" onclick="showLock(${locker.lock_no })" class="w3-button w3-xlarge w3-black">${locker.lock_no }</button>
		</c:forEach>
	</div>

	<div class="float">
	<h3>락커 상세보기</h3>
	<br>
		<div id="center">
		<table border="1">
			<tr>
				<td width="150px">락커 번호</td>
				<td width="100px">${locker.lock_no }</td>
			</tr>
			<tr>
				<td>멤버쉽 등록 번호</td>
				<td>${locker.mem_reg_id }</td>
			</tr>
			<tr>
				<td>고장 여부</td>
				<td>${locker.first_date }</td>
			</tr>
			<tr>
				<td>종료일</td>
				<td>${locker.final_date }</td>
			</tr>
			<tr>
				<td>유저아이디</td>
				<td>${locker.user_id }</td>
			</tr>
			<tr>
				<td>락커룸 번호</td>
				<td>${locker.room_no }</td>
			</tr>
		</table>
		<br><br>
		</div>
		
			<div>
				<button>추가</button>&nbsp;
				<button>수정</button>&nbsp;
				<button>삭제</button>&nbsp;
			</div>
	</div>

</body>
</html>