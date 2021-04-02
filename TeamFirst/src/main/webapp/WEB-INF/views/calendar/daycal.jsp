<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='./resources/Fullcalendar/main.css' rel='stylesheet' />
<script src='./resources/Fullcalendar/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      locale : 'ko',
      initialDate: '2021-04-01',
      initialView:'timeGridWeek',
      businessHours: true,
     navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {		
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('삭제합니까?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: '1일',
          start: '2021-04-01T10:00',
    	  end : '2021-04-01T18:00'
    	  
        },
        {
        	title : 'PT예약',
        	start : '2021-04-02T07:00',
        	end : '2021-04-03T010:00'
        }
        ,
        {
          title: 'YD_PT근무',
          start: '2021-04-03T05:00',
          end: '2021-04-10T16:00'
        }
      ]
    });
    
    calendar.render();
  });
  

  

</script>


<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 100%;
    margin: 0 auto;
  }

</style>
</head>


<body>
  <div id='calendar'></div>
	</body>
</html>
