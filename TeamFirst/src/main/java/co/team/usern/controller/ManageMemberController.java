package co.team.usern.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.team.usern.service.ManageMemberService;
import co.team.usern.service.ManageMemberVO;

@Controller
public class ManageMemberController {
	@Autowired
	ManageMemberService manageMemberService;
	//수강회원 조회
	@RequestMapping("/manageList")
	public String manageList(ManageMemberVO vo, Model model) {
		model.addAttribute("memList", manageMemberService.manageList(vo));
		return "program/MemberManagement/manageList";
	}
	//상세보기
	@GetMapping("/getMem")
	public String getMem(Model model, @RequestParam("course_reg_no") int course_reg_no) {
	 model.addAttribute("cosmem", manageMemberService.getMem(course_reg_no));
	
	 return "program/MemberManageMent/getMem";
	}
}
