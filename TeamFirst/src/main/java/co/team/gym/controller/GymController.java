package co.team.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.team.board.service.Pagination;
import co.team.gym.service.GymListSearch;
import co.team.gym.service.GymService;
import co.team.gym.service.GymVO;

@Controller
public class GymController {

	@Autowired
	GymService gymService;
	
	@RequestMapping("/getGymList")
	public String getGymList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "search", required = false) String search, Model model) throws Exception {
		   GymListSearch s = new GymListSearch();
		   s.setPage(page-1);
		   s.setSearch((null != search && !search.isEmpty()) ?
 	 				  ("%" + search.trim() + "%") : null);
		   model.addAttribute("search", search);
		   List<GymVO> list = gymService.searchGymList(s);
		   int count = gymService.countGymList(s);
		   model.addAttribute("list", list);
		   Pagination pagination = new Pagination();
		   		pagination.setListCnt(count);
		   		pagination.setPageCnt(count / 10 + (0 < count % 10 ? 1 : 0)); // 10=페이지사이즈
		   		pagination.setPrevPage(page-1);
		   		pagination.setNextPage(page+1);
		   		
		   	 // 화면에 페이지 몇개 선택가능하게 처리할지에 따라 숫자 조정 3값)
		   		pagination.setStartPage(Math.max(1, page-3));
		   		pagination.setEndPage(Math.min(pagination.getPageCnt(), page+3));
		   
		   		model.addAttribute("pagination", pagination);
		   		
		   return "gym/getGymList";
	}
	
	//단건조회
	@GetMapping("/getGym")
		public String getGym(Model model, @RequestParam("id") String id) {
		
			   model.addAttribute("gym", gymService.getGym(id));
			   return "gym/getGym";
	}
	
}
