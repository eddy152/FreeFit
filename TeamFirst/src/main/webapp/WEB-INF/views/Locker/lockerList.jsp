<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locker/lockerList.jsp</title>
<script type="text/javascript">
	function showLock() {
		window.open("showLockMember.jsp", "showLockMember", "width=400, height=300, left=100, top=50");
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<h1>락커관리</h1>

&nbsp;&nbsp;&nbsp;&nbsp;<button>관리</button>
<hr>

<div class="w3-container">
  <button class="w3-button w3-xlarge w3-black" onclick="showLock()">1</button>
  <button class="w3-button w3-xlarge w3-black" onclick="showLock()">2</button>
  <button class="w3-button w3-xlarge w3-black" onclick="showLock()">3</button>
</div>
</body>
</html>