<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).on("click", "#exePut", function() {
		var exeNo = '';
		var inputExeNo = $("input[name=exe_no]");
		
		opener.$("#exeNameTbl tr").remove();
		opener.$("#exeNameTbl").append('<tr><td>운동 목록</td><td>설정 횟수</td></tr>');
		for(var i = 0; i < inputExeNo.length; i++) {
			
        	for(var j = 0; j < inputExeNo.length; j++) {
        		if($("input[name=exep_no" + i +"]")[j] != null) {
        			var exeName = $("input[name=exep_no" + i +"]")[j].value;
        			exeNo = inputExeNo[j].value;
        			opener.$("#exeNameTbl").append('<tr name="exeNameTr"><td id=' + exeNo + '>' + exeName + '</td><td id=' + exeName + 'set></td></tr>');
        		}
        	}
    	}
	});
</script>
</head>
<body>
	<div style="float: left; width: 60%; padding: 10px;">
		<table>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.epd_no }</td>
					<td>${list.exep_no }</td>
					<td>${list.exe_no }</td>
					<td>${list.epd_set }</td>
					<td>${list.epd_count }</td>
					<td>${list.epd_weight }</td>
					<td>${list.user_id }</td>
					<td>${list.exe_name }</td>
					<td><input type="text" name="exe_no" value="${list.exe_no }"></td>
					<td><input type="text" name="exep_no${list.exep_no}" value="${list.exe_name }"></td>
				</tr>
			</c:forEach>
		</table><br>
	    <b><font size="5" color="gray">자식창</font></b><br><br>
	    <input type="button" value="전달하기" id="exePut"><br><br>
	    <input type="button" value="창닫기" onclick="window.close()">
	</div>
</body>
</html>