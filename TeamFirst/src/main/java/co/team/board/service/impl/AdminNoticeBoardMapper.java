package co.team.board.service.impl;

import java.util.List;

import co.team.board.service.AdminNoticeBoardVO;

public interface AdminNoticeBoardMapper {

	public AdminNoticeBoardVO adminNoticeBoard(AdminNoticeBoardVO vo);
	// 조회
	public List<AdminNoticeBoardVO> adminNoticeBoardList();
	// 등록
	public void insertAdminNoticeBoard(AdminNoticeBoardVO vo);
	// 수정
	public int updateAdminNoticeBoard(AdminNoticeBoardVO vo);
	// 삭제
	public int deleteAdminNoticeBoard(AdminNoticeBoardVO vo);
	

	
	
}
