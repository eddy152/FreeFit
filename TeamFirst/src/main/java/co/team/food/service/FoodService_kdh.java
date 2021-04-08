package co.team.food.service;

import java.util.List;

public interface FoodService_kdh {

	// 식단 전체 리스트
	public List<FoodVO> getSearchFood(FoodVO vo);

	// 회원 단건 조회
	public FoodVO getFood(FoodVO vo);

	// 식단 단건 조회(권장량)
	public FoodVO getRecommendFood(FoodVO vo);

	// 식단 단건 조회(실체섭취량)
	public List<FoodVO> getRealFood(FoodVO vo);
	
}
