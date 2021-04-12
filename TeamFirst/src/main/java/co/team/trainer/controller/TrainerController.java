package co.team.trainer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.trainer.service.TrainerService;
import co.team.trainer.service.TrainerVO;

@Controller
public class TrainerController {
	
	@Autowired
	TrainerService service;
	
	//전체리스트
	@RequestMapping("/TrainerList")
	public String trainerList(TrainerVO vo, Model model) throws Exception {
		model.addAttribute("list", service.getTrainerList(vo));
		return "trainer/trainerList";
	}
}
