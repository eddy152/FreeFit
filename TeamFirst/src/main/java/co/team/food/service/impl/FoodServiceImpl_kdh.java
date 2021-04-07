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

	// 식단 단건 조회
	@Override
	public FoodVO getFood(FoodVO vo) {
		return dao.getFood(vo);
	}
	
}
