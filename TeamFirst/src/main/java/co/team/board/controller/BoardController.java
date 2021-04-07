//package co.team.board.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import co.team.board.service.AdminNoticeBoardService;
//import co.team.board.service.AdminNoticeBoardVO;
//import co.team.board.service.BoardSearchVO;
//
//public class BoardController {
//
//	@RequestMapping("/board/getAdminNoticeBoardList") 
//    public String boardList(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") BoardSearchVO boardSearchVO) {
//    String jspPath = req.getRequestURI();
//        
//     
//    int pageSize = boardSearchVO.getPageSize();// 한페이지에 나오는 게시물 개수
//    int pageIndex = boardSearchVO.getPageIndex(); //현재 선택한 페이지 number
//    int pageGroupSize = boardSearchVO.getPageGroupSize(); // 페이지 번호가 몇개 나오느냐 개수
//    int startRow = (pageIndex - 1) * pageSize + 1;// 한 페이지의 시작글 번호
//    int endRow = pageIndex * pageSize;// 한 페이지의 마지막 글번호
// 
//    boardSearchVO.setStartRow(startRow);
//    boardSearchVO.setEndRow(endRow);
//    int count = AdminNoticeBoardService.boardCount(boardSearchVO); //게시물 총 개수
// 
//    int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
//    int nowPageGroup = (int) Math.ceil((double) pageIndex / pageGroupSize);
//     
//    List<AdminNoticeBoardVO> getAdminNoticeBoardList = AdminNoticeBoardService.getAdminNoticeBoardList(boardSearchVO);
//     
//    modelMap.put("pageIndex", pageIndex);
//    modelMap.put("pageSize", pageSize);
//    modelMap.put("count", count);
//    modelMap.put("pageGroupSize", pageGroupSize);
//    modelMap.put("nowPageGroup", nowPageGroup);
//    modelMap.put("pageGroupCount", pageGroupCount);
//    modelMap.put("articleList", getAdminNoticeBoardList);
//    modelMap.put("", boardSearchVO);
//     
//       return jspPath;
//    }
//}
//
//
//
//
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
