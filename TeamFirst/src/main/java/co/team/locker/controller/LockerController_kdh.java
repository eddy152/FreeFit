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
import co.team.user.service.UserVO;
import co.team.user.service.impl.UserMapper;

@Controller
public class LockerController_kdh {
	@Autowired LockerMapper_kdh service;
	@Autowired LockerRoomMapper_kdh mapper;
	@Autowired UserMapper userMapper;
	// 락커 전체 조회
	@RequestMapping("/getSearchLocker")
	public String getSearchLocker(Model model, LockerVO vo, LockerRoomVO rvo, UserVO uvo) {
		if(vo.getGender() == null) {
			vo.setGender("1");
		}
		model.addAttribute("list", service.getSearchLocker(vo));
		model.addAttribute("room", mapper.getSearchRoom());
		model.addAttribute("user", userMapper.getSearchUser(uvo));
		
		return "homepage/Locker/getSearchLocker";
	}
	
	// 락커 단건 조회
	
	@RequestMapping("/getLocker")
	@ResponseBody
	public LockerVO getLocker(LockerVO vo) {
		System.out.println(vo.getLock_no());
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
