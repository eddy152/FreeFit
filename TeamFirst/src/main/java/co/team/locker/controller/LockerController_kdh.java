package co.team.locker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.locker.service.LockerVO;
import co.team.locker.service.impl.LockerMapper_kdh;

@Controller
public class LockerController_kdh {
	@Autowired LockerMapper_kdh service;
	
	// 락커 전체 조회
	@RequestMapping("/getSearchLocker")
	public String getSearchLocker(LockerVO vo) {
		service.getSearchLocker(vo);
		return "Locker/getSearchLocker";
	}
	
	// 락커 단건 조회
	
	@RequestMapping("/getLocker")
	public String getLocker(LockerVO vo) {
		return "Locker/getLocker";
	}
}
