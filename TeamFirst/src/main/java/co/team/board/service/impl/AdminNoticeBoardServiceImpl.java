package co.team.board.service.impl;

import co.team.board.service.AdminNoticeBoardListSearch;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.team.board.service.AdminNoticeBoardService;
import co.team.board.service.AdminNoticeBoardVO;

@Service
public class AdminNoticeBoardServiceImpl implements AdminNoticeBoardService{
	@Autowired AdminNoticeBoardMapper dao;

//	@Override
//	public AdminNoticeBoardVO getAdminNoticeBoard(AdminNoticeBoardVO vo) {
//		return dao.getAdminNoticeBoard(vo);
//	}
	@Override
	public AdminNoticeBoardVO getAdminNoticeBoard(int board_no) {
		return dao.getAdminNoticeBoard(board_no);
	}
	@Override
	public List<AdminNoticeBoardVO> getAdminNoticeBoardList(AdminNoticeBoardVO vo) {
		return dao.getAdminNoticeBoardList(vo);
	}
	@Override
	public List<AdminNoticeBoardVO> searchAdminNoticeBoardList(AdminNoticeBoardListSearch vo) {
		return dao.searchAdminNoticeBoardList(vo);
	}
	@Override
	public int countAdminNoticeBoardList(AdminNoticeBoardListSearch vo) {
		return dao.countAdminNoticeBoardList(vo);
	}
	@Override
	public int insertAdminNoticeBoard(AdminNoticeBoardVO vo) {
		return dao.insertAdminNoticeBoard(vo);
	}
	@Override
	public boolean updateAdminNoticeBoard(AdminNoticeBoardVO vo) {
		return dao.updateAdminNoticeBoard(vo);
	}
	@Override
	public int deleteAdminNoticeBoard(int board_no) {
		return dao.deleteAdminNoticeBoard(board_no);
	}
	@Override
	public boolean adminNoticeBoardHit(int board_no) {
		return dao.adminNoticeBoardHit(board_no);
	}
	@Override
	public Object insertSelectKey(AdminNoticeBoardVO vo) {
		return dao.insertSelectKey(vo);
	}
 }
