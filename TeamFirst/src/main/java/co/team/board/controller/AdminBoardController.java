package co.team.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.board.service.AdminNoticeBoardService;
import co.team.board.service.AdminNoticeBoardVO;
import co.team.board.service.AdminQnaBoardService;
import co.team.board.service.AdminQnaBoardVO;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class AdminBoardController {

	//어드민 게시판 컨트롤러
	@Autowired
	AdminNoticeBoardService service;
	@Autowired
	AdminQnaBoardService service2;
	
	//어드민 공지 이벤트 리스트 시작
	
	//섬머노트 test
	@GetMapping("/adminBoard")
	public String boardWrite() {
	  return "board/adminBoard";
	}
	
	//전체조회
	//@ResponseBodya
	//@GetMapping
	@RequestMapping("/getAdminNoticeBoardList")
	public String getAdminNoticeBoardList(AdminNoticeBoardVO vo, Model model) throws Exception {
		model.addAttribute("list", service.getAdminNoticeBoardList(vo));
		return "board/getAdminNoticeBoardList";
	}
	//단건조회
//	@ResponseBody
//	@GetMapping("/getAdminNoticeBoard")
//	public AdminNoticeBoardVO getAdminNoticeBoard(AdminNoticeBoardVO vo) {
//		return service.getAdminNoticeBoard(vo);
//	}
	
	//@RequestParam("board_no")int board_no
	//단건조회
//	@GetMapping("/getAdminNoticeBoard")
//	public String getAdminNoticeBoard(Model model, AdminNoticeBoardVO vo) {
//	  model.addAttribute("board", service.getAdminNoticeBoard(vo.getBoard_no()));
//	  
//	  return "board/getAdminNoticeBoard";
//	}
	//단건+조회수증가
	@GetMapping("/getAdminNoticeBoard")
	public String getAdminNoticeBoard(Model model, @RequestParam("board_no")int board_no) {
		model.addAttribute("board", service.getAdminNoticeBoard(board_no));
		service.adminNoticeBoardHit(board_no);
		return "board/getAdminNoticeBoard";
	}
	//등록
	@PostMapping("/insertAdminNoticeBoard")
	public String insertAdminNoticeBoard(AdminNoticeBoardVO vo) {
		service.insertAdminNoticeBoard(vo);
		return "redirect:/getAdminNoticeBoardList";	
		//return "redirect:/getaAdminNoticeBoard?board_no="+vo.getBoard_no();
	
	}
	
	//수정
//	@PostMapping("updateAdminNoticeBoard")
//	public String updateAdminNoticeBoard(AdminNoticeBoardVO vo) {
//		service.updateAdminNoticeBoard(vo);
//		return "redirect:/getAdminNoticeBoardList";
//	}	
	@GetMapping("/updateAdminNoticeBoard")
	public String updateAdminNoticeBoard(@RequestParam("board_no")int board_no, Model model) {
		model.addAttribute("board", service.getAdminNoticeBoard(board_no));
		return "board/updateAdminNoticeBoard";
	}

	@PostMapping("/updateAdminNoticeBoard")
	public String updateAdminNoticeBoard(AdminNoticeBoardVO vo) {
		service.updateAdminNoticeBoard(vo);
		return "redirect: /updateAdminNoticeBoard?board_no="+ vo.getBoard_no();
	}
	//삭제
	@GetMapping("/deleteAdminNoticeBoard")
	public String deleteAdminNoticeBoard(AdminNoticeBoardVO vo, Model model, @RequestParam("board_no")int board_no) {
		model.addAttribute("board", service.deleteAdminNoticeBoard(board_no));
		service.deleteAdminNoticeBoard(board_no);
		return "redirect:/getAdminNoticeBoardList";
	}
	//어드민 공지 이벤트 리스트 끝
	
	
	
	
	//어드민 QnA 리스트 시작
	
	//전체조회
	@RequestMapping("/getAdminQnaBoardList")
	public String getAdminQnaBoardList(AdminQnaBoardVO vo, Model model) throws Exception {
		model.addAttribute("list", service2.getAdminQnaBoardList(vo));
		return "board/getAdminQnaBoardList";
	}
	//전체조회
//	@ResponseBody
//	@GetMapping("/getAdminQnaBoardList")
//	public List<AdminQnaBoardVO> getAdminQnaBoardList(AdminQnaBoardVO vo) {
//		//System.out.println(service2.getAdminQnaBoard(vo));
//		return service2.getAdminQnaBoardList(vo);
	
	//단건조회
	@ResponseBody
	@GetMapping("/getAdminQnaBoard")
	public AdminQnaBoardVO getAdminQnaBoard(AdminQnaBoardVO vo) {
		return service2.getAdminQnaBoard(vo);
	}
	//등록
	@GetMapping("/insertAdminQnaBoard")
	public String insertAdminQnaBoard(AdminQnaBoardVO vo) {
		service2.insertAdminQnaBoard(vo);
		return "redirect:/getAdminQnaBoardList";
	}
	//수정
	@GetMapping("/updateAdminQnaBoard")
	public String updateAdminQnaBoard(AdminQnaBoardVO vo) {
		service2.updateAdminQnaBoard(vo);
		return "redirect:/getAdminQnaBoardList";
	}
	//삭제
	@GetMapping("/deleteAdminQnaBoard")
	public String deleteAdminQnaBoard(AdminQnaBoardVO vo) {
		service2.deleteAdminQnaBoard(vo);
		return "redirect:/getAdminQnaBoardList";
	}
}
