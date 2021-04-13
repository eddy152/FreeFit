package co.team.food.service.impl;

import java.util.ArrayList;
import java.util.List;

import co.team.food.service.FoodVO;

public interface FoodMapper_kdh {

	// 식단 전체 리스트
	public List<FoodVO> getSearchFood(FoodVO vo);

	// 회원 단건 조회
	public FoodVO getFood(FoodVO vo);

	// 식단 단건 조회(권장량)
	public FoodVO getRecommendFood(FoodVO vo);

	// 식단 단건 조회(실체섭취량)
	public List<FoodVO> getRealFood(FoodVO vo);

	// 날짜 조회
	public List<FoodVO> getDate(FoodVO vo);

	// 날짜 조회(-)
	public List<FoodVO> getBeforeDate(FoodVO vo);
	
	// 추천식단 리스트
	public List<FoodVO> getAppFood(FoodVO vo);
	
	// 음식 전체 리스트
	public List<FoodVO> getFoodList(FoodVO vo);
	
	// 추천별 식단 등록
	public void insertFood(FoodVO vo);

}
