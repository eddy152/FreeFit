<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
	.cent {
		margin: 45px;
	}

</style>

<div>
	<div>
		<h1>${food.name } 회원님의 식단</h1>
		<input type="text" name="id" hidden="hidden" value="${food.id }"><br>
		<div>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='getMemberFoodInsert?id=${food.id}'">상세보기</button>
		</div>
		<br>
		
		<a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">회원정보</a>
		<div class="row">
		  <div class="col">
		    <div class="collapse multi-collapse" id="multiCollapseExample1">
		      <div class="card card-body">      		
				  <table class="table">
					<tr>
		
						<td>이름</td>
						<td>${food.name }<input name="name" value="${food.id }" hidden="hidden">
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
						<td>${food.weight }<input type="text" hidden="hidden" name="weight" value="${food.weight }">
						</td>
					</tr>
					<tr>
						<td colspan="3" style="width: 200px;"><textarea>특이사항</textarea>
						</td>
					</tr>
				</table> 
		      </div>
		    </div>
		  </div>
		 </div>
		
	</div><br>
	</div>
<div class="cent">
	<form class="form-inline">
		<button type="button" class="btn btn-light" onclick="moveDate(-7)"><</button>
		<div class="form-group mx-sm-3 mb-2">
		<input type="text" class="form-control" name="dates" value="${week[0].sysdate}">
		</div>
		<input type="text" hidden="hidden" id="date" value="${list[0].sysdate}">
		<button type="button" onclick="moveDate(7)" class="btn btn-light">></button>
	</form>
</div>
<div>
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
		var weight = $('input:text[name="weight"]').val(); // = 몸무게
		var count = weight * 12 * 1.5;
		var arr = [];
		arr.push([ '섭취날짜', '실제섭취량', '권장량' ]);
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
								legend: 'bottom',
								 width: '400',
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
