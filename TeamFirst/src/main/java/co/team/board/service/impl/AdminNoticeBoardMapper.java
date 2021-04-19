package co.team.board.service.impl;


import co.team.board.service.AdminNoticeBoardListSearch;
import java.util.List;

import co.team.board.service.AdminNoticeBoardVO;

public interface AdminNoticeBoardMapper {
	
	// 단건조회
	public AdminNoticeBoardVO getAdminNoticeBoard(int board_no);
	//public AdminNoticeBoardVO getAdminNoticeBaord(AdminNoticeBoardVO vo);

	public Object insertSelectKey(AdminNoticeBoardVO board);
	
	// 전체조회
	public List<AdminNoticeBoardVO> getAdminNoticeBoardList(AdminNoticeBoardVO vo);
	
	//게시믈 검색
	public List<AdminNoticeBoardVO> searchAdminNoticeBoardList(AdminNoticeBoardListSearch vo);
	
	public int countAdminNoticeBoardList(AdminNoticeBoardListSearch vo);
	
	// 등록
	public int insertAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	// 수정
	public boolean updateAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	// 삭제
	public int deleteAdminNoticeBoard(int board_no);
	
	//조회수증가
	public boolean adminNoticeBoardHit(int board_no);

	//페이지ㅇ
//	public static int boardCount() {
//		return 0;
//	}
}
