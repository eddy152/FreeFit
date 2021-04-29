<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	arr = {};
	var user_id = "";
	
	function ShowSliderValue(sVal) {
		var obValueView = document.getElementById("slider_value_view");
		obValueView.innerHTML = sVal
	}
	function ShowSliderValue1(sVal) {
		var obValueView = document.getElementById("slider_value_view1");
		obValueView.innerHTML = sVal
	} // 첫 운동 횟수 

	function SliderValue0(sVal) {
		var obValueView = document.getElementById("slider_value0");
		obValueView.innerHTML = sVal
	}
	function SliderValue1(sVal) {
		var obValueView = document.getElementById("slider_value1");
		obValueView.innerHTML = sVal
	}
	function SliderValue2(sVal) {
		var obValueView = document.getElementById("slider_value2");
		obValueView.innerHTML = sVal
	}
	function SliderValue3(sVal) {
		var obValueView = document.getElementById("slider_value3");
		obValueView.innerHTML = sVal
	}
	function SliderValue4(sVal) {
		var obValueView = document.getElementById("slider_value4");
		obValueView.innerHTML = sVal
	}
	function SliderValue5(sVal) {
		var obValueView = document.getElementById("slider_value5");
		obValueView.innerHTML = sVal
	}
	function SliderValue6(sVal) {
		var obValueView = document.getElementById("slider_value6");
		obValueView.innerHTML = sVal
	}// 세트 횟수

	function ShowValue0(sVal) {
		var obValueView = document.getElementById("slider_view0");
		obValueView.innerHTML = sVal
	}
	function ShowValue1(sVal) {
		var obValueView = document.getElementById("slider_view1");
		obValueView.innerHTML = sVal
	}
	function ShowValue2(sVal) {
		var obValueView = document.getElementById("slider_view2");
		obValueView.innerHTML = sVal
	}
	function ShowValue3(sVal) {
		var obValueView = document.getElementById("slider_view3");
		obValueView.innerHTML = sVal
	}
	function ShowValue4(sVal) {
		var obValueView = document.getElementById("slider_view4");
		obValueView.innerHTML = sVal
	}
	function ShowValue5(sVal) {
		var obValueView = document.getElementById("slider_view5");
		obValueView.innerHTML = sVal
	}
	function ShowValue6(sVal) {
		var obValueView = document.getElementById("slider_view6");
		obValueView.innerHTML = sVal
	} // 운동 횟수
	
	//버튼 클릭 이벤트(등록하기)
	$(document).on("click", ".btnEndExe", function() {
		user_id = $('[name=user_id]').val();
		var exep_no = Number($('[name=exep_no]').val());
		var exer_do_set = Number($(this).parent('div').children('div')[1].children[0].children[0].children[1].value);
		var exer_do_count = Number($(this).parent('div').children('div')[1].children[1].children[0].children[1].value);
		var exe_no = Number($(this).parent('div').children('div')[1].children[1].children[0].children[2].value);
		var exeName = $(this).parent('div').children('div')[1].children[1].children[0].children[3].value;
		
		arr[exeName] = {"user_id":user_id , "exep_no":exep_no , "exe_no":exe_no, "exer_do_set":exer_do_set, "exer_do_count":exer_do_count};
		
		$('.carousel-control-next').click()
	})
	
	//운동 프로그램 종료하기(저장)
	$(document).on("click", ".btnDoneExe", function() {
		user_id = $('[name=user_id]').val();
		var exep_no = Number($('[name=exep_no]').val());
		var exer_do_set = Number($(this).parent('div').children('div')[1].children[0].children[0].children[1].value);
		var exer_do_count = Number($(this).parent('div').children('div')[1].children[1].children[0].children[1].value);
		var exe_no = Number($(this).parent('div').children('div')[1].children[1].children[0].children[2].value);
		var exeName = $(this).parent('div').children('div')[1].children[1].children[0].children[3].value;
		
		arr[exeName] = {"user_id":user_id , "exep_no":exep_no , "exe_no":exe_no, "exer_do_set":exer_do_set, "exer_do_count":exer_do_count};
		
		var result = JSON.stringify(arr);
		
		$.ajax({
			url: "updateExerciseRecord", 
			method: 'POST',
			data: result,
			traditional: true,
			dataType:'json',
			contentType : 'application/json',
			success: function(result) {
				alert("수고하셨습니다!");
				
				var form = document.createElement('form');
				var objs;
				var objs2;
	
				objs = document.createElement('input');
				objs.setAttribute('type', 'hidden');
				objs.setAttribute('name', 'user_id');
				objs.setAttribute('value', user_id);
	
				objs2 = document.createElement('input');
				objs2.setAttribute('type', 'hidden');
				objs2.setAttribute('name', 'id');
				objs2.setAttribute('value', user_id);
	
				form.appendChild(objs);
				form.appendChild(objs2);
				form.setAttribute('method', 'post');
				form.setAttribute('action', "getFFUserProc");
	
				document.body.appendChild(form);
	
				form.submit();
			}
		})  // End of ajax
	})
</script>
<style type="text/css">
ul {display: table;}
li {list-style-type: none; margin-left: 5px; margin-bottom: 5px; display: table-cell;}
</style>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="false">
			<c:set value="0" var="num1" />
			<div class="carousel-inner">
				<c:forEach items="${exe}" var="list">
					<c:choose>
						<c:when test="${num1 eq 0}">
							<div class="carousel-item active">
								<div class="box">
									<iframe width="480" height="400" src="https://www.youtube.com/embed/${list.exe_url }?rel=0&amp;" frameborder="0"></iframe>
								</div><p>
								<ul>
									<li>- ${list.exe_part} 운동 -
										<input type="hidden" name="exe_part" value="${list.exe_part}">
									</li>
								</ul>
								<ul>
									<li>${list.exe_name }
										<input type="hidden" name="user_id" value="${list.user_id}">	
									</li>
								</ul>
								<ul>
									<li>
										설정 세트 : ${list.epd_set } 세트
										<input type="hidden" name="epd_set" value="${list.epd_set}">
									</li>
								</ul>
								<ul>
									<li>
										설정 횟수 : ${list.exer_count } 회
										<input type="hidden" name="exer_count" value="${list.exer_count }">
									</li>
								</ul>
								<c:choose>
									<c:when test="${list.exer_weight eq null || list.exer_weight eq 0}">
										<input type="hidden" name="exer_weight" value=0>
									</c:when>
									<c:otherwise>
										<ul>
											<li>
												운동 무게 : ${list.exer_weight} kg
												<input type="hidden" name="exer_weight" value="${list.exer_weight}">
											</li>
										</ul>										
									</c:otherwise>
								</c:choose>
								<div>
									<ul>
										<li>실행 세트 : 
										<font id="slider_value_view">0</font>	
										<input oninput='ShowSliderValue(this.value)'  type = "range" min='0' max='10' value='0' name="exer_do_set" class="val">
									</ul>
									<ul>
										<li>실행 횟수 : 
										<font id="slider_value_view1">0</font>	
										<input oninput='ShowSliderValue1(this.value)'  type = "range" min='0' max='30' value='0' name="exer_do_count" class="val">
										<input type="hidden" name="exe_no" value="${list.exe_no}" class="val">
										<input type="hidden" name="exe_name" value="${list.exe_name}">
									</ul>
								</div>
								<ul>
									<li>
										<input type="hidden" name="exer_do_count" value="${list.exer_do_count}">
										<input type="hidden" name="exep_no" value="${list.exep_no}">
									</li>
								</ul>
								<button type="button" class="btnEndExe">${list.exe_name} 종료</button>
								<h3>1/${fn:length(exe)}</h3>
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item">
								<div class="box">
									<iframe width="480" height="400" src="https://www.youtube.com/embed/${list.exe_url}" frameborder="0"></iframe>
								</div><p>
								<ul>
									<li>- ${list.exe_part} 운동 -
										<input type="hidden" name="exe_part" value="${list.exe_part}">
									</li>
								</ul>
								<ul>
									<li>${list.exe_name }
										<input type="hidden" name="exe_name" value="${list.exe_name}">
										<input type="hidden" name="user_id" value="${list.user_id}">	
									</li>
								</ul>
								<ul>
									<li>
										설정 세트 : ${list.epd_set } 세트
										<input type="hidden" name="epd_set" value="${list.epd_set}">
									</li>
								</ul>
								<ul>
									<li>
										설정 횟수 : ${list.exer_count } 회
										<input type="hidden" name="exer_count" value="${list.exer_count }">
									</li>
								</ul>
								<c:choose>
									<c:when test="${list.exer_weight eq null || list.exer_weight eq 0}">
										<input type="hidden" name="exer_weight" value=0>
									</c:when>
									<c:otherwise>
										<ul>
											<li>
												운동 무게 : ${list.exer_weight} kg
												<input type="hidden" name="exer_weight" value="${list.exer_weight}">
											</li>
										</ul>										
									</c:otherwise>
								</c:choose>
								<div>
									<ul>
										<li>실행 세트 : 
										<font id="slider_value${num1}">0</font>	
										<input oninput='SliderValue${num1}(this.value)'  type = "range" min='0' max='10' value='0' name="exer_do_set" class="val">
									</ul>
									<ul>
										<li>실행 횟수 : 
										<font id="slider_view${num1}">0</font>	
										<input oninput='ShowValue${num1}(this.value)'  type = "range" min='0' max='30' value='0' name="exer_do_count" class="val">
										<input type="hidden" name="exe_no" value="${list.exe_no}" class="val">
										<input type="hidden" name="exe_name" value="${list.exe_name}">
									</ul>
								</div>
								<ul>
									<li>
										<input type="hidden" name="exer_do_count" value="${list.exer_do_count}">
										<input type="hidden" name="exep_no" value="${list.exep_no}">
									</li>
								</ul>
								<c:choose>
									<c:when test="${num1 + 1 eq fn:length(exe)}">
										<button type="button" class="btnDoneExe">운동 프로그램 종료하기</button><p>
									</c:when>
									<c:otherwise>
										<button type="button" class="btnEndExe">${list.exe_name} 종료</button><p>
									</c:otherwise>
								</c:choose>
								<h3>${num1 + 1}/${fn:length(exe)}</h3>
							</div>
						</c:otherwise>
					</c:choose>
					<c:set value="${num1 + 1}" var="num1" />
				</c:forEach>
				<input type="hidden" id="numVal" value="${num1}">
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</body>
</html>