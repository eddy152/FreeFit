package co.team.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.reservation.service.ReservationService;
import co.team.reservation.service.ReservationVO;

@Controller
public class ReservationController {

	@Autowired
	ReservationService service;
	
	@ResponseBody
	@GetMapping("/getReserv")
	public List<ReservationVO> getReserv(ReservationVO vo){
		return service.getReserv(vo);
	}
	
	@GetMapping("/insertReserv")
	public String insertReserv(ReservationVO vo) {
		
		service.insertReserv(vo);
		return "redirect:/getReserv";
	}
	
}
