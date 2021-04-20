package co.team.usern.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.team.usern.service.Paginations;
import co.team.usern.service.UserNSearch;
import co.team.usern.service.UsernService;
import co.team.usern.service.UsernVO;

@Controller
public class UsernController {

	@Autowired UsernService usernService;
	
	@GetMapping("/userNW")
	public String userNW() {
		return "program/Usern/userNW";
	}
	
	// 전체조회
	@RequestMapping("/userNList")
	public String userNList(@RequestParam(value = "page", defaultValue = "1") Integer page,
							@RequestParam(value = "search", required = false) String search, Model model) throws Exception{
			UserNSearch c = new UserNSearch();
			c.setPage(page-1);
			c.setSearch(StringUtils.isNotBlank(search) ? ("%" + StringUtils.trim(search)+"%") : null);
				model.addAttribute("search", search);
			List<UsernVO> uList = usernService.searchUserN(c);
			Integer count = usernService.countUserN(c);
			model.addAttribute("uList", uList);
	Paginations paginations = new Paginations();
				System.out.println(paginations);
				System.out.println(count);
			   paginations.setListCnt(count);//페이지 리스트
			   paginations.setPageCnt(count/10 + (0<count%10?1:0)); // 10 : pagesize 
			   paginations.setCurPage(page);//현재페이지
			   paginations.setPrevPage(page-1); // 이전페이지
			   paginations.setNextPage(page+1);//다음페이지
			
			   paginations.setStartPage(Math.max(1, page-5)); //보여지는 화면에 페이지가 몇개선택할지 숫자조절가능하다.
			   paginations.setEndPage(Math.min(paginations.getPageCnt(), page+5));
			   
			   model.addAttribute("pagination", paginations); 
			
	return "program/Usern/userNList";
	}

	//등록
	@RequestMapping("/userWrite")
	public String userWrite(UsernVO vo) {
		usernService.userWrite(vo);
		return "redirect:/userNList";
	}
	// 단건 + 조회수
	@GetMapping("/getUserh")
	public String getUserh(Model model, @RequestParam("board_no") int board_no) {
		model.addAttribute("us", usernService.getUserh(board_no));
		usernService.userHit(board_no);
		return "program/Usern/getUserh";
	}
	//수정 폼 이동
	@GetMapping("/userUpdate")
	public String userUpdate(@RequestParam("board_no") int board_no, Model model) {
		model.addAttribute("up", usernService.getUserh(board_no));
		return "program/Usern/userUpdate";
	}
	//수정 Post
	@PostMapping("/userUpdate")
	public String userUpdate(UsernVO vo) {
		usernService.userUpdate(vo);
		return "redirect:/getUserh?board_no="+vo.getBoard_no();
	}
	//삭제
	@GetMapping("/userDelete")
	public String userDelete(UsernVO vo, Model model, @RequestParam("board_no") int board_no) {
		model.addAttribute("del", usernService.userDelete(board_no));
		usernService.userDelete(board_no);
		return "redirect:/userNList";
	}
		
	
}//Controller
