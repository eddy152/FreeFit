package co.team.usern.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.team.usern.service.Paginations;
import co.team.usern.service.UserNSearch;
import co.team.usern.service.UserNoticeService;
import co.team.usern.service.UserNoticeVO;
import co.team.usern.service.UsernService;
import co.team.usern.service.UsernVO;

@Controller
public class UserNoticeController {
	@Autowired
	UsernService usernService;

	@Autowired 
	UserNoticeService userNoticeService;

	// app 공지 리스트
	@RequestMapping("/appNoticeList")
	public String appuserNList(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "search", required = false) String search, Model model, HttpSession session) throws Exception {
		UserNSearch c = new UserNSearch();
		c.setFitness_id((String) session.getAttribute("fitness_id"));
		
		c.setPage(page - 1);
		c.setSearch(StringUtils.isNotBlank(search) ? ("%" + StringUtils.trim(search) + "%") : null);
		model.addAttribute("search", search);
		List<UsernVO> uList =  usernService.searchUserN(c);
		Integer count = usernService.countUserN(c);
		model.addAttribute("uList", uList);
		Paginations paginations = new Paginations();
		System.out.println(paginations);
		System.out.println(count);
		paginations.setListCnt(count);// 페이지 리스트
		paginations.setPageCnt(count / 10 + (0 < count % 10 ? 1 : 0)); // 10 : pagesize
		paginations.setCurPage(page);// 현재페이지
		paginations.setPrevPage(page - 1); // 이전페이지
		paginations.setNextPage(page + 1);// 다음페이지

		paginations.setStartPage(Math.max(1, page - 5)); // 보여지는 화면에 페이지가 몇개선택할지 숫자조절가능하다.
		paginations.setEndPage(Math.min(paginations.getPageCnt(), page + 5));
		
		model.addAttribute("pagination", paginations);

		return "app/userNotice/appNoticeList";
	}

	// 상세조회
	@GetMapping("/appNoticeUserh")
	public String appNoticeUserh(Model model, @RequestParam("board_no") int board_no) {
		model.addAttribute("us", userNoticeService.appNoticeUserh(board_no));
		userNoticeService.userHit(board_no);
		return "app/userNotice/appNoticeUserh";
	}

}// Controller 끝나는부분
