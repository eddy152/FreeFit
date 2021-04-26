<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div>
	<div>
		<h1>회원 식단</h1>
		<input type="text" name="id" hidden="hidden" value="${user.id }">
		<button type="button" onclick="location.href='getMemberFoodInsert?id=${user.id}'">상세보기</button>
		<table border="1">
			<tr>

				<td>이름</td>
				<td>${user.name }<input name="name" value="${user.id }" hidden="hidden">
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>${user.age }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${user.gender }</td>
			</tr>
			<tr>
				<td>키</td>
				<td>${user.height }</td>
			</tr>
			<tr>
				<td>몸무게</td>
				<td>${user.weight }<input type="text" hidden="hidden" name="weight" value="${user.weight }">
				</td>
			</tr>
			<tr>
				<td colspan="3" style="width: 200px;"><textarea>특이사항</textarea>
				</td>
			</tr>
		</table>
		
		
		
	</div><br>
	<div>
		<button type="button" onclick="moveDate(-7)"><</button>
		<input type="text" name="dates" value="${week[0].sysdate}">주째
		<input type="text" hidden="hidden" id="date" value="">
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
		var weight = $('input:text[name="weight"]').val(); // = 몸무게
		var count = weight * 12 * 1.5;
		var arr = [];
		arr.push([ '섭취날짜', '실제섭취량', '권장량' ]);
		$.ajax({
			url: 'getWeeks',
			data : { id : $('input:text[name="name"]').val(),
			    	cnt : cnt},
			dataType: 'json',
			type: 'get',
			success : function(result) { // === dual
			$('input:text[name="dates"]').val(result[0].week);
					
					for(i=0; i<result.length; i++) {
						
						arr.push([result[i].take_date, parseInt(result[i].calorie), count])
					}	
							
							var data = google.visualization.arrayToDataTable(arr);

							var options = {
								width: '200',
								height : '500',
								vAxis : { viewWindow : { max : 3000 }
								},
								seriesType : 'bars',
								series : { 1 : { type : 'line' }
								}

							};

							var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));

							chart.draw(data, options);
						}
			
		});// ajax
		
	}
</script>