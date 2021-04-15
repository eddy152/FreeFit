package co.team.trainer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.trainer.service.TrainerService;
import co.team.trainer.service.TrainerVO;
import org.springframework.web.bind.annotation.RequestParam;

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

  //단건조회
  @GetMapping("/getTrainer")
  public String getTrainer(TrainerVO vo, Model model, @RequestParam("id") String id) {
    model.addAttribute("emp", service.getTrainer(id));
    return "trainer/getTrainer";
  }
  
  @GetMapping("/getTrainerModify")
  public String getTrainerModify( Model model, @RequestParam("id") String id) {
    model.addAttribute("emp", service.getTrainer(id));
    return "trainer/getTrainerModify";
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
