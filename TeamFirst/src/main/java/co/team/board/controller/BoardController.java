package co.team.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.board.service.AdminNoticeBoardVO;
import co.team.board.service.impl.AdminNoticeBoardMapper;

@Controller
public class BoardController {
	
	//전체조회
	@Autowired AdminNoticeBoardMapper boardMapper;
	@RequestMapping("/AdminNoticeBoardList")
	public String getAdminNoticeBoardList(Model model) {
		model.addAttribute("list", boardMapper.adminNoticeBoardList());
		return "board/adminNoticeBoardList";
	}
	//단건조회
	@RequestMapping("/AdminNoticeBoard")
	public String getAdminNoticeBoard(Model model, AdminNoticeBoardVO vo) {
		model.addAttribute("board", boardMapper.adminNoticeBoard(vo));
		return "board/adminNoticeBoard";
	}
}
