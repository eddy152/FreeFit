<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	google.charts.load("current", {
		packages : [ "calendar" ]
	});
	google.charts.setOnLoadCallback(drawChart1);

	function drawChart1() {
		var dataTable = new google.visualization.DataTable();
		dataTable.addColumn({
			type : 'date',
			id : 'Date'
		});
		dataTable.addColumn({
			type : 'number',
			id : 'Won/Loss'
		});
		dataTable.addRows([ [ new Date(2012, 3, 13), 37032 ],
				[ new Date(2012, 3, 14), 38024 ],
				[ new Date(2012, 3, 15), 38024 ],
				[ new Date(2012, 3, 16), 38108 ],
				[ new Date(2012, 3, 17), 38229 ],
				// Many rows omitted for brevity.
				[ new Date(2013, 9, 4), 38177 ],
				[ new Date(2013, 9, 5), 38705 ],
				[ new Date(2013, 9, 12), 38210 ],
				[ new Date(2013, 9, 13), 38029 ],
				[ new Date(2013, 9, 19), 38823 ],
				[ new Date(2013, 9, 23), 38345 ],
				[ new Date(2013, 9, 24), 38436 ],
				[ new Date(2013, 9, 30), 38447 ] ]);

		var chart = new google.visualization.Calendar(document
				.getElementById('calendar_basic'));

		var options = {
			title : "Red Sox Attendance",
			height : 350,
			calendar: { cellSize: 20 },
		};

		chart.draw(dataTable, options);
	}

	 google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart2);

	function drawChart2() {

		var data = new google.visualization.DataTable();
        data.addColumn('string', '날짜');
        data.addColumn('number', '운동시간(분)');
        
        var arr = [];
        $.ajax({
        	url: "getExerciseRecordList?user_id=lee",
        	async: false,
        	success: function(result) {
 			for(o of result) { // of = 배열, in = 인덱스
 				arr.push( [ o.exer_end_date, o.exe_time ] );
 			// vo -> paseInt 사용, map -> bigDecimal로 인해 parseInt 사용할 필요 X
	 			}
	        }
	    });
        

        data.addRows(arr);
		
        // Set chart options
        var options = {'title':'운동 시간',
                       'width':400,
                       'height':300,
                        colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
                        vAxis : {format: "###분", gridlines: {count: 4} },
        			};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
	}
	
	</script>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<style type="">
.container {
	display: grid;
	grid-template-rows: 500px 500px 500px;
	grid-template-columns: 500px 500px 500px;
	grid-gap: 5px;
}

div:nth-child(even) {
	background: yellow;
}

}
.calendar_basic {
	
}
</style>
</head>
<body>
	<div class="container">
		<div id="calendar_basic" style="width: 1000px; height: 350px;"></div>
		<div id="chart_div"></div>
		<div>
			<c:forEach items="${list }" var="list">
				${list.exe_time }</br>
				${list.exe_name }</br>
				${list.exer_date }</br>
				${list.exer_end_date }</br>
			</c:forEach>
			<div id="curve_chart" style="width: 900px; height: 500px"></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
</body>
</html>