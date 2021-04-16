package co.team.board.service.impl;

import java.util.List;

import co.team.board.service.AdminQnaBoardVO;

public interface AdminQnaBoardMapper {
	
	//단건조회
	public AdminQnaBoardVO getAdminQnaBoard(AdminQnaBoardVO vo);
	
	//전체조회
	public List<AdminQnaBoardVO> getAdminQnaBoardList(AdminQnaBoardVO vo);
	
	//등록
	public int insertAdminQnaBoard(AdminQnaBoardVO vo);
	
	//수정
	public int updateAdminQnaBoard(AdminQnaBoardVO vo);
	
	//삭제
	public int deleteAdminQnaBoard(AdminQnaBoardVO vo);
}
