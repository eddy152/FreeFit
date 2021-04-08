<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
				[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

		var options = {
			title : 'My Daily Activities',
			pieHole : 0.55,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
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
</style>
</head>
<body>
	<div class="container">
		<div></div>
		<div id="donutchart"></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
	</div>
</body>
</html>