package co.team.food.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

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
	public List<FoodVO> getAppFoodList(FoodVO vo) {
		return dao.getAppFoodList(vo);
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

	@Override
	// 추천별 식단 단건 조회
	public FoodVO getAppFood(String diet_no) {
		return dao.getAppFood(diet_no);
	}

	@Override
	// 추천별 식단 수정
	public void updateFood(FoodVO vo) {
		dao.updateFood(vo);
	}

	@Override
	// 추천별 식단 삭제
	public int deleteFood(FoodVO vo) {
		return dao.deleteFood(vo);
	}

	@Override
	// 실제 섭취 식단 리스트
	public List<FoodVO> getMemberFoodList(FoodVO vo) {
		return dao.getMemberFoodList(vo);
	}

	@Override
	// 실제 섭취 식단 추가
	public int getMemberFoodInsert(FoodVO vo) {
		return dao.getMemberFoodInsert(vo);
	}

	@Override
	// 실제 섭취 식단 폼(오늘)
	public FoodVO getRealFoodMember(FoodVO vo) {
		FoodVO isthisvo=dao.getRealFoodMember(vo);
		if (isthisvo!=null) {
		return isthisvo;}
		else return vo;
	}

	@Override
	// 댓글 추가
	public void addComment(FoodVO vo) {
		dao.addComment(vo);
	}

	@Override
	// 댓글 조회
	public List<FoodVO> getComment(FoodVO real_no) {
		return dao.getComment(real_no);
	}
	
	@Override
	// 댓글 수정
	public void updateComment(FoodVO vo) {
		dao.updateComment(vo);
	}
	
	@Override
	// 댓글 삭제
	public void deleteComment(FoodVO vo) {
		dao.deleteComment(vo);
	}

	@Override
	// 식단 내용 수정
	public void foodUpdate(FoodVO vo) {
		dao.foodUpdate(vo);
	}

	@Override
	// 총칼로리 저장
	public void updateCalorie(FoodVO vo) {
		dao.updateCalorie(vo);
	}

	@Override
	// 식단 내용 등록
	public void insertImg(FoodVO vo) {
		dao.insertImg(vo);
	}

	@Override
	// 식단 내용 삭제
	public void foodDel(FoodVO vo) {
		dao.foodDel(vo);
	}

	@Override
	// 일별 회원 식단 조회
	public FoodVO getFoodOne(FoodVO vo) {
		FoodVO nvo=new FoodVO();
		vo=dao.getFoodOne(vo);
		if (vo==null) {
			SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd");    
			Date today = new Date();
			nvo.setSysdate(formatter.format(today));
			return nvo;
		}
		return vo;
	}

	@Override
	// 일별 단건 조회
	public FoodVO getDay(FoodVO vo) {
		return dao.getDay(vo);
	}

	@Override
	public FoodVO current(String vo) {
		// TODO Auto-generated method stub
		return dao.current(vo);
	}

	@Override
	// 최신 댓글 조회(단건)
	public FoodVO getDescComment(FoodVO vo) {
		return dao.getDescComment(vo);
	}



	
	
	
	
}
