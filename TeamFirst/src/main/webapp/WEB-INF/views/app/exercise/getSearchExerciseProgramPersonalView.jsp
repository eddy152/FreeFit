<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript">
	var arr = {};
	var exep_no;
	var user_id;
	
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
									"<li>" + rs.epd_set + "세트" +
									"<input type='hidden' name='exe_no' value=" + rs.exe_no + ">" +
									"<input type='hidden' name='exep_name' value=" + rs.exe_name + "></li>" +
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
								"<li><button id='exePut'>전달하기</button></li>" +
								"<li><button class='exeDel'>삭제하기</button></li>" +
								"</ul>"
							);	
						} else {
							$("#" + exep_no).append(
								"<ul>" +
								"<li>저장된 루틴이 없습니다.</li>" +
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
		
		$(document).on("click", ".exeDel", function() {
			$.ajax({
				url: "deleteExerciseProgramPersonal", 
				method: 'POST',
				data: "user_id=" + user_id + "&exep_no=" + exep_no,
				success: function(result) {
					alert("삭제 완료");
					
					var form = document.createElement('delform');
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
			                	, "childForm", "width=800", "height=500", "resizable = no", "scrollbars = no");
					myForm.action = "insertExerciseProgramPersonalForm";
					myForm.method = "post";
					myForm.target = "popForm";
					myForm.submit();
					
					alert("등록 완료");
					window.close();
				}
			}) // End of Ajax
		})
		
		$(document).on("click", "#exePut", function() {
			var exeNo = '';
			var inputExeNo = $("input[name=exe_no]");
			
			opener.$("#exeNameTbl tr").remove();
			opener.$("#exeNameTbl").append('<tr><td>운동 목록</td><td>설정 횟수</td></tr>');
			for(var i = 0; i < inputExeNo.length; i++) {
        		exeNo = inputExeNo[i].value;
        		var exeName = $("input[name=exep_name]")[i].value;
	        		
        		console.log(exeNo, exeName);
        		opener.$("#exeNameTbl").append('<tr name="exeNameTr"><td id=' + exeNo + '>' + exeName + '</td><td id=' + exeName + 'set></td></tr>');
        	}
	        alert("등록 완료");
		});
	})
</script>
<style type="text/css">
ul {display: table;}
li {list-style-type: none; float: left; margin-left: 5px; margin-bottom: 5px; display: table-cell;}
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:1.2em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
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
			<form name="popForm">
			</form>
		</div>
		<button type="button" id="prAdd" onclick="window.close()">창 닫기</button>
		<button type="button" id="prAdd">프로그램 추가하기</button>
	</div>
</body>
</html>