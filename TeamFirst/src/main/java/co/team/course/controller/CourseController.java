package co.team.course.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.course.service.CourseService;
import co.team.course.service.Course_Info_VO;
import co.team.course.service.Course_TuitionVO;
import co.team.course.service.impl.CourseMapper;
import co.team.trainer.service.TrainerService;
import co.team.trainer.service.TrainerVO;

@Controller
public class CourseController {

	@Autowired
	CourseService courseService;
	@Autowired
	TrainerService trService;
	@Autowired 
	CourseMapper courseMapper;

	// 강습정보페이지
	@RequestMapping("/productManagement")
	public String getSearchCourse(Course_Info_VO vo, Model model) {
		model.addAttribute("list", courseService.getCourse(vo));

		return "program/product/productManagement";
	}

	// 강습등록폼
	@GetMapping("/productWrite")
	public String productWriteForm(Course_Info_VO vo, Model model, Course_TuitionVO vo1, TrainerVO vo2) {

		model.addAttribute("tuit", courseService.getCourse_Tuition(vo1));
		model.addAttribute("train", trService.getTrainer(vo2));
		return "program/product/productWrite";
	}

	// 강습등록
	@RequestMapping("/productWrite")
	public String productWrite( Course_Info_VO vo, Course_TuitionVO tvo, HttpSession session){
		vo.setTrainer_id((String) session.getAttribute("id"));
		
		courseService.productInsert(vo); //  1. Info의 vo를 가져온다.
		vo = courseService.getCourse(vo).get(0); 
		courseService.productInserts(vo, tvo.getTulist()); 
		//	console.log(tvo.getTulist().get(0).getTuition_title());
		return "redirect:/productManagement";
	}
	//수정폼
	
	@GetMapping("/productUpdate")
	public String productUpdateForm(Course_Info_VO vo, Model model, Course_TuitionVO vo1, TrainerVO vo2) {
		vo = courseService.get1Course(vo);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("tuit", courseService.getCourse_Tuition(vo1));
		model.addAttribute("train", trService.getTrainer(vo2));
		return "program/product/productUpdate";
	}
	
		//강습수정		 
	@PostMapping("/productUpdate")
	public String productUpdate(Course_Info_VO vo, Model model,Course_TuitionVO vo1, TrainerVO vo2) {
		
		
		courseService.productUpdate(vo); 
		vo = courseService.getCourse(vo).get(0);   
		courseService.productUpdates(vo, vo1.getTulist()); 
		
		
		return "redirect:/productManagement";
	}							
	
	@GetMapping("/proDel")
	public String ProDel(Course_Info_VO vo){
		Course_TuitionVO tvo = new Course_TuitionVO();
		
		courseService.proDel(vo);
		tvo.setCourse_no(tvo.getCourse_no());
		courseService.proDel(tvo);
		return "redirect:/productManagement";
	}							
	
	
	

}
