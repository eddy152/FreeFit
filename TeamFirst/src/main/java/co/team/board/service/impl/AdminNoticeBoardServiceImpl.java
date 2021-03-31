package co.team.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.board.service.AdminNoticeBoardService;
import co.team.board.service.AdminNoticeBoardVO;

@Service
public class AdminNoticeBoardServiceImpl implements AdminNoticeBoardService{
	@Autowired AdminNoticeBoardMapper dao;

	@Override
	public AdminNoticeBoardVO getAdminNoticeBoard(AdminNoticeBoardVO vo) {
		return dao.getAdminNoticeBoard(vo);
	}

	@Override
	public List<AdminNoticeBoardVO> getAdminNoticeBoardList(AdminNoticeBoardVO vo) {
		return dao.getAdminNoticeBoardList(vo);
	}

	@Override
	public int insertAdminNoticeBoard(AdminNoticeBoardVO vo) {
		return dao.insertAdminNoticeBoard(vo);
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





