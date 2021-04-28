package co.team.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.reservation.service.ReservationService;
import co.team.reservation.service.ReservationVO;
import co.team.trainer.service.TrainerService;
import co.team.trainer.service.TrainerVO;

@Controller
public class ReservationController {

	@Autowired
	ReservationService service;

	@Autowired
	TrainerService trService;

	@ResponseBody
	@GetMapping("/getReserv")
	public List<ReservationVO> getReserv(ReservationVO vo) {
		return service.getReserv(vo);
	}

	/*
	 * @GetMapping("/insertReserv") public String insertReserv(ReservationVO vo) {
	 * 
	 * service.insertReserv(vo); return "redirect:/getReserv"; }
	 */

	@GetMapping("insertReserv")
	public String insertReservForm(HttpSession session, Model model) {
		
		int fitness_id = Integer.parseInt(String.valueOf(session.getAttribute("fitness_id")));
		TrainerVO tvo = new TrainerVO();
		tvo.setFitness_id(fitness_id);
		model.addAttribute("train", trService.getTrainerList(tvo));

		return "app/reservation/appUserReserv";
	}
	
	@PostMapping("insertReserv")
	public String insertReserv(ReservationVO vo, HttpSession session) {
		String id = (String) session.getAttribute("id");
		vo.setUser_id(id);
		System.out.println(vo.getReservation_date());
int result= service.insertReserv(vo);
if (result==1) {
		return "redirect:/myReserv";}
else return "redirect:/insertReserv";
	}
	
	@GetMapping("/myReserv")
	public String myReserv(HttpSession session, Model model) {
		ReservationVO vo= new ReservationVO();
		vo.setUser_id((String)session.getAttribute("id"));
		model.addAttribute("reserv",service.getReserv(vo));
		return "app/reservation/myReserv";
	}
	
	
	
	
	
}
