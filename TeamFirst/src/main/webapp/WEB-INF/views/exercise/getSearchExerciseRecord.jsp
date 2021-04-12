<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	  drawChart1();
	  drawChart3();
	  drawChart4();
	}
	
	function drawChart1() {
		var arr = [];
	    $.ajax({
	    	url: "getExerciseRecordList?user_id=lee",
	      	success: function(result) {
	      		arr.push( ['Task', 'Hours per Day'] );
				for(o of result) { // of = 배열, in = 인덱스
					arr.push( [ o.exer_date.substring(2), o.exe_time ] );
		 		}
			    var data = google.visualization.arrayToDataTable(arr);
				var options = {title: '운동시간 분석', pieHole: 0.4, };
				
				var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
				chart.draw(data, options);
			}
		});
	}

	function drawChart3() {
		var data = new google.visualization.DataTable();
	    data.addColumn('string', '날짜');
	    data.addColumn('number', '시간(분)');
	    var MAX = 10;
		
		var arr = [];
        
        $.ajax({
        	url: "getExerciseRecordList?user_id=lee",
        	success: function(result) {
	 			for(o of result) {
	 				arr.push( [ o.exer_date.substring(2), o.exe_time ] );
		 		}
	        	data.addRows(arr);
		
				var options = {
						  width: 500,
					      height: 400,
			    	      animation: {
			    	        duration: 1000,
			    	        easing: 'in'
	    	      },
	    	      hAxis: {viewWindow: {min:0, max:5}}
	    	    };

	    	    var chart = new google.visualization.SteppedAreaChart(
	    	        document.getElementById('visualization'));
	    	    var prevButton = document.getElementById('b1');
	    	    var nextButton = document.getElementById('b2');
	    	    var changeZoomButton = document.getElementById('b3');
	    	    function drawChart() {
	    	      // Disabling the button while the chart is drawing.
	    	      prevButton.disabled = true;
	    	      nextButton.disabled = true;
	    	      changeZoomButton.disabled = true;
	    	      google.visualization.events.addListener(chart, 'ready',
	    	          function() {
	    	            prevButton.disabled = options.hAxis.viewWindow.min <= 0;
	    	            nextButton.disabled = options.hAxis.viewWindow.max >= MAX;
	    	            changeZoomButton.disabled = false;
	    	          });
	    	      chart.draw(data, options);
	    	    }

	    	    prevButton.onclick = function() {
	    	      options.hAxis.viewWindow.min -= 1;
	    	      options.hAxis.viewWindow.max -= 1;
	    	      drawChart();
	    	    }
	    	    nextButton.onclick = function() {
	    	      options.hAxis.viewWindow.min += 1;
	    	      options.hAxis.viewWindow.max += 1;
	    	      drawChart();
	    	    }
	    	    var zoomed = false;
	    	    changeZoomButton.onclick = function() {
	    	      if (zoomed) {
	    	        options.hAxis.viewWindow.min = 0;
	    	        options.hAxis.viewWindow.max = 5;
	    	      } else {
	    	        options.hAxis.viewWindow.min = 0;
	    	        options.hAxis.viewWindow.max = MAX;
	    	      }
	    	      zoomed = !zoomed;
	    	      drawChart();
	    	    }
	    	    drawChart();
        		}
		});
	}
	
	function drawChart4() {
		var data = new google.visualization.DataTable();
		
        data.addColumn('string', '부위');
        data.addColumn('number', '운동량');
        
        var arr = [];
        
        $.ajax({
        	url: "getExerciseRecordPartCount?user_id=lee",
        	success: function(result) {
	 			for(o of result) {
	 				arr.push( [ o.exe_part, o.exe_part_count ] );
		 		}
	        	data.addRows(arr);
		
       			var options = {'title':'부위별 운동량(월)',
                       	        colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
                                vAxis : {format: "###", gridlines: {count: 5} 
       						  },
        		};
		        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		        chart.draw(data, options);
			}
		});
	}
	
	am4core.ready(function() {

		am4core.useTheme(am4themes_animated);

		var chart = am4core.create("drawChart2", am4charts.PieChart);
		var hour = 0;
		var min = 0;
		var sum = 0;
		chart.startAngle = 160;
		chart.endAngle = 380;

		var arr = [];
		        
        $.ajax({
        	url: "getExerciseRecordList?user_id=lee",
        	success: function(result) {
	 			for(o of result) {
	 				arr.push( { "Date":o.exer_date, "운동 시간(분)":o.exe_time, "운동 시간(분)":o.exe_time } );
	 				sum += o.exe_time;
		 		}
	 			sum = sum / 60;
	 			
	 			hour = sum.toFixed(0);
	 			
	 			min = sum % 1;
	 			min = (min.toFixed(3) * 60).toFixed(0);
	 			
	 			chart.data = arr;
				
				chart.innerRadius = am4core.percent(40);


				// Add and configure Series
				var pieSeries = chart.series.push(new am4charts.PieSeries());
				pieSeries.dataFields.value = "운동 시간(분)";
				pieSeries.dataFields.category = "Date";
				pieSeries.slices.template.stroke = new am4core.InterfaceColorSet().getFor("background");
				pieSeries.slices.template.strokeWidth = 1;
				pieSeries.slices.template.strokeOpacity = 1;

				// Disabling labels and ticks on inner circle
				pieSeries.labels.template.disabled = true;
				pieSeries.ticks.template.disabled = true;

				// Disable sliding out of slices
				pieSeries.slices.template.states.getKey("hover").properties.shiftRadius = 0;
				pieSeries.slices.template.states.getKey("hover").properties.scale = 1;
				pieSeries.radius = am4core.percent(40);
				pieSeries.innerRadius = am4core.percent(30);

				var cs = pieSeries.colors;
				cs.list = [am4core.color(new am4core.ColorSet().getIndex(0))];

				cs.stepOptions = {
				  lightness: -0.05,
				  hue: 0
				};
				cs.wrap = false;


				var pieSeries2 = chart.series.push(new am4charts.PieSeries());
				pieSeries2.dataFields.value = "운동 시간(분)";
				pieSeries2.dataFields.category = "Date";
				pieSeries2.slices.template.stroke = new am4core.InterfaceColorSet().getFor("background");
				pieSeries2.slices.template.strokeWidth = 1;
				pieSeries2.slices.template.strokeOpacity = 1;
				pieSeries2.slices.template.states.getKey("hover").properties.shiftRadius = 0.05;
				pieSeries2.slices.template.states.getKey("hover").properties.scale = 1;

				pieSeries2.labels.template.disabled = true;
				pieSeries2.ticks.template.disabled = true;


				var label = chart.seriesContainer.createChild(am4core.Label);
				label.textAlign = "middle";
				label.horizontalCenter = "middle";
				label.verticalCenter = "middle";
				label.adapter.add("text", function(text, target){
				  return "[font-size:18px]총 시간[/]:\n[bold font-size:30px]" + hour + ":" + min + "[/]";
				})
			}
		});
		}); // end am4core.ready()
	
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
#drawChart2 {
  width: 100%;
  height: 500px;
}
</style>
</head>
<body>
	<div class="container">
		<div id="donutchart"></div>
		<div id="drawChart2"></div>
		<div>
			<h3>운동 시간(분)</h3>
			<div id="visualization"></div>
			<div>
				<button type="button" id="b1">Previous</button>
				<button type="button" id="b2">Next</button>
				<button type="button" id="b3">Change Zoom</button>
			</div>
		</div>
		<div id="chart_div"></div>
		<div></div>
		<div></div>
	</div>
</body>
</html>