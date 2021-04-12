package co.team.board.service;

import java.util.List;

public interface AdminNoticeBoardService {
	
	//어드민 공지이벤트게시판 서비스
	//단건조회
	//public AdminNoticeBoardVO getAdminNoticeBoard(AdminNoticeBoardVO vo);
	public AdminNoticeBoardVO getAdminNoticeBoard(int board_no);

	public Object insertSelectKey(AdminNoticeBoardVO board);
	
	//전체조회
	public List<AdminNoticeBoardVO> getAdminNoticeBoardList(AdminNoticeBoardVO vo);
	
	//등록
	public int insertAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	//수정
	public boolean updateAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	//삭제
	public int deleteAdminNoticeBoard(int board_no);

	//조회수 증가
	public boolean adminNoticeBoardHit(int board_no);
//	
//	//페이징 
//	public static int boardCount() {
//		return 0;
//	}

	

	

	
}
