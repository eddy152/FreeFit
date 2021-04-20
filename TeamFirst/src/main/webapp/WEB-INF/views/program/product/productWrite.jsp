<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>productWrite</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script>
	window.onload = function() {
		
		/*  수강료 등록 버튼 
							--변경해야할것
							<tr>
								<td>
								<input  type="text" size="6" id="tuition_title" name="tu_list[0].tuition_title"> 
								<input  type="text" size="1" id="unit" name="tu_list[0].unit"> 
								<input type="text"  size="5" id="tuition" name="tu_list[0].tuition">
								</td>
							</tr>	
		
						---원본
							var a = document.querySelector("input[name=tuition_title]").cloneNode(); //input name=gender이면서 checked된 input element 찾기
							var b = document.querySelector("input[name=unit]").cloneNode();
							var c = document.querySelector("input[name=tuition]").cloneNode();
							
							
							*/
		let buttonElement1 = document.getElementById('tui');
		var count = 0;
		 buttonElement1.addEventListener('click', function(){
			var a = document.querySelector("#tid input[id=tuition_title]").cloneNode(); //input name=gender이면서 checked된 input element 찾기
			var b = document.querySelector("#tid input[id=unit]").cloneNode();
			var c = document.querySelector("#tid input[id=tuition]").cloneNode();
		
				a.name = a.name.replace(/\[\]/g, "["+count+"]")
				b.name = b.name.replace(/\[\]/g, "["+count+"]")
				c.name = c.name.replace(/\[\]/g, "["+count+"]") 
				//노드 스트링변환하기
			
	 		$('<tr>').append($('<td>').html(a))
					 .append($('<td>').html(b))
					 .append($('<td>').html(c))
		     		 .appendTo($('#tuition_no'));
				count ++;
			}) // tuiList

			/*  강사 등록 버튼 */
		let buttonElement = document.getElementById('btn'); //버튼 정의

		buttonElement.addEventListener('click', function() { //버튼에 클릭 이벤트 걸기
			var a = document.querySelector("input[name=id]:checked"); //input name=gender이면서 checked된 input element 찾기
			var ihtml = a.parentElement.parentElement.innerHTML; // checked된 input의 부모의 innerHTML 

			console.log(ihtml); //그냥 알림
			document.getElementById('trainer_id').innerHTML = ihtml; // 아이디로 div 찾아서 innerHTML에 += 로 위에서 찾은값 추가
		});

		$('#modal').modal("hide");

	}
</script>


</head>
<body>
	<div class="container my-4">
		<div align="center">
			<h3>강습등록</h3>
			<br> <br>
		</div>
		<form class="form" name="frm" method="post" action="productWrite">
		  <div align="center">	
			<div class="form-group">
				<select name="category" style="width: 180px">
					<option  value="강습분류">강습분류</option>
					<option  value="1">개인강습</option>
					<option  value="2">단체강습</option>
				</select>&nbsp;&nbsp; &nbsp; &nbsp; 
				<select name="course_title" style="width: 180px">
					<option value="">강습명</option>
					<option value="1:1PT">1:1PT</option>
					<option value="그룹PT">그룹PT</option>
					<option value="스피닝">스피닝</option>
					<option value="HomePT">HomePT</option>
				</select><br> <br> 
				<select name="course_day" style="width: 90px">
					<option value="">강습시간</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
				</select>
				<th>시</th>&nbsp;&nbsp; 
				<select name="course_day" style="width: 90px">
					<option value="">강습요일</option>
					<option value="월">월</option>
					<option value="화">화</option>
					<option value="수">수</option>
					<option value="목">목</option>
					<option value="금">금</option>
					<option value="토">토</option>
					<option value="일">일</option>
				</select><br> <br> 
				<label for="title">강습시작일</label>&nbsp; 
					<input type="date" name="start_date"><br> <br> 
				<label for="title">강습종료일</label>&nbsp; 
					<input type="date" name="end_date">	 <br> <br> 
				<label for=" ">수강체크</label>&nbsp; 
					<input type="radio" name="unit_method_get" value="1">기간제&nbsp;&nbsp;
					<input type="radio" name="unit_method_get" value="2">횟수제&nbsp;&nbsp; 
				<label for="title">정원 </label> 
					<input type="text" name="limit" size="1">명
			</div>
			</div><!-- center div  -->
			<div class="row justify-content-between">
				<div class=table style="width: 49%; float: left;">
					<h3>수강료</h3>
					<table>
						<thead>
							<tr>
								<th>요금제</th>
								<th>기간</th>
								<th>수강료</th>
							</tr>
						</thead>
						<tbody id='tuition_no'>
								<tr>
									<td>
									</td>
								</tr>	
						</tbody>
					</table>
				</div>
				<!--   table div -->
				<div class=table style="width: 50%; float: right;">
					<h3>담당강사</h3>
					<table class=table>
						<thead>
							<tr>
								<th>강사명</th>
								<th>성별</th>
								<th>체크</th>
							</tr>
						</thead>
						<tbody id='trainer_id'>
							<!-- thead, tbody 분리하여 tbody id에 getElementById('trainer_id')innerHTML 값을 찾아 넣어준다. -->
								
						</tbody>

					

					</table>
				</div>
				<!--   table div -->
				<br> <br>


				<div class="col-5">
					<!--수강료 Button trigger modal -->
					<button type="button" class="btn btn-outline-info "
						data-toggle="modal" data-target="#exampleModal" name="addtu">수강료
						추가하기</button>
				</div>
				<div class="col-6">
					<!-- 담당강사 Button trigger modal -->
					<button type="button" class="btn  btn-outline-dark"
						data-toggle="modal" data-target="#exampleModal1">담당강사
						추가하기</button>
					<br> <br>
				</div>

			</div>
				<input type="submit" class="btn  btn-dark" value="작성하기"> <a
				class="btn btn-danger" href="productManagement">목록가기</a>
			</form> <!--  form tag 끝 -->
			<!--/ row justify-content-between -->
			<!--수강료 Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">요금제 등록</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="tid">
							<span>요금제</span> <input  type="text" id="tuition_title"  size="6" name="tulist[].tuition_title"><span>원</span><br><br> 
							<span>기간</span> <input  type="text" id="unit" size="1" name="tulist[].unit"><span>개월</span><br> <br> 
							<span>수강료</span> <input type="text" id="tuition" size="5" name="tulist[].tuition"><span>원</span><br>
							<br>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"  id="tui" name="tuiList"
								value="${tuition.no}" data-dismiss="modal">요금제 등록</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
						</div>

					</div>
				</div>
			</div>
			<!--  수강료 Modal 끝 -->

			<!--담당강사리스트  Modal -->
			<div class="modal fade" id="exampleModal1" tabindex="-1"
				aria-labelledby="exampleModalLabel1" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel1">담당강사 등록</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div>
							<table class=table id='trains'>
								<tr>
									<th>강사명</th>
									<th>성별</th>
								</tr>
								<c:forEach items="${train}" var="trainer">
									<tr>
										<td>${trainer.name}</td>
										<td>${trainer.gender}</td>
										<td><input type="radio" name="id" value="${trainer.id}" ></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" id="btn" class="btn btn-primary"
								data-dismiss="modal">등록</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<!--담당강사 Modal 끝 -->

		
		
	</div>
</body>
</html>