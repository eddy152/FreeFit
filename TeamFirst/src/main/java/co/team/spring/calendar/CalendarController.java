package co.team.spring.calendar;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class CalendarController {

	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	
	public String calendar(Model model, HttpServletRequest request, DateData dateData) {
	
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		
		if(dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		} // 검색날짜 end
		
		
		return null;
		
	}
}
