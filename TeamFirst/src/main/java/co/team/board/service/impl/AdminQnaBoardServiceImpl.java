package co.team.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.board.service.AdminQnaBoardService;
import co.team.board.service.AdminQnaBoardVO;

@Service
public class AdminQnaBoardServiceImpl implements AdminQnaBoardService {

	@Autowired AdminQnaBoardMapper dao;

	@Override
	public AdminQnaBoardVO getAdminQnaBoard(AdminQnaBoardVO vo) {
		return dao.getAdminQnaBoard(vo);
	}

	@Override
	public List<AdminQnaBoardVO> getAdminQnaBoardList(AdminQnaBoardVO vo) {
		return dao.getAdminQnaBoardList(vo);
	}

	@Override
	public int insertAdminQnaBoard(AdminQnaBoardVO vo) {
		return dao.insertAdminQnaBoard(vo);
	}

	@Override
	public int updateAdminQnaBoard(AdminQnaBoardVO vo) {
		return dao.updateAdminQnaBoard(vo);
	}

	@Override
	public int deleteAdminQnaBoard(AdminQnaBoardVO vo) {
		return dao.deleteAdminQnaBoard(vo);
	}

}
