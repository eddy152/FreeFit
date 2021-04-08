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
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  // 칼로리 계산 시 필요한 정보 - 1. 체중
    	var weight = $('input:text[name="weight"]').val(); // = 몸무게
    	var result = weight * 12 * 1.5;
    	var arr =[]; 
    	arr.push( ['섭취날짜', '실제섭취량', '권장량']);

    	<c:forEach var="calorie" items="${calories }"> 	
	    		arr.push(['${calorie.take_date}', ${calorie.calorie }, result]);
		</c:forEach>
    	
        var data = google.visualization.arrayToDataTable(arr);
        
        console.log(result);
        
        var options = {
          chart: {
            title: '이번주 식단',
            subtitle: $('input:text[name="name"]').val() + ' 회원님의 식단 통계',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    	
    	$(document).ready(function() {
    		$('#before').click(function() {
    			
    			$.ajax({
        			url: 'getFoodSelect',
        			data: { id : $('input:text[name="id"]').val() },
        			dataType: 'json',
        			method: 'get',
        			success: drawChart,
        			error: function() {
        				alert('ERROR!');
        			}
        		    
        		});
    		});
    	});
    	
    	function after() {
    		$.ajax({
    			url: 'getFoodSelect',
    			data: { id : $('input:text[name="id"]').val() },
    			dataType: 'json',
    			method: 'get',
    			success: drawChart,
    			error: function() {
    				alert('ERROR!');
    			}
    		    
    		});
    	}
    	
    	function inDate() {

    		function dataToMd(date) {
    			function pad(num) {
    				num = num + '';
    				return num.length < 2 ? '0' + num : num;
    			} // pad
    			return date.getFullYear() + '-' + pad(date.getMonth() + 1)
    				   + '-' + pad(date.getDate());
    		} // dateToMd
    	
    		var indate = new Date(first_date.value);
    		console.log(indate);
    		
    		final_date.value = dataToMd(new Date(indate.setMonth(indate.getMonth() + 1)));
    	}
    	
    </script>
  </head>
</head>
<body>

<h1>회원정보</h1>

<hr>
<button type="button" onclick="Click()">클릭</button>
<input name="id" value="${food.id }" hidden="hidden">
<table border="1">
	<tr>
		<td rowspan="5" style="width:100px;">사진</td>
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
	<button type="button" id="before" onclick="before()"><</button>
	<button type="button" id="after" onclick="after()">></button>
	<br>
	<br>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</body>
</html>