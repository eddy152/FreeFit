package co.team.board.service;

import java.util.List;

public interface AdminNoticeBoardService {

	AdminNoticeBoardVO adminNoticeBoard(AdminNoticeBoardVO vo);
	
	public List<AdminNoticeBoardVO> adminNoticeBoardList(AdminNoticeBoardVO vo);
	
	//등록
	public void insertAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	//수정
	public int updateAdminNoticeBoard(AdminNoticeBoardVO vo);
	
	//삭제
	public int deleteAdminNoticeBoard(AdminNoticeBoardVO vo);

	
	


}
