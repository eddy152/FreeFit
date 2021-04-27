package co.team.board.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.board.service.AdminNoticeBoardListSearch;
import co.team.board.service.AdminNoticeBoardService;
import co.team.board.service.AdminNoticeBoardVO;
import co.team.board.service.AdminQnaBoardService;
import co.team.board.service.AdminQnaBoardVO;
import co.team.board.service.Pagination;

@Controller
public class AdminBoardController {
 
  //어드민 게시판 컨트롤러
  @Autowired
  AdminNoticeBoardService service;
  @Autowired
  AdminQnaBoardService service2;

  //어드민 공지 이벤트 리스트 시작

  //섬머노트 글작성
  @GetMapping("/adminBoard")
  public String boardWrite() {
    return "homepage/board/adminBoard";
  }

  //전체조회
  @RequestMapping("/getAdminNoticeBoardList")
  	public String getAdminNoticeBoardList(
  			 @RequestParam(value = "page", defaultValue = "1") int page,
  			 @RequestParam(value = "search", required = false) String search, Model model ) throws Exception {
	  		AdminNoticeBoardListSearch s = new AdminNoticeBoardListSearch();
	  			s.setPage(page-1);
	  			s.setSearch(StringUtils.isNotBlank(search) ? 
	  				       ("%" + StringUtils.trim(search)+"%") : null);
    		model.addAttribute("search", search);
    		List<AdminNoticeBoardVO> list = service.searchAdminNoticeBoardList(s);
    		int count = service.countAdminNoticeBoardList(s);
    		model.addAttribute("list", list);
    		Pagination pagination = new Pagination();
    		    pagination.setListCnt(count);
    		    pagination.setPageCnt(count/10 + (0<count%10?1:0)); // 10 :pagesize
    		    pagination.setCurPage(page);
    		    pagination.setPrevPage(page-1);
    		    pagination.setNextPage(page+1);
    		   
    		    // 화면에 페이지 몇개 선택가능하게 처리할지에 따라 숫자 조정 3값
    		    pagination.setStartPage(Math.max(1, page-3));
    		    pagination.setEndPage(Math.min(pagination.getPageCnt(), page+3));

    		    model.addAttribute("pagination", pagination);
    		    return "homepage/board/getAdminNoticeBoardList";
  }

  //등록
  @RequestMapping("/insertAdminNoticeBoard")
  	public String insertAdminNoticeBoard(AdminNoticeBoardVO vo) {
	  service.insertAdminNoticeBoard(vo);
	  return "redirect:/getAdminNoticeBoardList";

  }
  //단건+조회수증가
  @GetMapping("/getAdminNoticeBoard")
  	public String getAdminNoticeBoard(Model model, @RequestParam("board_no") int board_no) {
	  model.addAttribute("board", service.getAdminNoticeBoard(board_no));
	  service.adminNoticeBoardHit(board_no);
	  return "homepage/board/getAdminNoticeBoard";
  }

  //수정
  @GetMapping("/updateAdminNoticeBoard")
  	public String updateAdminNoticeBoard(@RequestParam("board_no") int board_no, Model model) {
	  model.addAttribute("board", service.getAdminNoticeBoard(board_no));
	  return "homepage/board/adminUpdateBoard";
  }

  @PostMapping("/updateAdminNoticeBoard")
  public String updateAdminNoticeBoard(AdminNoticeBoardVO vo) {
	  service.updateAdminNoticeBoard(vo);
	  return "redirect:/getAdminNoticeBoard?board_no=" + vo.getBoard_no();
  }

  //삭제
  @GetMapping("/deleteAdminNoticeBoard")
  public String deleteAdminNoticeBoard(AdminNoticeBoardVO vo, Model model, @RequestParam("board_no") int board_no) {
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
