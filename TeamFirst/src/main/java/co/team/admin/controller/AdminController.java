package co.team.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.admin.service.AdminService;
import co.team.admin.service.AdminVO;

@Controller //컨트롤러 어노테이션 달기
public class AdminController {
	@Autowired
	AdminService service;

	// 리스트 조회
	@ResponseBody
	@GetMapping("/getTest") 
	public List<AdminVO> getAdmin(AdminVO vo) {

		return service.getAdmin(vo);
	}

	//단건 등록
	@GetMapping("/insertAdmin") 
	public String insertAdmin(AdminVO vo) {
		service.insertAdmin(vo);
		return "redirect:/getTest";
	}
	
	
}
