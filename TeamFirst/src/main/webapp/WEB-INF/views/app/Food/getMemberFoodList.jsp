<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
.right {
	display: inline-block;
	text-align: center;
	width: 100%;
	vertical-align: top;
	border: 0 10px;
	margin: 0 10px;
	padding: 0 10px;
	list-style: none;
}

table {
	width: 70%;
}

td {
	padding: 15px;
	text-align: center;
}

th {
	padding: 15px;
	text-align: center;
}

#t01 tr:nth-child(even) {
	background-color: #eee;
}

#t01 tr:nth-child(odd) {
	background-color: #fff;
}

#t01 th {
	background-color: black;
	color: white;
}
</style>
<div class="page-wrapper">
	<div class="container-fluid">
	<div class="col-lg-15">
				<div align="center">
		<h1>회원 식단</h1>
		</div>
		<input type="text" name="id" hidden="hidden" value="${food.id }">
		<button type="button" onclick="location.href='getMemberFoodInsert?id=${food.id}'">상세보기</button>
		<table class="table table">
			<tr>

				<td>이름</td>
				<td>${food.name }<input name="name" value="${food.id }" hidden="hidden">
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>${food.age }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${food.gender }</td>
			</tr>
			<tr>
				<td>키</td>
				<td>${food.height }</td>
			</tr>
			<tr>
				<td>몸무게</td>
				<td>${food.weight }<input type="text" hidden="hidden" name="weight" value="${food.weight }">
				</td>
			</tr>
			<tr>
				<td colspan="3" style="width: 200px;"><textarea>특이사항</textarea>
				</td>
			</tr>
		</table>
		
		
		</div>
	</div><br>
	<div>
		<button type="button" onclick="moveDate(-7)"><</button>
		<input type="text" name="dates" value="${week[0].sysdate}">주째
		<input type="text" hidden="hidden" id="date" value="${list[0].sysdate}">
		<button type="button" onclick="moveDate(7)">></button>
	</div>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</div>

<script type="text/javascript">
	google.charts.load('visualization', '1', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		moveDate(0);
	}
	var cnt = 0;
	function moveDate(count) {
		cnt += count
		console.log("cnt ---> " + cnt)
		var weight = $('input:text[name="weight"]').val(); // = 몸무게
		var count = weight * 12 * 1.5;
		var arr = [];
		arr.push([ '섭취날짜', '실제섭취량', '권장량' ]);
		$.ajax({
			url: 'getDate',
			data : { id : $('input:text[name="name"]').val(),
			    	cnt : cnt},
			dataType: 'json',
			type: 'get',
			success : function(result) { // === dual
				console.log(result);
				if(result.length < 7) {
					$('input:text[name="dates"]').val(result[0].week);
				
					$.ajax({
						url: 'getWeeks',
						data: {cnt : cnt},
						dataType: 'json',
						success : function(e) {
							for(i=0; i<e.length; i++) {
								if(result[i]) {
									console.log(result[i]);
									arr.push([result[i].take_date, parseInt(result[i].calorie), count]);
								} else if(!result[i]) {
									arr.push([e[i].day, 0, count]);
								}
							}
							
							
							var data = google.visualization.arrayToDataTable(arr);
							var options = {
								width : '1000',
								vAxis : {
									viewWindow : {
										max : 3000
									}
								},
								seriesType : 'bars',
								series : {
									1 : {
										type : 'line'
									}
								}
							};
							var chart = new google.visualization.ComboChart(document
									.getElementById('columnchart_material'));
							chart.draw(data, options);
						}
					});
				} else {		
					$('input:text[name="dates"]').val(result[0].week);
					for(i=0; i<result.length; i++) {
					arr.push([result[i].take_date, result[i].calorie, count]);
					}
					var data = google.visualization.arrayToDataTable(arr);
					var options = {
						width : '1000',
						vAxis : {
							viewWindow : {
								max : 3000
							}
						},
						seriesType : 'bars',
						series : {
							1 : {
								type : 'line'
							}
						}
					};
					var chart = new google.visualization.ComboChart(document
							.getElementById('columnchart_material'));
					chart.draw(data, options);
				} // else
			} // succes
		});// ajax
		
	}
</script>
