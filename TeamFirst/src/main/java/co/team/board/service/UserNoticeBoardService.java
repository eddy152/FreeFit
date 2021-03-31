package co.team.board.service;

import java.util.List;

public interface UserNoticeBoardService {

	//유저공지홍보게시판 서비스
	//단건조회
	public UserNoticeBoardVO getUserNoticeBoard(UserNoticeBoardVO vo);

	//전체조회
	public List<UserNoticeBoardVO> getUserNoticeBoardList(UserNoticeBoardVO vo);
	
	//등록
	public int insertUserNoticeBoard(UserNoticeBoardVO vo);
	
	//수정
	public int updateUserNoticeBoard(UserNoticeBoardVO vo);
	
	//삭제
	public int deleteUserNoticeBoard(UserNoticeBoardVO vo);
}