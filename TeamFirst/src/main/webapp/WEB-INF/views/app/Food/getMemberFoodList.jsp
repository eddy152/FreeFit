<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div>
	<div>
		<h1>ȸ�� �Ĵ�</h1>
		<input type="text" name="id" hidden="hidden" value="${food.id }">
		<button type="button" onclick="location.href='getMemberFoodInsert?id=${food.id}'">�󼼺���</button>
		<table border="1">
			<tr>

				<td>�̸�</td>
				<td>${food.name }<input name="name" value="${food.id }" hidden="hidden">
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${food.age }</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${food.gender }</td>
			</tr>
			<tr>
				<td>Ű</td>
				<td>${food.height }</td>
			</tr>
			<tr>
				<td>������</td>
				<td>${food.weight }<input type="text" hidden="hidden" name="weight" value="${food.weight }">
				</td>
			</tr>
			<tr>
				<td colspan="3" style="width: 200px;"><textarea>Ư�̻���</textarea>
				</td>
			</tr>
		</table>
		
		
		
	</div><br>
	<div>
		<button type="button" onclick="moveDate(-7)"><</button>
		<input type="text" name="dates" value="${week[0].sysdate}">��°
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
		var weight = $('input:text[name="weight"]').val(); // = ������
		var count = weight * 12 * 1.5;
		var arr = [];
		arr.push([ '���볯¥', '�������뷮', '���差' ]);
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
