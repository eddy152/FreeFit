package co.team.trainer.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.trainer.service.TrainerService;
import co.team.trainer.service.TrainerVO;

@Controller
public class TrainerController {

	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	TrainerService service;
	
	//트레이너 전체 리스트
	@RequestMapping("/trainerList")
	public String trainerList(TrainerVO vo, Model model) throws Exception {
		model.addAttribute("list", service.getTrainerList(vo));
		return "trainer/trainerList";
	}

}
