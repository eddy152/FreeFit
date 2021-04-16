package co.team.board.service;

import java.util.List;

public interface UserQnaBoardService {

	//유저 공지게시판 서비스

	//단건 조회
	public UserQnaBoardVO getUserQnaBoard(UserQnaBoardVO vo);
	
	//전체 조회
	public List<UserQnaBoardVO> getUserQnaBoardList(UserQnaBoardVO vo);

	//등록
	public int insertUserQnaBoard(UserQnaBoardVO vo);
	
	//수정
	public int updateUserQnaBoard(UserQnaBoardVO vo);
	
	//삭제
	public int deleteUserQnaBoard(UserQnaBoardVO vo);
}
