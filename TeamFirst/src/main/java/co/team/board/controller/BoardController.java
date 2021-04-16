package co.team.board.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.team.board.service.AdminNoticeBoardService;
import co.team.board.service.AdminNoticeBoardVO;
import co.team.board.service.Pagination;

@Controller
public class BoardController {
 
    @Autowired
    private AdminNoticeBoardService service;
    
    /**
     * 게시판 조회
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping()
   // @NoLoginCheck
    public String getAdminNoticeBoardList(@ModelAttribute("get") AdminNoticeBoardVO vo,
            @RequestParam(defaultValue="1") int curPage,
            HttpServletRequest request,
            Model model) throws Exception{
        
        HttpSession session = request.getSession();
        //LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
 
        // 전체리스트 개수
        List<AdminNoticeBoardVO> listCnt = service.getAdminNoticeBoardList(vo);
        
        Pagination pagination = new Pagination();
        
        AdminNoticeBoardVO.setStartIndex(pagination.getStartIndex());
        AdminNoticeBoardVO.setCntPerPage(pagination.getPageSize());
        // 전체리스트 출력
        List<AdminNoticeBoardVO> list = service.getAdminNoticeBoardList(vo);
                
        model.addAttribute("list", list);
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pagination", pagination);
        
        return "board/getAdminNoticeBoardList";
    }
    

}

//
//
//
//
//
//
//
//
//
////package co.team.board.controller;
////@Controller
////public class BoardController {
//
//
////	@Autowired
////	AdminQnaBoardService service;
////	@ResponseBody
////	@GetMapping("/getAdminQnaBoardList")
////	public List<AdminQnaBoardVO> getAdminQnaBoardList(AdminQnaBoardVO vo) {
////		return service.getAdminQnaBoardList(vo);
////	}
//	
//	
//	
////	//전체조회
////	@Autowired AdminNoticeBoardMapper boardMapper;
////	@RequestMapping("/AdminNoticeBoardList")
////	public String getAdminNoticeBoardList(Model model) {
////		model.addAttribute("list", boardMapper.adminNoticeBoardList());
////		return "board/adminNoticeBoardList";
////	}
////	//단건조회
////	@RequestMapping("/AdminNoticeBoard")
////	public String getAdminNoticeBoard(Model model, AdminNoticeBoardVO vo) {
////		model.addAttribute("board", boardMapper.adminNoticeBoard(vo));
////		return "board/adminNoticeBoard";
////	}
////}
