package co.team.board.service.impl;

import java.util.List;

import co.team.board.service.UserNoticeBoardVO;

public interface UserNoticeBoardMapper {


	//단건조회
	public UserNoticeBoardVO getUserNoticeBoard(UserNoticeBoardVO vo);
	
	//전체조회
	public List<UserNoticeBoardVO> getUserNoticeBoardList(UserNoticeBoardVO vo);

	//등록
	public int insertUserNoticeBoard(UserNoticeBoardVO vo);
	
	//수정
	public int updateUserNoticBoard(UserNoticeBoardVO vo);

	//삭제
	public int deleteUserNoticeBoard(UserNoticeBoardVO vo);
}
