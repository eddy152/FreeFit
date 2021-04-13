<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Food/getFood.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      google.charts.load('visualization','1', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	var weight = $('input:text[name="weight"]').val(); // = 몸무게
    	var result = weight * 12 * 1.5;
    	var arr =[]; 
    	arr.push( ['섭취날짜', '실제섭취량', '권장량']);

	    	<c:forEach var="calorie" items="${calories }"> 	
		    		arr.push(['${calorie.take_date}', parseInt(${calorie.calorie }), result]);
			</c:forEach>
    	
        var data = google.visualization.arrayToDataTable(arr);

        var options = {
                chart: { title: '이번주 식단',  subtitle: $('input:text[name="name"]').val() + ' 회원님의 식단 통계'},
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
					url: 'getBeforeDate',
					data : { id : $('input:text[name="id"]').val(),
    				    	cnt : cnt},
					dataType: 'json',
					type: 'get',
					success: function drawChart(result) {
					
						if(result.length != 0) {
						
						var week = result[0].week;
	    				$('input:text[name=dates]').val(week);
						
						var weight = $('input:text[name="weight"]').val(); // = 몸무게
	    		    	var count = weight * 12 * 1.5;
	    		    	var arr =[]; 
	    		    	arr.push( ['섭취날짜', '실제섭취량', '권장량']);
						
	    		    	
	    		    	for(i=0; i < result.length; i++) {
	    		    	console.log(result[0].take_date);
	    				    arr.push([result[i].take_date, parseInt(result[i].calorie), count]);
	    		    		}
	    		    	
	    		        var data = google.visualization.arrayToDataTable(arr);
	    		        
	    		        var options = {
	    		                chart: { title: '이번주 식단', subtitle: $('input:text[name="name"]').val() + ' 회원님의 식단 통계'}, 
	    		                vAxis: { viewWindow: { max: 3000 } },
	    		                seriesType: 'bars',
	    		                series: {1: {type: 'line'}}	
	    		          
	    		              };

	    		        var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));

	    		        chart.draw(data, options);
						} else {
							alert('없음!');
							location.reload();
						}
					}
				})
			}
			
    		function after() {
	 		 cnt += 7;
    		$.ajax({
    			url: 'getDate',
    			data: { id : $('input:text[name="id"]').val(),
    				    cnt : cnt},
    			dataType: 'json',
    			type: 'get',
    			success:  function drawChart(result) {
   	 						    		
    				console.log(result.length);
    				if(result.length != 0) {
    					
   	 				var week = result[0].week;					
    				$('input:text[name=dates]').val(week);
    			
    		    	var weight = $('input:text[name="weight"]').val(); // = 몸무게
    		    	var count = weight * 12 * 1.5;
    		    	var arr =[]; 
    		    	arr.push( ['섭취날짜', '실제섭취량', '권장량']);
					
    		    	
    		    	for(i=0; i < result.length; i++) {
    		    	console.log(result[0].take_date);
    				    arr.push([result[i].take_date, parseInt(result[i].calorie), count]);
    		    		}
    				
    		    	
    		        var data = google.visualization.arrayToDataTable(arr);
    		        
    		        var options = {
    		                chart: {  title: '이번주 식단', subtitle: $('input:text[name="name"]').val() + ' 회원님의 식단 통계' },
    		                vAxis: { viewWindow: { max: 3000 } },
    		                seriesType: 'bars',
    		                series: {1: {type: 'line'}} };

    		        var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));

    		        chart.draw(data, options);
    				} else {
    					alert('없음!');
    					location.reload();
    				}
    		       
    		      },
    			error: function() {
    				alert('ERROR!');
    			}
    		    
    		});
    	}
    	
    </script>
  </head>
</head>
<body>

<h1>회원정보</h1>

<hr>
<input name="id" value="${food.id }" hidden="hidden">
<table border="1">
	<tr>
		
		<td>이름</td>
		<td>${food.name }
			<input name="name" value="${food.name }" hidden="hidden">			
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
		<td>${food.weight }
			<input type="text" hidden="hidden" name="weight" value="${food.weight }">
		</td>
	</tr>
	<tr>
		<td colspan="3" style="width:200px;">
			<textarea>특이사항</textarea>
		</td>
	</tr>
	</table>
	<br>
	<button type="button" onclick="before()"><</button>
	<input type="text" name="dates" value="${calories[0].week}">주째
	<input type="text" hidden="hidden" id="date" value="${calories[0].sysdate}">
	<button type="button" onclick="after()">></button>
	<br>
	<br>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</body>
</html>