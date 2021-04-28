<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" rel="stylesheet">
<style type="text/css">

	.jm{font-family: 'Jeju Myeongjo', serif;}
 	.cent {
 		margin: auto;
 	}
 	
 	#frm-butn1 {
 		right: 0px;
 	}
 	
 	#frm-butn2 {
 		right: 0px;
 	}
 	
 	.cent2 {
 		margin: auto;
 	}
 	
 	
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
<div class="cent2">
	<h2 class="jm">${user.name } 회원님의 식단</h2>
</div>
<input type="text" name="id" hidden="hidden" value="${user.id }"><br>





<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-hover">
					<tr>
						<th scope="col">이름</th>
						<td>${user.name }<input name="name" value="${user.id }" hidden="hidden">
						</td>
					</tr>
					<tr>
						<th scope="col">나이</th>
						<td>${user.age }</td>
					</tr>
					<tr>
						<th scope="col">성별</th>
						<td>${user.gender }</td>
					</tr>
					<tr>
						<th scope="col">키</th>
						<td>${user.height }</td>
					</tr>
					<tr>
						<th scope="col">몸무게</th>
						<td>${user.weight }<input type="text" hidden="hidden" name="weight" value="${user.weight }">
						</td>
					</tr>
					<tr>
						<td colspan="3" style="width: 200px;"><textarea>특이사항</textarea>
						</td>
					</tr>
				</table> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 



<br><br><br>
<div class="cent">
<form class="form-inline">
  <button type="button" class="btn btn-light" onclick="moveDate(-7)"><</button>&nbsp;
  <div class="form-group mx-sm-3 mb-2">
    <input type="text" name="dates" class="form-control" value="${week[0].sysdate}">
  </div>&nbsp;
  <button type="button" class="btn btn-light" onclick="moveDate(7)">></button>
</form>
</div>

	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
	<button type="button" id="frm-butn1" class="btn btn-outline-secondary" onclick="location.href='getMemberFoodInsert?id=${user.id}'">상세보기</button>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">회원정보</button>
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