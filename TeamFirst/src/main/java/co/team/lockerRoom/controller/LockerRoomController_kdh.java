package co.team.lockerRoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.lockerRoom.service.LockerRoomVO;
import co.team.lockerRoom.service.impl.LockerRoomMapper_kdh;

@Controller
public class LockerRoomController_kdh {
	
	@Autowired LockerRoomMapper_kdh service;
	
	/*
	 * // 락커룸 전체 조회
	 * 
	 * @RequestMapping("/getSearchRoom") public String getSearchRoom(Model model) {
	 * model.addAttribute("list", service.getSearchRoom()); return
	 * "popup/Locker/lockerRoom"; }
	 */
	
	// 락커룸 단건 조회
	@RequestMapping("/getRoom")
	@ResponseBody
	public LockerRoomVO getRoom(LockerRoomVO vo) {
		return service.getRoom(vo);
	}
	
	/*
	 * // 락커룸 수정
	 * 
	 * @PostMapping("/updateRoom") public String updateRoomProc(LockerRoomVO vo) {
	 * System.out.println(vo.getLock_width()+" "+vo.getRoom_no());
	 * service.updateRoom(vo); service.getRoom(vo); return
	 * "redirect:/getSearchRoom";
	 * 
	 * }
	 */
	
	// 락커룸 삭제
	@PostMapping("/deleteRoom")
	@ResponseBody
	public int deleteRoom(LockerRoomVO vo) {
		System.out.println("룸번호 : " + vo.getRoom_no());
		return service.deleteRoom(vo);
				
	}
	
	// 락커 갯수 관리
	@PostMapping("/manageRoom")
	@ResponseBody
	public LockerRoomVO manageRoom(LockerRoomVO vo) {
		service.manageRoom(vo);
	return service.getRoom(vo);
		
	}
	
}
