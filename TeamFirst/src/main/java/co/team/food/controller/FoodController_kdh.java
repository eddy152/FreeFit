package co.team.food.controller;


import java.util.Arrays;
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
		System.out.println(Arrays.toString(arr));
		for(int i=0; i<arr.length; i++) {
			String[] food = arr[i].split("/");
			
		}
		
		
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

}
