package co.team.lockerRoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.lockerRoom.service.LockerRoomVO;
import co.team.lockerRoom.service.impl.LockerRoomMapper_kdh;

@Controller
public class LockerRoomController_kdh {
	
	@Autowired LockerRoomMapper_kdh service;
	
	// 락커룸 전체 조회
	@RequestMapping("/getSearchRoom")
	public String getSearchRoom(Model model) {
		model.addAttribute("list", service.getSearchRoom());
		return "Locker/lockerRoom";
	}
	
	// 락커룸 수정
	@GetMapping("/updateRoom")
	public String updateRoom() {
		return "";
	}
	
	@PostMapping("/updateRoom")
	public String updateRoomProc(LockerRoomVO vo) {
		service.updateRoom(vo);
		return "redirect:/getSearchRoom";
	}
	
}
