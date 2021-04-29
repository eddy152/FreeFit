<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
	var arr = {};
	var exep_no;
	var user_id = $(".user_id").val();
	
	$(function() {
		$(".exeProgram").on("click", function() {
			var pTr = $(this).children(":eq(4)").children();
			var exeCheckName; 
			
			exep_no = $(this).children(":eq(0)").children().val();
			user_id = $(this).children(":eq(1)").children().val();
			
			$.ajax({
				url: "getExercisePersonalDetailProc", 
				method: 'POST',
				data: "user_id=" + user_id + "&exep_no=" + exep_no,
				success: function(result) {
					var ulLi = "";
					if(pTr.text() == "▼") {
						$(".postnTab").text("▼")
						$(".exeList").empty();
						$(".exeList").slideUp();
						pTr.text("▲")
						
						for(rs of result){
							exeCheckName = rs.exe_name;
							
							ulLi = "<ul>" +
									"<li>" + rs.exe_name + "</li>" +
									"<li>" + rs.epd_set + "세트</li>" +
									"<li>" + rs.epd_count + "회</li>"
									
							if(rs.epd_weight != 0) {
								ulLi += "<li>" + rs.epd_weight + "kg</li></ul>";
							} else {
								ulLi += "<li>무게 없음</li></ul>";
							}
							$("#" + exep_no).append(ulLi);
						}
						if(exeCheckName != null) {
							$("#" + exep_no).append(
								"<ul>" +
								"<li><button class='exeStart'>운동 시작하기</button></li>" +
								"<li><button class='exeDel'>삭제하기</button></li>" +
								"</ul>"
							);	
						} else {
							$("#" + exep_no).append(
								"<ul>" +
								"<li><button class='exeAdd'>운동 추가하기</button></li>" +
								"<li><button class='exeDel'>삭제하기</button></li>" +
								"</ul>"
							);
						}
						
						$("#" + exep_no).slideDown();
					} else {
						pTr.text("▼")
						$("#" + exep_no).empty();
						$("#" + exep_no).slideUp();
					}
				}
			})  // End of ajax
		})
		
		$(document).on("click", ".exeStart", function() {
			$.ajax({
				url: "getExercisePersonalDetailProc", 
				method: 'POST',
				data: "user_id=" + user_id + "&exep_no=" + exep_no,
				success: function(result) {
					
					for(rs of result){
						var exeName = rs.exe_name;
						var epdSet = rs.epd_set;
						var epdCount = rs.epd_count;
						var epdWeight = rs.epd_weight;
						var exeNo = rs.exe_no;
						var exepNo = rs.exep_no;
						var userId = rs.user_id;
						var exeUrl = rs.exe_url;
						
						arr[exeName] = {"epd_set":epdSet , "exer_count":epdCount , "exer_weight":epdWeight, "exe_no":exeNo, "exep_no":exepNo, "user_id":userId, "exe_url":exeUrl };
					}
					
					var exeStartNow = confirm( '운동을 시작하시겠습니까?' );
					if(exeStartNow) {
						var arrExe = JSON.stringify(arr);
							
						$.ajax({
							url: "insertExerciseRecord", 
							method: 'POST',
							data: arrExe,
							traditional: true,
							dataType:'json',
							contentType : 'application/json',
							success: function(rs) {
								alert("등록성공");
								
								var form = document.createElement('form');
								var objs;
								var objs2;

								objs = document.createElement('input');
								objs.setAttribute('type', 'hidden');
								objs.setAttribute('name', 'user_id');
								objs.setAttribute('value', user_id);

								objs2 = document.createElement('input');
								objs2.setAttribute('type', 'hidden');
								objs2.setAttribute('name', 'exep_no');
								objs2.setAttribute('value', exep_no);

								form.appendChild(objs);
								form.appendChild(objs2);
								form.setAttribute('method', 'post');
								form.setAttribute('action', "doExerciseProgram");

								document.body.appendChild(form);

								form.submit();
							}
						})  // End of ajax
					} else {
						arr = {};
					}
				}
			})
		})
		
		$(document).on("click", ".exeDel", function() {
			$.ajax({
				url: "deleteExerciseProgramPersonal", 
				method: 'POST',
				data: "user_id=" + user_id + "&exep_no=" + exep_no,
				success: function(result) {
					alert("삭제 완료");
					
					var form = document.createElement('form');
					var objs;
					
					objs = document.createElement('input');
					objs.setAttribute('type', 'hidden');
					objs.setAttribute('name', 'user_id');
					objs.setAttribute('value', user_id);
					
					form.appendChild(objs);
					form.setAttribute('method', 'post');
					form.setAttribute('action', "getSearchExerciseProgramPersonal");
					
					document.body.appendChild(form);
					
					form.submit();
				}
			}) // End of ajax
		})
		
		$(document).on("click", "#prAdd", function() {
			$.ajax({
				url: "insertExerciseProgramPersonalForm",
				data: {user_id : user_id},
				type: 'post',
				success: function(result) {
					window.name = "parentForm";
					var myForm = document.popForm;
			        window.open("", "popForm"
			                	, "childForm", "width=500", "height=500", "resizable = no", "scrollbars = no");
					myForm.action = "insertExerciseProgramPersonalForm";
					myForm.method = "post";
					myForm.target = "popForm";
					myForm.submit();
				}
			}) // End of Ajax
		})
		$(document).on("click", ".exeAdd", function() {
			var form = document.createElement('form');
			var objs;
			var objs2;
			
			objs = document.createElement('input');
			objs.setAttribute('type', 'hidden');
			objs.setAttribute('name', 'id');
			objs.setAttribute('value', user_id);
			
			objs2 = document.createElement('input');
			objs2.setAttribute('type', 'hidden');
			objs2.setAttribute('name', 'exep_no');
			objs2.setAttribute('value', exep_no);
			
			form.appendChild(objs);
			form.appendChild(objs2);
			form.setAttribute('method', 'post');
			form.setAttribute('action', "getSearchExerciseProgramBasic");
			
			document.body.appendChild(form);
			
			form.submit();
		})
		
		$(document).on("click", "#goToBack", function() {
			var form = document.createElement('form');
			user_id = $(".user_id").val();
			var objs;
			var objs2;
			
			objs = document.createElement('input');
			objs.setAttribute('type', 'hidden');
			objs.setAttribute('name', 'id');
			objs.setAttribute('value', user_id);
			
			objs2 = document.createElement('input');
			objs2.setAttribute('type', 'hidden');
			objs2.setAttribute('name', 'user_id');
			objs2.setAttribute('value', user_id);
			
			form.appendChild(objs);
			form.appendChild(objs2);
			form.setAttribute('method', 'post');
			form.setAttribute('action', "getFFUserProc");
			
			document.body.appendChild(form);
			
			form.submit();
		})
	})
</script>
<style type="text/css">
ul {display: table;}
li {list-style-type: none; float: left; margin-left: 5px; margin-bottom: 5px; display: table-cell;}
</style>
</head>
<body>
<div>
	<div align="center" style="width: 480px">
		<div id="accordion" align="center">
			<ul>
				<li>프로그램명</li>
				<li>유저아이디</li>
				<li>트레이너</li>
				<li>등록일</li>
				<li>열기</li>
			</ul>
			<c:forEach items="${list}" var="list">
				<div align="center">
					<ul class="exeProgram">
						<li>
							${list.exep_name}
							<input type="hidden" name="exep_no" class="exep_no" value="${list.exep_no }">
						</li>
						<li>
							${list.user_id}
							<input type="hidden" name="user_id" class="user_id" value="${list.user_id }">
						</li>
						<c:choose>
							<c:when test="${list.trainer_id ne null}">
								<li>${list.trainer_id}</li>
							</c:when>
							<c:when test="${list.trainer_id eq null}">
								<li>개인용</li>
							</c:when>
						</c:choose>
						<li><fmt:formatDate value="${list.exep_date}" pattern="yyyy-MM-dd" /></li>
						<li><font class="postnTab">▼</font></li>
					</ul>
					<ul id="${list.exep_no }" class="exeList" style="display: none;">
					</ul>
				</div>
			</c:forEach>
			<form name="popForm">
			</form>
		</div>
		<button type="button" class="btn btn-primary" id="goToBack">뒤로 가기</button>
		<button type="button" class="btn btn-primary" id="prAdd">추가하기</button>
	</div>
</div>
</body>
</html>