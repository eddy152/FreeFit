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
<script>
$(function() {
	var part = '가슴';
	var exeName = '';
	var sets = 4;
	//상단 메뉴바 클릭
	$(".menuLink").on("click", function() {
						part = $(this)[0].id;
						$("#title").html(part);
	});  // End of a

	//좌측 메뉴 클릭
	$(document).on("click", "a[name=exeKinds]", function() {
		var kinds = $(this)[0].text;
		console.log(kinds);
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
	
	$(document).on("click", "button[name=exeName]", function() {
		var exeName = $(this)[0].innerText;
		var exeNameTd = document.getElementsByName("exeNameTd");
		;
		var findExeName = false;
			for (var i = 0; i < exeNameTd.length; i++) {
				if (exeNameTd[i].innerText == exeName) {
					alert("중복된 값이 존재 합니다..");
					findExeName = true;
					return ;
				} 
			}
			if(findExeName != true) {
				$("#exeNameTbl").append('<tr><td name="exeNameTd" id=' + $(this)[0].id + '>' + exeName + '</td></tr>');
			}
		}); // End of exeName
	
	// 하단 우측 세트 수
	$(document).on("click", "td[name=exeNameTd]", function() {
		console.log($(this)[0].id);
		exeName = $(this)[0].innerText;
		$("#exeSet").children().remove();
		$("#divThird button").remove();
		$("#divThird p").remove();
		
		$("#exeSet").append('<tr><th colspan="2"><input type="text" readonly="readonly" id=' + exeName + ' value=' + exeName + '></th>'
		+ '<th>횟수</th></tr>'
		+ '<tr><td name="sets">세트수</td>'
		+ '<td><input type="number" name=epd_set></td>'
		+ '<td><input type="number" name=epd_count></td></tr>')
		
		$("#exeSet").append('<input type="hidden" name=exe_no value=' + $(this)[0].id + '>');
		$("#insertExercisePersonalDetail").append('<button type="button" name="setMinus">-</button></p>');
		$("#insertExercisePersonalDetail").append('<button type="button" name="setDel">삭제하기</button><button type="submit" name="setSub">저장하기</button>');
	})// End of set 세트수 tr, form에 보내는 방식 수정 필요
	
	//버튼 클릭 이벤트(운동 tr 삭제)
	$(document).on("click", "button[name=setMinus]", function() {
		$("#exeSet tr:last").remove();
		$("#exeSet tr:last").remove();
		sets--;
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
			<div id="div1" style="border: 1px solid red; float: left; padding: 10px;">
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
				<table id="tbl1" border="1" style="height: 150px; width: 800px;">
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
							<div id="exe" style="float: left; width: 640px; padding: 10px;">
							
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div style="border: 1px solid yellow; float: left; width: 30%; padding: 10px;">
				<table border="1">
					<tr>
						<th>준비 운동</th>
					</tr>
					<tr>
						<td><input type="number" id="0" name="0" min="0" max="15">회
						</td>
					</tr>
				</table>
			</div>
			<div style="border: 1px solid red; float: left; width: 30%; padding: 10px;">
				<table border="1" id="exeNameTbl">
					<tr>
						<td>운동 목록</td>
					</tr>
				</table>
			</div>
			<div id="divThird" style="border: 1px solid blue; float: left; width: 30%; padding: 10px;">
				<form action="insertExercisePersonalDetail" id="insertExercisePersonalDetail">
					<table border="1" id="exeSet">
					</table>
					<input type="text" name="epd_no" value="5">운동 프로그램 번호
					<input type="text" name="exep_no" value="1">프로그램 번호
					<input type="text" name="epd_weight" value="50">운동 무게
					<input type="text" name="user_id" value="lee">유저 아이디
				</form>
			</div>
		</div>
	</div>
</body>
</html>