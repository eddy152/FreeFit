package co.team.board.service.impl;


import java.util.List;

import co.team.board.service.AdminNoticeBoardVO;

public interface AdminNoticeBoardMapper {
	
	// 단건조회
	public AdminNoticeBoardVO getAdminNoticeBoard(int board_no);
	//public AdminNoticeBoardVO getAdminNoticeBaord(AdminNoticeBoardVO vo);

	// 전체조회
	public List<AdminNoticeBoardVO> getAdminNoticeBoardList(AdminNoticeBoardVO vo);
	
	// 등록
	public int insertAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	// 수정
	public int updateAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	// 삭제
	public int deleteAdminNoticeBoard(AdminNoticeBoardVO vo);
	
//	//페이징 
//	public static int boardCount() {
//		return 0;
//	}
}
