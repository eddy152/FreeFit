package co.team.calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.reservation.service.ReservationService;
import co.team.reservation.service.ReservationVO;

@Controller
public class CalendarController {

	@Autowired ReservationService reservationService;
	
	//calendar 불러오기
	@RequestMapping("/calendar")
	public String calendar(ReservationVO vo, Model model) {
		model.addAttribute("list", reservationService.getReserv(vo));
		return "calendar/calendar";
		
	}
	
	@PostMapping("/insertCalendar")
	@ResponseBody
	public ReservationVO insertCalendar(ReservationVO vo) {
		
		reservationService.insertReserv(vo);
		
		return vo;
		
	}
	
	
	
	@RequestMapping("/trainerCal")
	public String trainerCal(ReservationVO vo, Model model) {
		model.addAttribute("list", reservationService.getReserv(vo));
		return "calendar/trainerCal";
		
	}
	
	
}
