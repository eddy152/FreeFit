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
    	 height: "auto",
    	headerToolbar: {
    	hour: 'numeric',
        left: 'prev,next today',
        center: 'title',
        right: 'timeGridWeek,timeGridDay,listWeek'
      },
      
      locale : 'ko',
      initialView:'timeGridWeek',
      initialDate: year+'-'+month+'-'+date,
      
     navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      /*  삭제 */
      eventClick: function(arg) {

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
          groupId : '${calendar.trainer_id}',
          title: '${calendar.trainer_name} : ${calendar.user_name} 님 예약' ,
          start: '${calendar.reservation_date}',
          display:'auto'
        },

    		  </c:forEach>
      ],
      eventColor: '#000b28'
      
    });
    
    calendar.render();
  });
</script>

<div>
	<div class="text-center border-bottom my-4">
		<h2>트레이너 스케줄</h2>
	</div>

		<div id='calendar' class="m-xl-4"></div>

	</div>