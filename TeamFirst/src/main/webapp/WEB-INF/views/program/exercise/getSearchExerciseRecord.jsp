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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	var today = new Date();   
	
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var day = today.getDate();  // 요일
	
	var selDate = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2));
	
	drawChart();
	
	$(function () {
		$("#datepicker").datepicker({ onSelect: function(dateText) {  
				selDate = dateText;
				drawChart();
			} 
		})
	});//end datepicker
	
	//모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
    });

    //input을 datepicker로 선언
    $("#datepicker").datepicker();                    
    
    //From의 초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	
	function drawChart() {
				google.charts.load("current", {packages:["corechart"]});
				google.charts.setOnLoadCallback(drawChart4);
				
				am4core.ready(function() {

					am4core.useTheme(am4themes_animated);

					var chart = am4core.create("drawChart2", am4charts.RadarChart);

					var arr = [];
					
					$.ajax({
			        	url: "getExerciseRecordPartCount?user_id=lee&selDate=" + selDate,
			        	success: function(result) {
				 			for(o of result) {
				 					arr.push( { "direction":o.exe_part, "value":o.exe_part_count } );
				 					
					 		}
				 			chart.data = arr;
						}
					});
					var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
					categoryAxis.dataFields.category = "direction";

					var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

					var series = chart.series.push(new am4charts.RadarSeries());
					series.dataFields.valueY = "value";
					series.dataFields.categoryX = "direction";
					series.name = "Wind direction";
					series.strokeWidth = 3;
					series.fillOpacity = 0.2;
				}); // end drawChart2	
				
				am4core.ready(function() {

					am4core.useTheme(am4themes_animated);

					var chart = am4core.create("drawChart3", am4charts.XYChart);

					var arr = [];
					var setExe = 0;
					var doExe = 0;
					var acRate = 0;
					
					$.ajax({
				    	url: "getSearchExerciseRecordBetween?user_id=lee&selDate=" + selDate,
				      	success: function(result) {
							for(o of result) {
									setExe = o.exer_count * o.epd_set;
									doExe = o.exer_do_count * o.exer_do_set;
									acRate = (doExe / setExe * 100).toFixed(0);
									arr.push( { "exeName":o.exe_name, "설정횟수":setExe, "실행횟수":doExe, "달성률":acRate, "Date":o.exer_date} );
									
					 		}
							chart.data = arr;
						}
					});

					var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
					categoryAxis.dataFields.category = "exeName";
					categoryAxis.renderer.inversed = true;
					categoryAxis.renderer.grid.template.location = 0;

					var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
					valueAxis.renderer.opposite = true;

					var series = chart.series.push(new am4charts.ColumnSeries());
					series.dataFields.categoryY = "exeName";
					series.dataFields.valueX = "설정횟수";
					series.dataFields.valueZ = "달성률";
					series.dataFields.valueD = "Date";
					series.name = "설정횟수";
					series.name2 = "Date";
					series.columns.template.fillOpacity = 0.5;
					series.columns.template.strokeOpacity = 0;
					series.tooltipText = "{name2} : {valueD} \n{categoryY} {name} : {valueX.value}\n달성률 {valueZ}%";

					var lineSeries = chart.series.push(new am4charts.LineSeries());
					lineSeries.dataFields.categoryY = "exeName";
					lineSeries.dataFields.valueX = "실행횟수";
					lineSeries.name = "실행횟수";
					lineSeries.strokeWidth = 3;
					lineSeries.tooltipText = "{categoryY} {name} : {valueX.value}";

					var circleBullet = lineSeries.bullets.push(new am4charts.CircleBullet());
					circleBullet.circle.fill = am4core.color("#fff");
					circleBullet.circle.strokeWidth = 2;

					chart.cursor = new am4charts.XYCursor();
					chart.cursor.behavior = "zoomY";

					chart.legend = new am4charts.Legend();

				}); // end drawChart3
				
				function drawChart4() {
					var data = new google.visualization.DataTable();
				    data.addColumn('string', '운동');
				    data.addColumn('number', '시간(분)');
				    var MAX = 10;
					
					var arr = [];
			        
			        $.ajax({
			        	url: "getSearchExerciseRecordOneDay?user_id=lee&selDate=" + selDate,
			        	success: function(result) {
				 			for(o of result) {
					 			arr.push( [ o.exe_name, o.exe_time ] );
			 				}
		        			data.addRows(arr);
					 		
					
							var options = {
								      height: 370,
						    	      animation: {
						    	        duration: 1000,
						    	        easing: 'in'
				    	      },
				    	      hAxis: {viewWindow: {min:0, max:4}}
				    	    };

				    	    var chart = new google.visualization.SteppedAreaChart(
				    	        document.getElementById('drawChart4'));
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
				    	        options.hAxis.viewWindow.max = 4;
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
				} // end drawChart4
				
				am4core.ready(function() {

					am4core.useTheme(am4themes_animated);

					var chart = am4core.create("drawChart5", am4charts.PieChart);
					var hour = 0;
					var min = 0;
					var sum = 0;
					chart.startAngle = 160;
					chart.endAngle = 380;

					var arr = [];
					        
			        $.ajax({
			        	url: "getSearchExerciseRecordOneDay?user_id=lee&selDate=" + selDate,
			        	success: function(result) {
				 			for(o of result) {
				 				arr.push( { "exeName":o.exe_name, "운동 시간(분)":o.exe_time, "운동 시간(분)":o.exe_time } );
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
							pieSeries.dataFields.category = "exeName";
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
							pieSeries2.dataFields.category = "exeName";
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
							  return "[font-size:18px]총 시간[/]:\n[bold font-size:30px]" + hour + "시간 " + min + "분" + "[/]";
							})
						}
					});
				}); // end drawChart5
				
				am4core.ready(function() {

					am4core.useTheme(am4themes_animated);

					var chart = am4core.create("drawChart6", am4charts.XYChart);

					chart.exporting.menu = new am4core.ExportMenu();

					var arr = [];
					var setExe = 0;
					var doExe = 0;
					var acRate = 0;
					
					$.ajax({
				    	url: "getSearchExerciseRecordOneDay?user_id=lee&selDate=" + selDate,
				      	success: function(result) {
							for(o of result) {
								setExe = o.exer_count * o.epd_set;
								doExe = o.exer_do_count * o.exer_do_set;
								acRate = (doExe / setExe * 100).toFixed(0);
								arr.push( { "운동명":o.exe_name, "설정횟수":setExe, "실행횟수":doExe, "달성률":acRate,
											"운동 날짜":o.exer_date, "user_id":o.user_id, "무게":o.exer_weight,
											"운동 부위":o.exe_part, "운동시간(분)":o.exe_time});
						 	}
							chart.data = arr;
				      	}
					});

					var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
					categoryAxis.dataFields.category = "운동명";
					categoryAxis.renderer.minGridDistance = 30;

					var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

					var columnSeries = chart.series.push(new am4charts.ColumnSeries());
					columnSeries.name = "설정횟수";
					columnSeries.dataFields.valueY = "설정횟수";
					columnSeries.dataFields.valueZ = "달성률";
					columnSeries.dataFields.categoryX = "운동명";

					columnSeries.columns.template.tooltipText = "[#fff font-size: 15px]{categoryX} {name} : \n[/][#fff font-size: 20px]{valueY}\n달성률 {valueZ}%[/] [#fff]{additional}[/]"
					columnSeries.columns.template.propertyFields.fillOpacity = "fillOpacity";
					columnSeries.columns.template.propertyFields.stroke = "stroke";
					columnSeries.columns.template.propertyFields.strokeWidth = "strokeWidth";
					columnSeries.columns.template.propertyFields.strokeDasharray = "columnDash";
					columnSeries.tooltip.label.textAlign = "middle";

					var lineSeries = chart.series.push(new am4charts.LineSeries());
					lineSeries.name = "실행횟수";
					lineSeries.dataFields.valueY = "실행횟수";
					lineSeries.dataFields.categoryX = "운동명";

					lineSeries.stroke = am4core.color("#fdd400");
					lineSeries.strokeWidth = 3;
					lineSeries.propertyFields.strokeDasharray = "lineDash";
					lineSeries.tooltip.label.textAlign = "middle";

					var bullet = lineSeries.bullets.push(new am4charts.Bullet());
					bullet.fill = am4core.color("#fdd400"); 
					bullet.tooltipText = "[#fff font-size: 15px]{categoryX} {name} : \n[/][#fff font-size: 20px]{valueY}[/] [#fff]{additional}[/]"
					var circle = bullet.createChild(am4core.Circle);
					circle.radius = 4;
					circle.fill = am4core.color("#fff");
					circle.strokeWidth = 3;
				}); //end drawChart6
			}
	    
</script>
<title>ExerciseRecord</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<style>
.container {
	display: grid;
	grid-template-rows: 400px 400px 400px;
	grid-template-columns: 600px 500px 500px;
	grid-gap: 5px;
}
.ui-datepicker{ font-size: 20px; }
#wrap{
    width:100%;
    height:100%;
    position:relative;
} 
#wrap .box{ 
    position:absolute;
    left:50%;
    top:50%;
    margin-left:-200px;
    margin-top:-130px;
}
</style>
</head>
<body>
	<div class="container">
		<div id="wrap">
			<div id="datepicker" style="display: inline-block;" class="box"></div>
		</div>
		
		<div>
			<h3>월간 부위별 근력운동 분석(횟수)</h3>
			<div id="drawChart2" style="height: 90%;"></div>
		</div>
		
		<div>
			<h3>주간 운동부위 상세</h3>
			<div id="drawChart3" style="height: 90%;"></div>
		</div>
		
		<div>
			<h3>일간 운동 시간(분)</h3>
			<div id="drawChart4"></div>
			<div style="text-align: center;">
				<button type="button" id="b1">Previous</button>
				<button type="button" id="b2">Next</button>
				<button type="button" id="b3">Change Zoom</button>
			</div>
		</div>
		
		<div>
			<h3>일간 운동 시간(분)</h3>
			<div id="drawChart5" style="height: 90%;"></div>
		</div>
		
		<div>
			<h3>일간 운동부위 상세</h3>
			<div id="drawChart6" style="height: 90%;"></div>
		</div>
	</div>
</body>
</html>