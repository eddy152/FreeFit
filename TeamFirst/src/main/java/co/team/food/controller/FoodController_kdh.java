package co.team.food.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.food.service.FoodVO;
import co.team.food.service.impl.FoodMapper_kdh;

@Controller
public class FoodController_kdh {
	@Autowired FoodMapper_kdh service;
	
	// 식단 전체 조회
	@RequestMapping("/getSearchFood")
	public String getSearchFood(Model model, FoodVO vo) {
		model.addAttribute("list", service.getSearchFood(vo));
		return "homepage/Food/getSearchFood";
	}
	// 식단 단건 조회
	@RequestMapping("/getFood")
	//@ResponseBody
	public String getFood(FoodVO vo, Model model) {
		model.addAttribute("food", service.getFood(vo));
		return "homepage/Food/getFood";
	}
}
