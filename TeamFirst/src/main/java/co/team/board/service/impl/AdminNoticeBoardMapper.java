package co.team.board.service.impl;

import java.util.List;

import co.team.board.service.AdminNoticeBoardVO;
import co.team.board.service.BoardSearchVO;

public interface AdminNoticeBoardMapper {
	
	// 단건조회
	public AdminNoticeBoardVO getAdminNoticeBoard(AdminNoticeBoardVO vo);
	//public AdminNoticeBoardVO viewDetail(int board_no);

	// 전체조회
	public List<AdminNoticeBoardVO> getAdminNoticeBoardList(AdminNoticeBoardVO vo);
	
	// 등록
	public int insertAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	// 수정
	public int updateAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	// 삭제
	public int deleteAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	//페이징 
	public static int boardCount(BoardSearchVO boardSearchVO) {
		return 0;
	}
	public static List<AdminNoticeBoardVO> boardList(BoardSearchVO boardSearchVO) {
		return null;
	}
	
}
