package co.team.food.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.food.service.FoodVO;
import co.team.food.service.impl.FoodMapper_kdh;

@Controller
public class FoodController_kdh {
	@Autowired
	FoodMapper_kdh service;

	// 식단 전체 조회
	@RequestMapping("/getSearchFood")
	public String getSearchFood(Model model, FoodVO vo) {
		model.addAttribute("list", service.getSearchFood(vo));
		return "homepage/Food/getSearchFood";
	}

	// 회원 단건 조회
	@RequestMapping("/getFood")
	// @ResponseBody
	public String getFood(FoodVO vo, Model model) {
		model.addAttribute("food", service.getFood(vo));
		List<FoodVO> foodList = service.getRealFood(vo);
		model.addAttribute("calories", foodList);
		return "homepage/Food/getFood";
	}

	// 식단 권장량 조회(단건)
	@RequestMapping("/getRecommendFood")
	public String getRecommendFood(FoodVO vo, Model model) {
		model.addAttribute("rec", service.getRecommendFood(vo));
		return "homepage/Food/getFood";
	}

	// 식단 통계 조회(단건)
	@RequestMapping("/getFoodSelect")
	@ResponseBody
	public FoodVO getFoodList(FoodVO vo, Model model) {
		return (FoodVO) service.getRealFood(vo);
	}

	// 날짜 조회(+)
	@RequestMapping("/getDate")
	@ResponseBody
	public List<FoodVO> getDate(FoodVO vo, Model model) {
		return service.getDate(vo);
	}

	// 날짜 조회(-)
	@RequestMapping("/getBeforeDate")
	@ResponseBody
	public List<FoodVO> getBeforeDate(FoodVO vo, Model model) {
		return service.getBeforeDate(vo);
	}
	
	// 추천별 식단 리스트(앱)
	@RequestMapping("/getAppFoodList")
	public String getAppFoodList(FoodVO vo, Model model) {
		model.addAttribute("list", service.getAppFoodList(vo));
		return "app/Food/getAppFoodList";
	}
	
	// 추천별 식단 단건 조회(앱)
	@RequestMapping("/getAppFood")
	@ResponseBody
	public FoodVO getAppFood(@RequestParam String diet_no) {
		return service.getAppFood(diet_no);
	}
	
	// 추천별 식단 추가 게시판(앱)
	@GetMapping("/insertFood")
	public String getAppFoodForm(FoodVO vo, Model model) {
		model.addAttribute("foodList", service.getFoodList(vo));
		return "app/Food/getAppFoodForm";
	}
	
	// 추천별 식단 등록(앱)
	@PostMapping("/insertFood")
	//@ResponseBody
	public String insertFood(FoodVO vo, Model model) {
		service.insertFood(vo);
		return "redirect:/getAppFoodList";
	}
	
	// 추천별 식단 수정(앱)
	@GetMapping("/updateFood")
	public String updateFoodForm(@RequestParam String diet_no, Model model) {
		FoodVO vo = service.getAppFood(diet_no);
		String[] arr = vo.getDiet_content().split(", ");
		ArrayList<FoodVO> list = new ArrayList<>();
		for(int i=0; i<arr.length; i++) {
			FoodVO fvo = new FoodVO();
			String[] arr2 = arr[i].split("/");
			
			fvo.setFood_name(arr2[0]);
			fvo.setFood_cnt(arr2[1]);
			
			list.add(fvo);
		}
		
		model.addAttribute("arr", list);
		model.addAttribute("vo", vo);
		model.addAttribute("list", service.getFoodList(null));
		return "app/Food/getAppFoodUpdateForm";
		}

	// 추천별 식단 수정(앱)
	@PostMapping("/updateFood")
	public String updateFood(FoodVO vo) {
		service.updateFood(vo);
		return "redirect:/getAppFoodList";
	}
	
	// 추천별 식단 삭제(앱)
	@PostMapping("/deleteFood")
	@ResponseBody
	public int deleteFood(FoodVO vo) {
		return service.deleteFood(vo);
	}
	
	@RequestMapping("/Test")
	// @ResponseBody
	public String Test(FoodVO vo, Model model) {
		model.addAttribute("list", service.getSearchFood(vo));
		return "app/Food/Test";
	}
	
	// 해당 회원의 실제 섭취 식단 통계 (앱)
	@RequestMapping("/getMemberFoodList")
	public String getMemberFoodList(FoodVO vo, Model model) {
		model.addAttribute("list", service.getRealFood(vo));
		model.addAttribute("food", service.getFood(vo));
		return "app/Food/getMemberFoodList";
	}
	
	// 해당 회원의 실제 섭취 식단 상세 및 작성 폼(앱)
	@GetMapping("/getMemberFoodInsert")
	public String getMemberFoodInsertForm(FoodVO vo, Model model) {
		model.addAttribute("food", service.getRealFoodMember(vo)); // 실제 섭취 식단 단건 조회
		model.addAttribute("user", service.getFood(vo)); // 회원 단건 조회
		model.addAttribute("comment", service.getComment(vo)); // 댓글 조회
		return "app/Food/getMemberFoodInsert";
	}
	
	// 실제 섭취 식단 추가(앱)
	@PostMapping("/getMemberFoodInsert")
	@ResponseBody
	public int getMemberFoodInsert(FoodVO vo) {
		return service.getMemberFoodInsert(vo);
	}
	
	// 댓글 추가
	@RequestMapping("/addComment")
	@ResponseBody
	public FoodVO addComment(FoodVO vo) {
		 service.addComment(vo);
		 return vo;
	}
	
	// 댓글 수정
	@RequestMapping("/updateComment")
	@ResponseBody
	public FoodVO updateComment(FoodVO vo) {
		service.updateComment(vo);
		return vo;
	}
	
	// 댓글 삭제
	@RequestMapping("/deleteComment")
	@ResponseBody
	public FoodVO deleteComment(FoodVO vo) {
		service.deleteComment(vo);
		return vo;
	}
	
	// 이미지 업로드
	@RequestMapping("/insertImg")
	@ResponseBody
	public FoodVO insertImg(FoodVO vo) {
		service.insertImg(vo);
		System.out.println(vo + "vo-----------------------------------");
		return vo;
	}
	
}
