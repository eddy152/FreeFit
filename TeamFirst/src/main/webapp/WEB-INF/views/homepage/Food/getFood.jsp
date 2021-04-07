<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Food/getFood.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['1', '실제섭취량', '권장량'],
          ['2014', 1000, 400],
          ['2015', 1170, 460],
          ['2016', 660, 1120],
          ['2017', 1030, 540]
        ]);

        var options = {
          chart: {
            title: '이번주 식단',
            subtitle: $('#name').val() + ' 회원님의 식단 통계',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
</head>
<body>

<h1>회원정보</h1>

<table border="1">
	<tr>
		<td rowspan="5" style="width:100px;">사진</td>
		<td>이름</td>
		<td id="name">${food.name }</td>
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
		<td>${food.weight }</td>
	</tr>
	<tr>
		<td colspan="3" style="width:200px;">
			<textarea>특이사항</textarea>
		</td>
	</tr>
	</table>
	<br>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</body>
</html>