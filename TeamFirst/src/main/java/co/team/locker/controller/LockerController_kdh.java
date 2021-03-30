package co.team.locker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.locker.service.LockerVO;
import co.team.locker.service.impl.LockerMapper_kdh;

@Controller
public class LockerController_kdh {
	@Autowired LockerMapper_kdh service;
	
	// 락커 전체 조회
	@RequestMapping("/getSearchLocker")
	public String getSearchLocker(Model model) {
		model.addAttribute("list", service.getSearchLocker());
		return "Locker/getSearchLocker";
	}
	
	// 락커 단건 조회
	
	@RequestMapping("/getLocker")
	public String getLocker(LockerVO vo, Model model) {
		model.addAttribute("locker", service.getLocker(vo));
		return "Locker/getLocker";
	}
	
	// 락커 등록
	@GetMapping("/insertLocker")
	public String insertLocker() {
		
		return "Locker/insertLocker";
	}
	
	@PostMapping("/insertLocker")
	public String insertLockerProc() {
		
		return "redirect:/";
	}
	
	
	// 락커 수정
	
	@GetMapping("/updateLocker")
	public String updateLocker() {
		return "Locker/updateLocker";
	}
	
	// 락커 삭제
}
