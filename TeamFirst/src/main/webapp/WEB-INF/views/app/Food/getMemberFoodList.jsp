<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	google.charts.load('visualization','1', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var weight = $('input:text[name="weight"]').val(); // = ������
		var result = weight * 12 * 1.5;
		var arr =[]; 
		arr.push( ['���볯¥', '�������뷮', '���差']);
	
	  	<c:forEach var="calorie" items="${list }"> 	
		    		arr.push(['${calorie.take_date}', parseInt(${calorie.calorie }), result]);
			</c:forEach>
		
	  var data = google.visualization.arrayToDataTable(arr);
	
	  var options = {
	          chart: { title: '�̹��� �Ĵ�',  subtitle: $('input:text[name="name"]').val() + ' ȸ������ �Ĵ� ���'},
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
				
				var weight = $('input:text[name="weight"]').val(); // = ������
		    	var count = weight * 12 * 1.5;
		    	var arr =[]; 
		    	arr.push( ['���볯¥', '�������뷮', '���差']);
				
		    	
		    	for(i=0; i < result.length; i++) {
		    	console.log(result[0].take_date);
				    arr.push([result[i].take_date, parseInt(result[i].calorie), count]);
		    		}
		    	
		        var data = google.visualization.arrayToDataTable(arr);
		        
		        var options = {
		                chart: { title: '�̹��� �Ĵ�', subtitle: $('input:text[name="name"]').val() + ' ȸ������ �Ĵ� ���'}, 
		                vAxis: { viewWindow: { max: 3000 } },
		                seriesType: 'bars',
		                series: {1: {type: 'line'}}	
		          
		              };

		        var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));

		        chart.draw(data, options);
				} else {
					alert('����!');
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
		
	    	var weight = $('input:text[name="weight"]').val(); // = ������
	    	var count = weight * 12 * 1.5;
	    	var arr =[]; 
	    	arr.push( ['���볯¥', '�������뷮', '���差']);
			
	    	
	    	for(i=0; i < result.length; i++) {
	    		console.log(result[0].take_date);
			    arr.push([result[i].take_date, parseInt(result[i].calorie), count]);
	    		}
	    	
	        var data = google.visualization.arrayToDataTable(arr);
	        
	        var options = {
	                chart: {  title: '�̹��� �Ĵ�', subtitle: $('input:text[name="name"]').val() + ' ȸ������ �Ĵ� ���' },
	                vAxis: { viewWindow: { max: 3000 } },
	                seriesType: 'bars',
	                series: {1: {type: 'line'}} };

	        var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));

	        chart.draw(data, options);
			} else {
				alert('����!');
				location.reload();
			}
	       
	      },
		error: function() {
			alert('ERROR!');
		}
	    
	});
}

</script>

<div>
	<div>
		<h1>ȸ�� �Ĵ�</h1>
		<input type="text" name="id" value="${food.id }" hidden="hidden">
		<table border="1">
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
		
		
	</div><br>
	<div>
		<button type="button" onclick="before()"><</button>
		<input type="text" name="dates" value="${list[0].week}">��°
		<input type="text" hidden="hidden" id="date" value="${list[0].sysdate}">
		<button type="button" onclick="after()">></button>
	</div>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
		<c:forEach var="current" items="${list }">
			<c:if test="${current.sysdate eq current.take_date }">
				<div>
					<button type="button" onclick="location.href='getMemberFoodInsert?id=${food.id}&real_diet_no=${current.real_diet_no}'">�󼼺���</button>
				</div>
				<input type="text" value="${current.real_diet_no}" hidden="hidden">
			</c:if>
		</c:forEach>

</div>
