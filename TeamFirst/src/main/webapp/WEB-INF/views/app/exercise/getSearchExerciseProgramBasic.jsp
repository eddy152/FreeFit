<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
var arr = {};

$(function() {
	var part = '가슴';
	var exeName = '';
	var exepNo = $('.exep_no').val();
	var userId = $('.user_id').val();
	
	//상단 메뉴바 클릭
	$(".menuLink").on("click", function() {
						part = $(this)[0].id;
						$("#title").html(part);
						$("#exeTitle").html(part);
	});  // End of a

	//좌측 메뉴 클릭
	$(document).on("click", "a[name=exeKinds]", function() {
		var kinds = $(this)[0].text;
		if(kinds == '전체') {
			$.ajax({
				url: 'getSearchExerciseListAll?&exe_part=' + part,  // 서버 url
				type: 'get',
				success: function(result) {
					$("#exe").html(result);
				}
			})  // End of ajax
		}
		else{
			$.ajax({
				url: 'getSearchExerciseList?exe_kinds=' + kinds + '&exe_part=' + part,  // 서버 url
				type: 'get',
				success: function(result) {
					$("#exe").html(result);
				}
			})  // End of ajax
		}
	})  // End of exeKinds
	
	
	//운동 목록 추가하기
	$(document).on("click", "button[name=exeName]", function() {
		var exeName = $(this)[0].innerText;
		var exeNo = $(this)[0].id;
		var exeNameTr = document.getElementsByName("exeNameTr");
		var findExeName = false;
			for (var i = 0; i < exeNameTr.length; i++) {
				if (exeNameTr[i].firstChild.innerText == exeName) {
					alert("중복된 값이 존재 합니다..");
					findExeName = true;
					return ;
				} 
			}
			if(findExeName != true) {
				$("#exeNameTbl").append('<tr name="exeNameTr"><td id=' + exeNo + '>' + exeName + '</td><td id=' + exeName + 'set></td></tr>');
			}
		}); // End of exeName
	
	// 하단 우측 세트 수
	$(document).on("click", "tr[name=exeNameTr]", function() {
		exeName = $(this)[0].firstChild.innerText;
		exeNo = $(this)[0].firstChild.id
		$("#exeSet").children().remove();
		$("#divThird button").remove();
		$("#divThird p").remove();
		
		$("#exeSet").append('<tr><th colspan="2"><input type="text" readonly="readonly" id="exeName" value=' + exeName + '></th>'
		+ '<tr><td name="sets">세트수</td>'
		+ '<td><input type="number" name=epd_set></td></tr>'
		+ '<tr><td name="count">횟수</td>'
		+ '<td><input type="number" name=epd_count></td></tr>'
		+ '<tr><td name="weight">무게</td>'
		+ '<td><input type="number" name="epd_weight" value="0"></tr>')
		
		$("#exeSet").append('<input type="hidden" name=exe_no value=' + exeNo + '>');
		$("#exeSetCount").append('<button type="button" name="setDel">삭제하기</button>'
												+ '<button type="button" name="setSub">추가하기</button>');
	})// End of set
	
	//버튼 클릭 이벤트(운동 목록 삭제)
	$(document).on("click", "button[name=setDel]", function() {
		var jbResult = confirm( '운동을 삭제하시겠습니까?' );
		if(jbResult) {
			var enTr = $("#exeNameTbl tr");
			for(var i = 0; i < enTr.length; i++) {
				if(enTr[i].firstChild.innerText == $("#exeSet th input")[0].value) {
					enTr[i].remove();
					delete arr[enTr[i].firstChild.innerText];
				}
			}
			$("#exeSetCount table").children().remove();
		}
	})
	
	//버튼 클릭 이벤트(추가하기)
	$(document).on("click", "button[name=setSub]", function() {
		var exeName = $("#exeName")[0].value
		var epdSet = Number($("input[name=epd_set]")[0].value);
		var epdCount = Number($("input[name=epd_count]")[0].value);
		var epdWeight = Number($("input[name=epd_weight]")[0].value);
		var exeNo = Number($("input[name=exe_no]")[0].value);
		
		exepNo = Number($("input[name=exep_no]")[0].value);
		userId = $("input[name=user_id]")[0].value;
		
		if($("#warmingUp").val() != null) {
			arr["준비운동"] = {"epd_set":1 , "epd_count":Number($("#warmingUp").val()) , "epd_weight":0, "exe_no":0, "exep_no":exepNo, "user_id":userId };
		}

		arr[exeName] = {"epd_set":epdSet , "epd_count":epdCount , "epd_weight":epdWeight, "exe_no":exeNo, "exep_no":exepNo, "user_id":userId };
		$("#" + exeName + "set").html("세트수 : " + epdSet + " / 설정횟수 : " + epdCount + " / 설정무게 : " + epdWeight);
		
		document.getElementById("setExePr").style.display = "block";
	})
	
	//버튼 클릭 이벤트(등록하기)
	$(document).on("click", "#setExePr", function() {
			
		if(confirm("등록하시겠습니까?")){
			var result = JSON.stringify(arr);
			$.ajax({
				url: "insertExercisePersonalDetail", 
				method: 'POST',
				data: result,
				traditional: true,
				dataType:'json',
				contentType : 'application/json',
				success: function(result) {
					alert("등록성공");
					
					var form = document.createElement('form');
					var objs;

					objs = document.createElement('input');
					objs.setAttribute('type', 'hidden');
					objs.setAttribute('name', 'user_id');
					objs.setAttribute('value', userId);
					
					form.appendChild(objs);
					form.setAttribute('method', 'post');
					form.setAttribute('action', "getSearchExerciseProgramPersonal");

					document.body.appendChild(form);

					form.submit();
				}
			})  // End of ajax
		}
	})
	
	//버튼 클릭 이벤트(운동 추가 & 삭제 & 불러오기)
	$(document).on("click", "a[name=exeAdd]", function() {
		window.open("insertExerciseListForm", "insertExeForm", "width=570, height=350, resizable = no, scrollbars = no");
	})
	
	$(document).on("click", "a[name=exeDel]", function() {
		window.open("deleteExerciseListForm?exe_part=" + part , "DelExeForm", "width=570, height=350, resizable = no, scrollbars = no");
	})
	
	$(document).on("click", "a[name=exeGet]", function() {
        $.ajax({
			url: "getSearchExerciseProgramPersonalView",
			data: {user_id : $("input[name=user_id]").val(), exep_no : $("input[name=exep_no]").val()},
			type: 'post',
			success: function(result) {
				window.name = "parentForm";
				var myForm = document.popForm;
		        window.open("", "popForm"
		                	, "childForm", "width=800, height=500, resizable = no, scrollbars = no");
				myForm.action = "getSearchExerciseProgramPersonalView";
				myForm.method = "post";
				myForm.target = "popForm";
				myForm.submit();
			}
		})  // End of ajax
	})
	
});
</script>
<style type="text/css">
#topMenu {
	height: 30px;
	width: 850px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 130px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}

body {
	margin: 20px auto;
	padding: 0;
	font-family: "맑은 고딕";
	font-size: 0.9em;
}

ul#navi {
	text-indent: 10px;
}

ul#navi, ul#navi ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group {
	margin-bottom: 3px;
}

li.group div.title {
	height: 35px;
	line-height: 35px;
	background: #9ab92e;
	cursor: pointer;
}

ul.sub li {
	margin-bottom: 2px;
	height: 35px;
	line-height: 35px;
	background: #f4f4f4;
	cursor: pointer;
}

ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: #000;
}

ul.sub li:hover {
	background: #cf0;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div style="height: 800px; width: 800px;">
			<div id="div1" style="float: left; padding: 10px;">
						<nav id="topMenu">
							<ul>
								<li><a class="menuLink" id="가슴">가슴</a></li>
								<li><a class="menuLink" id="등">등</a></li>
								<li><a class="menuLink" id="이두">이두</a></li>
								<li><a class="menuLink" id="삼두">삼두</a></li>
								<li><a class="menuLink" id="하체">하체</a></li>
								<li><a class="menuLink" id="복근">복근</a></li>
							</ul>
						</nav>
				<table id="tbl1" style="height: 150px; width: 800px;">
					<tr>
						<td>
							<div style="float: left; width: 150px; padding: 10px;">
								<ul id="navi">
									<li class="group" style="text-align: center;">
										<div class="title" id="title">가슴</div>
										<ul class="sub">
											<li><a name="exeKinds">전체</a></li>
											<li><a name="exeKinds">기구</a></li>
											<li><a name="exeKinds">맨몸</a></li>
										</ul>
									</li>
								</ul>
							</div>
						</td>
						<td>
							<div id="exe" style="float: left; width: 490px; padding: 10px;">
							</div>
						</td>
						<td>
							<div style="float: left; width: 150px; padding: 10px;">
								<ul id="navi">
									<li class="group" style="text-align: center;">
										<div class="title" id="exeTitle">가슴</div>
										<ul class="sub">
											<li><a name="exeAdd">운동 추가</a></li>
											<li><a name="exeDel">운동 삭제</a></li>
											<li><a name="exeGet">프로그램</a></li>
										</ul>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div style="border: 1px solid;">
				<div style="float: left; width: 30%; padding: 10px;">
					<table border="1">
						<tr>
							<th>준비 운동</th>
						</tr>
						<tr>
							<td><input type="number" id="warmingUp" name="0" min="0" max="50">회
							</td>
						</tr>
					</table>
				</div>
				<div style="float: left; width: 30%; padding: 10px;">
					<form action="insertExercisePersonalDetail" id=insertExercisePersonalDetail>
						<table border="1" id="exeNameTbl">
							<tr>
								<td>운동 목록</td><td>설정 횟수</td>
							</tr>
						</table>
						<button type="button" id="setExePr" style="display: none;">등록하기</button>
					</form>
				</div>
				<div id="divThird" style="float: left; width: 30%; padding: 10px;">
					<form action="" id="exeSetCount">
						<table border="1" id="exeSet"></table>
						<br><input type="hidden" name="exep_no" value="${ffUser1}"><br>
						<br><input type="hidden" name="user_id" value="${ffUser.id }"><br>
					</form>
					<form name="popForm">
						<input type="hidden" name="user_id" value="${ffUser.id }" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>