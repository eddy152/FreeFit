<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div>
	<div>
		<h1>회원 식단</h1>
		<input type="text" name="id" hidden="hidden" value="${food.id }">
		<button type="button" onclick="location.href='getMemberFoodInsert?id=${food.id}'">상세보기</button>
		<table border="1">
			<tr>

				<td>이름</td>
				<td>${food.name }<input name="name" value="${food.name }" hidden="hidden">
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
		
		
		
	</div><br>
	<div>
		<button type="button" onclick="before()"><</button>
		<input type="text" name="dates" value="${week[0].sysdate}">주째
		<input type="text" hidden="hidden" id="date" value="${list[0].sysdate}">
		<button type="button" onclick="after()">></button>
	</div>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</div>

<script type="text/javascript">

	google.charts.load('visualization','1', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var weight = $('input:text[name="weight"]').val();  // = 몸무게
		var result = weight * 12 * 1.5;
		var arr =[]; 
		arr.push( ['섭취날짜', '실제섭취량', '권장량']);
		
	  	<c:forEach var="week" items="${week }">
		    	arr.push(['${week.take_date}', parseInt(${week.calorie }), result]);
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
				
				if(result.length != 0) {
					var weight = $('input:text[name="weight"]').val(); // = 몸무게
					var total = weight * 12 * 1.5;
					var arr =[]; 
					arr.push( ['섭취날짜', '실제섭취량', '권장량']);
					
					$('input:text[name="dates"]').val(result[0].week);
					
					for(i=0; i<result.length; i++) {
						var today = result[i].take_date;
						var calorie = result[i].calorie;
						
						arr.push([today, parseInt(calorie), total]);
					}
					
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
						url: 'getWeeks',
						data: {cnt:cnt},
						dataType: 'json',
						success: function(result) {
							$('input:text[name=dates]').val(result[0].week);
							$('#real_diet_no1').val(result.real_diet_no);
							var weight = $('input:text[name="weight"]').val(); // = 몸무게
							var total = weight * 12 * 1.5;
							var arr =[]; 
							arr.push( ['섭취날짜', '실제섭취량', '권장량']);
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
						var weight = $('input:text[name="weight"]').val(); // = 몸무게
						var total = weight * 12 * 1.5;
						var arr =[]; 
						arr.push( ['섭취날짜', '실제섭취량', '권장량']);
						
						console.log(result);
						$('input:text[name="dates"]').val(result[0].week);
						
						for(i=0; i<result.length; i++) {
							console.log(result[0].week);
							var today = result[i].take_date;
							var calorie = result[i].calorie;
							
							console.log(today + ", " + calorie);
							arr.push([today, parseInt(calorie), total]);
						}
						
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
							url: 'getWeeks',
							data: {cnt:cnt},
							dataType: 'json',
							success: function(result) {
								console.log(result[0].week + "dd");
								$('input:text[name=dates]').val(result[0].week);
								$('#real_diet_no1').val(result.real_diet_no);
								var weight = $('input:text[name="weight"]').val(); // = 몸무게
								var total = weight * 12 * 1.5;
								var arr =[]; 
								arr.push( ['섭취날짜', '실제섭취량', '권장량']);
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
