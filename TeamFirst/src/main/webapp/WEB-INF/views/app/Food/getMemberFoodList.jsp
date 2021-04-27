<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div>
	<div>
		<h1>${food.name } ȸ������ �Ĵ�</h1>
		<input type="text" name="id" hidden="hidden" value="${food.id }"><br>
		<div>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='getMemberFoodInsert?id=${food.id}'">�󼼺���</button>
		</div>
		<br>
		
		<a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Toggle first element</a>
		<div class="row">
		  <div class="col">
		    <div class="collapse multi-collapse" id="multiCollapseExample1">
		      <div class="card card-body">      		
				  <table class="table">
					<tr>
		
						<td>�̸�</td>
						<td>${food.name }<input name="name" value="${food.id }" hidden="hidden">
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
		      </div>
		    </div>
		  </div>
		 </div>
		
		
		
		
		
	</div><br>
	<div>
		<button type="button" onclick="moveDate(-7)"><</button>
		<input type="text" name="dates" value="${week[0].sysdate}">��°
		<input type="text" hidden="hidden" id="date" value="${list[0].sysdate}">
		<button type="button" onclick="moveDate(7)">></button>
	</div>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</div>

<script type="text/javascript">
	google.charts.load('visualization', '1', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		moveDate(0);
	}
	var cnt = 0;
	function moveDate(count) {
		cnt += count
		var weight = $('input:text[name="weight"]').val(); // = ������
		var count = weight * 12 * 1.5;
		var arr = [];
		arr.push([ '���볯¥', '�������뷮', '���差' ]);
		$.ajax({
			url: 'getWeeks',
			data : { id : $('input:text[name="name"]').val(),
			    	cnt : cnt},
			dataType: 'json',
			type: 'get',
			success : function(result) { // === dual
			$('input:text[name="dates"]').val(result[0].week);
					
					for(i=0; i<result.length; i++) {
						
						arr.push([result[i].take_date, parseInt(result[i].calorie), count])
					}	
							
							var data = google.visualization.arrayToDataTable(arr);

							var options = {
								width: '300',
								height : '500',
								vAxis : { viewWindow : { max : 3000 }
								},
								seriesType : 'bars',
								series : { 1 : { type : 'line' }
								}

							};

							var chart = new google.visualization.ComboChart(document.getElementById('columnchart_material'));

							chart.draw(data, options);
						}
			
		});// ajax
		
	}
</script>
