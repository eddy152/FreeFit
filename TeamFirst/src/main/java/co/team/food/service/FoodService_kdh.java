package co.team.food.service;

import java.util.List;

import co.team.security.service.MemberVO;
import co.team.security.service.MemberVO;

public interface FoodService_kdh {

	// 식단 전체 리스트
	public List<FoodVO> getSearchFood(FoodVO vo);

	// 회원 단건 조회
	public FoodVO getFood(FoodVO vo);
	
	// session 회원 단건조회
	public MemberVO getEachMember(MemberVO vo);

	// 식단 단건 조회(권장량)
	public FoodVO getRecommendFood(FoodVO vo);

	// 식단 단건 조회(실체섭취량)
	public List<FoodVO> getRealFood(FoodVO vo);

	// 날짜 조회(+)
	public List<FoodVO> getDate(FoodVO vo);

	// 추천식단 리스트
	public List<FoodVO> getAppFoodList(FoodVO vo);

	// 추천식단 단건 조회
	public FoodVO getAppFood(String diet_no);

	// 음식 전체 리스트
	public List<FoodVO> getFoodList(FoodVO vo);

	// 추천별 식단 등록
	public void insertFood(FoodVO vo);

	// 추천별 식단 수정
	public void updateFood(FoodVO vo);

	// 추천별 식단 삭제
	public int deleteFood(FoodVO vo);

	// 실제 섭취 식단 리스트
	public List<FoodVO> getMemberFoodList(FoodVO vo);

	// 실제 섭취 식단 추가
	public int getMemberFoodInsert(FoodVO vo);

	// 실제 섭취 식단(주)
	public List<FoodVO> getFoodWeek(FoodVO vo);
	
	public List<FoodVO> getWeeks(FoodVO vo);

	// 실제 섭취 식단(오늘)
	public FoodVO getRealFoodMember(FoodVO vo);

	// 댓글 조회
	public List<FoodVO> getComment(FoodVO real_no);

	// 댓글 추가
	public void addComment(FoodVO vo);

	// 최신 댓글 조회
	public FoodVO getDescComment(FoodVO vo);

	// 댓글 수정
	public void updateComment(FoodVO vo);

	// 댓글 삭제
	public void deleteComment(FoodVO vo);

	// 식단 내용 등록
	public void insertImg(FoodVO vo);

	// 식단 내용 수정
	public void foodUpdate(FoodVO vo);

	// 식단 내용 삭제
	public void foodDel(FoodVO vo);

	// 일별 회원 식단 조회
	public FoodVO getFoodOne(FoodVO vo);

	// 일별 단건 조회
	public FoodVO getDay(FoodVO vo);

	public FoodVO current(String string);

	// 총칼로리 저장
	public void updateCalorie(FoodVO vo);
}
