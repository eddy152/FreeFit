package co.team.usern.service;

import java.util.List;

public interface UsernService {

	
	//전체조회
	public List<UsernVO> userNList(UsernVO vo);
	
	//단건조회 + 상세보기
	public UsernVO getUserh(int board_no);
	
	//게시물 검색
	public List<UsernVO> searchUserN(UserNSearch vo);
	
	//검색기능? 미정
	public UsernVO getUserN(UsernVO vo);
	
	//검색 미정
	public Integer countUserN(UserNSearch vo);
	
	//등록
	public int userWrite(UsernVO vo);
	
	//미정 
	public boolean userView(UsernVO vo);
	
	//조회수
	public boolean userHit(int board_no);

	//수정
	public boolean userUpdate(UsernVO vo);
	
	//삭제
	public int userDelete(int board_no);
	
}
