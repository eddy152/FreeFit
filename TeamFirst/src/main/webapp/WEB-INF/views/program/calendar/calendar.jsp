<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<meta charset='utf-8' />
<link href='./resources/Fullcalendar/main.css' rel='stylesheet' />
<script src='./resources/Fullcalendar/main.js'></script>
<script>
var calendar
/*      날짜or버튼 클릭시 페이지화면 입력기능      
 *   	입력시 빨간글씨로 입력값이 나온다. 새로고침하면 글씨바탕색이 사라진다. 
 */
function form_ajax(){
	var date = new Date( $('#day').val() +'T00:00:00');
	var content = $('[name=content]').val();
	var queryString = $("form[name=calForm]").serialize();
	$.ajax({
		type : 'post',
		url : "insertCalendar",
		data : queryString,
		success : function(data) {
			console.log(data);
			calendar.addEvent({
				title : content, 
				start : date,
				allDay : true,
				color : 'red',
				textcolor : 'yellow'
			})// addEvent
		}// function data
	})// ajax
} // form_ajax
/*   일정입력  date 포맷      */	
function date_to_str(format)
{
    var year = format.getFullYear();
    var month = format.getMonth() + 1;
    if(month<10) month = '0' + month;
    var date = format.getDate();
    if(date<10) date = '0' + date;
  
    return year + "-" + month + "-" + date;
}
/*      날짜or버튼 클릭시 DB에 내용 입력기능      */
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var today = new Date();
    
    var year = today.getFullYear();
    var month = ('00' + (today.getMonth() + 1)).slice(-2);
    var date = today.getDate();
 	
    
     calendar = new FullCalendar.Calendar(calendarEl, {
    	 
    	headerToolbar: {
    	hour: 'numeric',
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      
      locale : 'ko',
      initialView:'timeGridWeek',
      initialDate: year+'-'+month+'-'+date,
      
     navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      /*  삭제 */
      eventClick: function(arg) {
    	  console.log(arg)
        if (confirm('삭제합니까?')) {
    		 $.ajax({
    	       	  url : 'deleteReserv',
    	       	  type: 'post',
    	       	  data : {reservation_no : arg.event._def.publicId},
    	       	  dataType : 'json',
    	       	  success : function(data){
    	       	  }
    	   	  }) // ajax
      
        } // if
    	 }, // function
        
      
      navLinkDayClick: function(date, jsEvent) {
    	   var today = date_to_str(date);
    	 
    	    $("#day").val(today);
    		$('#exampleModal').modal('show');
    	    
    	  },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events:
    	  [
    		  <c:forEach items="${list}" var="calendar">
        {
          id : '${calendar.reservation_no}',
          title: '${calendar.content}' ,
          start: '${calendar.reservation_date}'
        	  
        },
        
    		  </c:forEach>
      ]
    });
    
    calendar.render();
  });
</script>
	<div align="center">
		<h2>트레이너 스케줄</h2>
		<br>
		<br>
		<div id='calendar'></div>
		<br>
		<br>
		<!-- Button trigger modal -->
		<input type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal" value="클릭하면 일정입력">
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 입력</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="calForm">
					<div class="modal-body">
						<input name="reservation_date" class="formInput" type="date"
							id="day" /><br> <input name="content" type="text"
							placeholder="일정입력합니까?" />
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" onclick="form_ajax()" class="btn btn-primary"
						id="">저장</button>
				</div>

			</div>
		</div>
	</div>
