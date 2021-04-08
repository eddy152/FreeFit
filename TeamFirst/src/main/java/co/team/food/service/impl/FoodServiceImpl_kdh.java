package co.team.food.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.food.service.FoodService_kdh;
import co.team.food.service.FoodVO;

@Service
public class FoodServiceImpl_kdh implements FoodService_kdh{

	@Autowired FoodMapper_kdh dao;
	
	// 식단 전체 조회
	@Override
	public List<FoodVO> getSearchFood(FoodVO vo) {
		return dao.getSearchFood(vo);
	}

	// 회원 단건 조회
	@Override
	public FoodVO getFood(FoodVO vo) {
		return dao.getFood(vo);
	}

	// 식단 단건 조회(권장량) 
	@Override
	public FoodVO getRecommendFood(FoodVO vo) {
		return dao.getRecommendFood(vo);
	}

	@Override
	// 식단 단건 조회(실제섭취량)
	public List<FoodVO> getRealFood(FoodVO vo) {
		return dao.getRealFood(vo);
	}
	
	
	
}
