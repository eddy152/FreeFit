<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var arr = {};
	var exep_no;
	var user_id;
	
	$(function() {
		$(".exeProgram").on("click", function() {
			var pTr = $(this).children(":eq(4)").children();
			
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
						$("#" + exep_no).append(
							"<ul>" +
							"<li><button class='exeStart'>운동 시작하기</button></li>" +
							"<li><button class='exeDel'>삭제하기</button></li>" +
							"</ul>"
						);
						
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
						
						arr[exeName] = {"epd_set":epdSet , "exer_count":epdCount , "exer_weight":epdWeight, "exe_no":exeNo, "exep_no":exepNo, "user_id":userId };
					}
					
					var exeStartNow = confirm( '운동을 시작하시겠습니까?' );
					if(exeStartNow) {
						var result = JSON.stringify(arr);
							
						$.ajax({
							url: "insertExerciseRecord", 
							method: 'POST',
							data: result,
							traditional: true,
							dataType:'json',
							contentType : 'application/json',
							success: function(result) {
								alert("등록성공");
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
				}
			}) // End of ajax
		})
		
		$(document).on("click", "#prAdd", function() {
			$.ajax({
				url: "insertExerciseProgramPersonalForm",
				//data: {user_id : user_id},
				type: 'post',
				success: function(result) {
					window.name = "parentForm";
					var myForm = document.popForm;
			        window.open("", "popForm"
			                	, "childForm", "width=800", "height=500", "resizable = no", "scrollbars = no");
					myForm.action = "insertExerciseProgramPersonalForm";
					myForm.method = "post";
					myForm.target = "popForm";
					myForm.submit();
				}
			}) // End of Ajax
		})
	})
</script>
<style type="text/css">
ul {display: table;}
li {list-style-type: none; float: left; margin-left: 5px; margin-bottom: 5px; display: table-cell;}
</style>
</head>
<body>
	<div align="center">
		<div id="accordion">
			<ul>
				<li>프로그램명</li>
				<li>유저아이디</li>
				<li>트레이너</li>
				<li>등록일</li>
				<li>열기</li>
			</ul>
			
			<c:forEach items="${list}" var="list">
				<div>
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
		</div>
		<button onclick="history.back()">뒤로 가기</button>
		<button type="button" id="prAdd">추가하기</button>
	</div>
</body>
</html>