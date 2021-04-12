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

	@Override
	// 날짜 조회(+)
	public List<FoodVO> getDate(FoodVO vo) {
		return dao.getDate(vo);
	}

	@Override
	// 날짜 조회(-)
	public List<FoodVO> getBeforeDate(FoodVO vo) {
		return dao.getBeforeDate(vo);
	}

	@Override
	// 추천별 식단 리스트
	public List<FoodVO> getAppFood(FoodVO vo) {
		return dao.getAppFood(vo);
	}

	@Override
	// 음식정보 전체 리스트
	public List<FoodVO> getFoodList(FoodVO vo) {
		return dao.getFoodList(vo);
	}

	@Override
	// 추천별 식단 등록
	public void insertFood(FoodVO vo) {
		dao.insertFood(vo);
	}
	
	
	
}
