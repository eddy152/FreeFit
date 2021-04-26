<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>userNList.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
</head>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
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
<<<<<<< HEAD
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
=======
>>>>>>> refs/heads/KDH

<<<<<<< HEAD
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
=======
			$('input:text[name="dates"]').val(result[0].week);
				
					$.ajax({
						url: 'getWeeks',
						data: {cnt : cnt},
						dataType: 'json',
						success : function(e) {
							
							/* if(e.length == 0) {
								return;
							}
							for(i=0; i<e.length; i++) {
								if(result[i]) {
									console.log(result[i]);
									arr.push([result[i].take_date, parseInt(result[i].calorie), count]);
								} else if(!result[i]) {
									arr.push([e[i].day, 0, count]);
								}
							} */
							
							
							var data = google.visualization.arrayToDataTable(arr);
>>>>>>> refs/heads/KDH

<<<<<<< HEAD
							};
=======
							var options = {
								width : '1000',
								vAxis : { viewWindow : { max : 3000 }
								},
								seriesType : 'bars',
								series : { 1 : { type : 'line' }
								}
>>>>>>> refs/heads/KDH

<<<<<<< HEAD
							var chart = new google.visualization.ComboChart(document
									.getElementById('columnchart_material'));
=======
							};
>>>>>>> refs/heads/KDH

<<<<<<< HEAD
=======
							var chart = new google.visualization.ComboChart(document
									.getElementById('columnchart_material'));

>>>>>>> refs/heads/KDH
							chart.draw(data, options);
						}
<<<<<<< HEAD
					});
				} else {		
					$('input:text[name="dates"]').val(result[0].week);
					for(i=0; i<result.length; i++) {
					arr.push([result[i].take_date, result[i].calorie, count]);
					}
					var data = google.visualization.arrayToDataTable(arr);
=======
			
>>>>>>> refs/heads/KDH

<<<<<<< HEAD
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
=======
				} // else
			} // succes
>>>>>>> refs/heads/KDH

<<<<<<< HEAD
					};

					var chart = new google.visualization.ComboChart(document
							.getElementById('columnchart_material'));

					chart.draw(data, options);

				} // else
			} // succes

=======
>>>>>>> refs/heads/KDH
		});// ajax
		
	}
</script>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="row row-2">
				<div class="col-sm-5">
					<h1 class="page-header">회원 상세정보</h1>
				</div>
				<div class="table-responsive">
					<table class="table table">
						<tr>
							<td>이름</td>
							<td>${food.name }<input name="name" value="${food.id }"
								hidden="hidden">
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
							<td>${food.weight }<input type="text" hidden="hidden"
								name="weight" value="${food.weight }">
							</td>
						</tr>
						<tr>
							<td colspan="3" style="width: 100px;"><textarea>특이사항</textarea>
							</td>
						</tr>
					</table>
					<div align="center">
						<input type="button" class="btn btn-secondary"
							onclick="moveDate(-7)" value="<"> <input type="text"
							name="dates" style="width: 100px;" value="${calories[0].week}">주째
						<input type="text" hidden="hidden" id="date"
							value="${calories[0].sysdate}"> <input type="button"
							class="btn btn-secondary" value=">" onclick="moveDate(7)">
						<br> <br>
					</div>
					<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
