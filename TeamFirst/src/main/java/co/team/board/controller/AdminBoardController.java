package co.team.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.board.service.AdminNoticeBoardService;
import co.team.board.service.AdminNoticeBoardVO;

@Controller
public class AdminBoardController {

	@Autowired
	AdminNoticeBoardService service;
	
	//리스트조회
	@ResponseBody
	@GetMapping("/getAdminNoticeBoardList")
	public List<AdminNoticeBoardVO> adminNoticeBoardList(AdminNoticeBoardVO vo) {
		return service.adminNoticeBoardList(vo);
	}
	
	
}
