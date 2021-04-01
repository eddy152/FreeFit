package co.team.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.board.service.UserNoticeBoardService;
import co.team.board.service.UserNoticeBoardVO;
import co.team.board.service.UserQnaBoardService;
import co.team.board.service.UserQnaBoardVO;

@Controller
public class UserBoardController {
	
	//유저 게시판 컨트롤러
	@Autowired
	UserNoticeBoardService service;
	@Autowired
	UserQnaBoardService service2;
	
	//유저 공지 이벤트 리스트
	
	//전체조회
	@RequestMapping("/getUserNoticeBoardList")
	public String getUserNoticeBoardList(UserNoticeBoardVO vo, Model model) throws Exception {
		model.addAttribute("list", service.getUserNoticeBoardList(vo));
		return "board/getUserNoticeBoardList";
	}
	//단건조회
	@ResponseBody
	@GetMapping("/getUserNoticeBoard")
	public UserNoticeBoardVO getUserNoticeBoard(UserNoticeBoardVO vo) {
		return service.getUserNoticeBoard(vo);
	}
	//등록
	@GetMapping("/insertUserNoticeBoard")
	public String insertUserNoticeBoard(UserNoticeBoardVO vo) {
		service.insertUserNoticeBoard(vo);
		return "redirect:/getUserNoticeBoardList";
	}
	//수정
	@GetMapping("/updateUserNoticeBoard")
	public String updateUserNoticeBoard(UserNoticeBoardVO vo) {
		service.updateUserNoticeBoard(vo);
		return "redirect:/getUserNoticeBoardList";
	}
	//삭제
	@GetMapping("/deleteUserNoticeBoard")
	public String deleteUserNoticeBoard(UserNoticeBoardVO vo) {
		service.deleteUserNoticeBoard(vo);
		return "redirect:/getUserNoticeBoardList";	
	}
	
	//유저 QnA 리스트
	
	//전체 조회
//	@ResponseBody
//	@GetMapping("/getUserQnaBoardList")
//	public List<UserQnaBoardVO> getUserQnaBoardList(UserQnaBoardVO vo) {
//		return service2.getUserQnaBoardList(vo);
//	}
	
	//전체 조회
	@RequestMapping("/getUserQnaBoardList")
	public String getUserQnaBoardlist(UserQnaBoardVO vo, Model model) throws Exception {
		model.addAttribute("list", service2.getUserQnaBoardList(vo));
		return "board/getUserQnaBoardList";
	}
	//단건 조회
	@ResponseBody
	@GetMapping("/getUserQnaBoard")
	public UserQnaBoardVO getUserQnaBoard(UserQnaBoardVO vo) {
		return service2.getUserQnaBoard(vo);
	}
	//등록
	@GetMapping("/insertUserQnaBoard")
	public String insertUserQnaBoard(UserQnaBoardVO vo) {
		service2.insertUserQnaBoard(vo);
		return "redirect:/getUserQnaBoardList";
	}
	//수정
	@GetMapping("/updateUserQnaBoard")
	public String updateUserQnaBoard(UserQnaBoardVO vo) {
		service2.updateUserQnaBoard(vo);
		return "redirect:/getUserQnaBoardList";
	}
	//삭제
	@GetMapping("deleteUserQnaBoard")
	public String deleteUserQnaBoard(UserQnaBoardVO vo) {
		service2.deleteUserQnaBoard(vo);
		return "redirect:/getUserQnaBoardList";
	
	}
}
