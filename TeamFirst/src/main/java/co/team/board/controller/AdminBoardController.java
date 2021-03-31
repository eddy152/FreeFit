package co.team.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.board.service.AdminNoticeBoardService;
import co.team.board.service.AdminNoticeBoardVO;
import co.team.board.service.AdminQnaBoardService;
import co.team.board.service.AdminQnaBoardVO;

@Controller
public class AdminBoardController {

	@Autowired
	AdminNoticeBoardService service;
	@Autowired
	AdminQnaBoardService service2;
	
	//어드민 공지 리스트
	@ResponseBody
	@GetMapping("/getAdminNoticeBoardList")
	public List<AdminNoticeBoardVO> getAdminNoticeBoardList(AdminNoticeBoardVO vo) {
		return service.getAdminNoticeBoardList(vo);
	}
	
	//어드민 QnA 리스트
	@ResponseBody
	@GetMapping("/getAdminQnaBoardList")
	public List<AdminQnaBoardVO> getAdminQnaBoardList(AdminQnaBoardVO vo) {
		System.out.println(service2.getAdminQnaBoard(vo));
		return service2.getAdminQnaBoardList(vo);
	}
	
}
