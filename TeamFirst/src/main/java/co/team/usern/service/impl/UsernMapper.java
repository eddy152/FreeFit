package co.team.usern.service.impl;

import java.util.List;

import co.team.usern.service.UserNSearch;
import co.team.usern.service.UsernVO;

public interface UsernMapper {
	// 전체조회
	public List<UsernVO> userNList(UsernVO vo);

	// 단건조회
	public UsernVO getUserh(int board_no);

	// 검색
	public List<UsernVO> searchUserN(UserNSearch vo);

	// count
	public Integer countUserN(UserNSearch vo);

	// 등록
	public int userWrite(UsernVO vo);
	
	public boolean userView(UsernVO vo);
	
	//조회수
	public boolean userHit(int board_no);
	
	//수정
	public boolean userUpdate(UsernVO vo);
	
	//삭제
	public int userDelete(int board_no);

}
