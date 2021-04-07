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
          ['1', '�������뷮', '���差'],
          ['2014', 1000, 400],
          ['2015', 1170, 460],
          ['2016', 660, 1120],
          ['2017', 1030, 540]
        ]);

        var options = {
          chart: {
            title: '�̹��� �Ĵ�',
            subtitle: $('#name').val() + ' ȸ������ �Ĵ� ���',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
</head>
<body>

<h1>ȸ������</h1>

<table border="1">
	<tr>
		<td rowspan="5" style="width:100px;">����</td>
		<td>�̸�</td>
		<td id="name">${food.name }</td>
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
		<td>${food.weight }</td>
	</tr>
	<tr>
		<td colspan="3" style="width:200px;">
			<textarea>Ư�̻���</textarea>
		</td>
	</tr>
	</table>
	<br>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</body>
</html>