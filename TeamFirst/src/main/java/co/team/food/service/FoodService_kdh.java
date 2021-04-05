package co.team.food.service;

import java.util.List;

public interface FoodService_kdh {
	
	// 식단 전체 리스트
	public List<FoodVO> getSearchFood(FoodVO vo);
	
	// 식단 단건 조회(통계)
	public FoodVO getFood(FoodVO vo);
	
}
