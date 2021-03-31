package co.team.board.service;

import java.util.List;

public interface AdminQnaBoardService {

	//단건 조회
	public AdminQnaBoardVO getAdminQnaBoard(AdminQnaBoardVO vo);
	
	//전체 조회
	public List<AdminQnaBoardVO> getAdminQnaBoardList(AdminQnaBoardVO vo);
	
	//등록
	public int insertAdminQnaBoard(AdminQnaBoardVO vo);
	
	//수정
	public int updateAdminQnaBoard(AdminQnaBoardVO vo);
	
	//삭제
	public int deleteAdminQnaBoard(AdminQnaBoardVO vo);
	
}
