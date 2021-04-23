package co.team.trainer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
  public String trainerList(TrainerVO vo, Model model, HttpSession session) throws Exception {
	//vo.setFitness_id((int)session.getAttribute("fitness_id"));
	vo.setFitness_id(Integer.parseInt((String)session.getAttribute("fitness_id")));
	model.addAttribute("list", service.getTrainerList(vo));
	return "program/trainer/trainerList";
  }

  //단건조회
  @GetMapping("/getTrainer")
  public String getTrainer(TrainerVO vo, Model model, @RequestParam("id") String id) {
    model.addAttribute("emp", service.getTrainer(id));
    return "program/trainer/getTrainer";
  }
  
  @GetMapping("/getTrainerModify")
  public String getTrainerModify( Model model, @RequestParam("id") String id) {
    model.addAttribute("emp", service.getTrainer(id));
    return "program/trainer/getTrainerModify";
  }
  
  @PostMapping("/updateTrainer")
  public String updateTrainer(TrainerVO vo, Model model) {
    service.updateTrainer(vo);
    return "redirect:/getTrainer?id=" + vo.getId();
  }

  @GetMapping("/deleteTrainer")
  public String deleteTrainer(Model model, @RequestParam("id") String id) {
    service.deleteTrainer(id);
    return "redirect:/trainerList";
  }
}
