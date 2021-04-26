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
		<h1>ȸ�� �Ĵ�</h1>
		</div>
		<input type="text" name="id" hidden="hidden" value="${food.id }">
		<button type="button" onclick="location.href='getMemberFoodInsert?id=${food.id}'">�󼼺���</button>
		<table class="table table">
			<tr>

				<td>�̸�</td>
				<td>${food.name }<input name="name" value="${food.name }" hidden="hidden">
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
		
		
		</div>
	</div><br>
	<div>
		<button type="button" onclick="before()"><</button>
		<input type="text" name="dates" value="${week[0].sysdate}">��°
		<input type="text" hidden="hidden" id="date" value="${list[0].sysdate}">
		<button type="button" onclick="after()">></button>
	</div>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</div>
<script type="text/javascript">

	google.charts.load('visualization','1', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var weight = $('input:text[name="weight"]').val(); // = ������
		var result = weight * 12 * 1.5;
		var arr =[]; 
		arr.push( ['���볯¥', '�������뷮', '���差']);
		
	  	<c:forEach var="week" items="${week }">
	  		<c:if test="${week.take_date ne '' || week.take_date ne null}">
		    	arr.push(['${week.take_date}', parseInt(${week.calorie }), result]);
	  		</c:if>
		 </c:forEach>
	  	 <c:forEach var="day" items="${day}">
	  		arr.push(['${day.day}', 0, result]);
	  	 </c:forEach>
		
	  var data = google.visualization.arrayToDataTable(arr);
	
	  var options = {
			  width : '1000',
	          vAxis: { viewWindow: { max: 3000 } },			
	          seriesType: 'bars',
	          series: {1: {type: 'line'}} };
	
	  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
	
	  chart.draw(data, options);
	
		}
	var cnt = 0;
	
	function before() {
		cnt += (-7);
		$.ajax({
			url: 'getDate',
			data : { id : $('input:text[name="id"]').val(),
			    	cnt : cnt},
			dataType: 'json',
			type: 'get',
			success: function drawChart(result) {
				var today = result.take_date;
				var calorie = result.calorie;
				console.log(result)
				if(result.length != 0) {
					var weight = $('input:text[name="weight"]').val(); // = ������
					var result = weight * 12 * 1.5;
					var arr =[]; 
					arr.push( ['���볯¥', '�������뷮', '���差']);
					
				  	<c:forEach var="week" items="${week }">
				  		<c:if test="${week.take_date ne '' || week.take_date ne null}">
					    	arr.push(['${week.take_date}', parseInt(${week.calorie }), result]);
				  		</c:if>
					 </c:forEach>
				  	 <c:forEach var="day" items="${day}">
				  		arr.push(['${day.day}', 0, result]);
				  	 </c:forEach>
					
				  var data = google.visualization.arrayToDataTable(arr);
				
				  var options = {
						  width : '1000',
				          vAxis: { viewWindow: { max: 3000 } },			
				          seriesType: 'bars',
				          series: {1: {type: 'line'}} };
				
				  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
				
				  chart.draw(data, options);
				} else {
					$.ajax({
						url: 'getBeforeDate',
						data: {cnt:cnt},
						dataType: 'json',
						success: function(result) {
							$('input:text[name=dates]').val(result[0].week);
							$('#real_diet_no1').val(result.real_diet_no);
							var weight = $('input:text[name="weight"]').val(); // = ������
							var total = weight * 12 * 1.5;
							var arr =[]; 
							arr.push( ['���볯¥', '�������뷮', '���差']);
							console.log(result[0].week + "  " + result[0].day);
							for(i=0; i<result.length; i++) {
								console.log(result[i].day);
								arr.push([result[i].day, 0, total]);
							}
							
							  var data = google.visualization.arrayToDataTable(arr);
							
							  var options = {
									  width : '1000',
							          vAxis: { viewWindow: { max: 3000 } },
							          seriesType: 'bars',
							          series: {1: {type: 'line'}} };
							
							  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
							
							  chart.draw(data, options);
							
						}, error: function(e) {
							alert('ERROR!');
						}
					}); // ajax
					
				} 
				
			}
		})
	}
	
	function after() {
		 cnt += 7;
		 $.ajax({
				url: 'getDate',
				data : { id : $('input:text[name="id"]').val(),
				    	cnt : cnt},
				dataType: 'json',
				type: 'get',
				success: function drawChart(result) {
					var today = result.take_date;
					var calorie = result.calorie;
					console.log(result)
					if(result.length != 0) {
						var weight = $('input:text[name="weight"]').val(); // = ������
						var result = weight * 12 * 1.5;
						var arr =[]; 
						arr.push( ['���볯¥', '�������뷮', '���差']);
						
					  	<c:forEach var="week" items="${week }">
					  		<c:if test="${week.take_date ne '' || week.take_date ne null}">
						    	arr.push(['${week.take_date}', parseInt(${week.calorie }), result]);
					  		</c:if>
						 </c:forEach>
					  	 <c:forEach var="day" items="${day}">
					  		arr.push(['${day.day}', 0, result]);
					  	 </c:forEach>
						
					  var data = google.visualization.arrayToDataTable(arr);
					
					  var options = {
							  width : '1000',
					          vAxis: { viewWindow: { max: 3000 } },			
					          seriesType: 'bars',
					          series: {1: {type: 'line'}} };
					
					  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
					
					  chart.draw(data, options);
					} else {
						$.ajax({
							url: 'getBeforeDate',
							data: {cnt:cnt},
							dataType: 'json',
							success: function(result) {
								$('input:text[name=dates]').val(result[0].week);
								$('#real_diet_no1').val(result.real_diet_no);
								var weight = $('input:text[name="weight"]').val(); // = ������
								var total = weight * 12 * 1.5;
								var arr =[]; 
								arr.push( ['���볯¥', '�������뷮', '���差']);
								console.log(result[0].week + "  " + result[0].day);
								for(i=0; i<result.length; i++) {
									console.log(result[i].day);
									arr.push([result[i].day, 0, total]);
								}
								
								  var data = google.visualization.arrayToDataTable(arr);
								
								  var options = {
										  width : '1000',
								          vAxis: { viewWindow: { max: 3000 } },
								          seriesType: 'bars',
								          series: {1: {type: 'line'}} };
								
								  var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));
								
								  chart.draw(data, options);
								
							}, error: function(e) {
								alert('ERROR!');
							}
						}); // ajax
						
					} 
					
				}
			})
}

</script>
