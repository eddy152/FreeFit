package co.team.food.service.impl;

import java.util.List;

import co.team.food.service.FoodVO;

public interface FoodMapper_kdh {
	
	// 식단 전체 리스트
	public List<FoodVO> getSearchFood(FoodVO vo);
	
	// 식단 단건 조회(통계)
	public FoodVO getFood(FoodVO vo);
	
	
}
