package co.team.locker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.locker.service.LockerVO;
import co.team.locker.service.impl.LockerMapper_kdh;
import co.team.lockerRoom.service.LockerRoomVO;
import co.team.lockerRoom.service.impl.LockerRoomMapper_kdh;

@Controller
public class LockerController_kdh {
	@Autowired LockerMapper_kdh service;
	
	// 락커 전체 조회
	@RequestMapping("/getSearchLocker")
	public String getSearchLocker(Model model, LockerVO vo) {
		model.addAttribute("list", service.getSearchLocker(vo));
		return "homepage/Locker/getSearchLocker";
	}
	
	// 락커 단건 조회
	
	@RequestMapping("/getLocker")
	@ResponseBody
	public LockerVO getLocker(LockerVO vo) {
		return service.getLocker(vo);
	}
	
	// 락커 등록
	@PostMapping("/insertLocker")
	@ResponseBody
	public LockerVO insertLocker(LockerVO vo) {
		service.insertLocker(vo);
		return service.getLocker(vo);
	}
	
	// 락커 수정
	@PostMapping("/updateLocker")
	@ResponseBody
	public LockerVO updateLocker(LockerVO vo) {
		service.updateLocker(vo);
		return service.getLocker(vo);
	}
	
	// 락커 초기화
	
	// 락커 삭제
	@PostMapping("/deleteLocker")
	@ResponseBody
	public LockerVO deleteLocker(LockerVO vo) {
		service.deleteLocker(vo);
		return service.getLocker(vo);
	}
}
