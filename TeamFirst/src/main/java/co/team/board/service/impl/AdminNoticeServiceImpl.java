package co.team.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.board.service.AdminNoticeBoardService;
import co.team.board.service.AdminNoticeBoardVO;

@Service("adminNoticeBoardService")
public class AdminNoticeServiceImpl implements AdminNoticeBoardService{
	@Autowired AdminNoticeBoardMapper dao;
	
	@Override
	public AdminNoticeBoardVO adminNoticeBoard(AdminNoticeBoardVO vo) {
		return dao.adminNoticeBoard(vo);
	}
	@Override
	public List<AdminNoticeBoardVO> adminNoticeBoardList(AdminNoticeBoardVO vo) {
		return dao.adminNoticeBoardList();
	}
	@Override
	public void insertAdminNoticeBoard(AdminNoticeBoardVO vo) {
		dao.insertAdminNoticeBoard(vo);
	}
	@Override
	public int updateAdminNoticeBoard(AdminNoticeBoardVO vo) {
		return dao.updateAdminNoticeBoard(vo);
	}
	@Override
	public int deleteAdminNoticeBoard(AdminNoticeBoardVO vo) {
		return dao.deleteAdminNoticeBoard(vo);
	}
	
	
}





