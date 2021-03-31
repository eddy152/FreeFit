//package co.team.board.controller;

//@Controller
//public class BoardController {


//	@Autowired
//	AdminQnaBoardService service;
//	@ResponseBody
//	@GetMapping("/getAdminQnaBoardList")
//	public List<AdminQnaBoardVO> getAdminQnaBoardList(AdminQnaBoardVO vo) {
//		return service.getAdminQnaBoardList(vo);
//	}
	
	
	
//	//전체조회
//	@Autowired AdminNoticeBoardMapper boardMapper;
//	@RequestMapping("/AdminNoticeBoardList")
//	public String getAdminNoticeBoardList(Model model) {
//		model.addAttribute("list", boardMapper.adminNoticeBoardList());
//		return "board/adminNoticeBoardList";
//	}
//	//단건조회
//	@RequestMapping("/AdminNoticeBoard")
//	public String getAdminNoticeBoard(Model model, AdminNoticeBoardVO vo) {
//		model.addAttribute("board", boardMapper.adminNoticeBoard(vo));
//		return "board/adminNoticeBoard";
//	}
//}
