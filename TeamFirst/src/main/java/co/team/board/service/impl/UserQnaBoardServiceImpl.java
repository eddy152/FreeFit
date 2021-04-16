package co.team.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.board.service.UserQnaBoardService;
import co.team.board.service.UserQnaBoardVO;

@Service
public class UserQnaBoardServiceImpl implements UserQnaBoardService{

	@Autowired UserQnaBoardMapper dao;
	
	@Override
	public UserQnaBoardVO getUserQnaBoard(UserQnaBoardVO vo) {
		return dao.getUserQnaBoard(vo);
	}

	@Override
	public List<UserQnaBoardVO> getUserQnaBoardList(UserQnaBoardVO vo) {
		return dao.getUserQnaBoardList(vo);
	}

	@Override
	public int insertUserQnaBoard(UserQnaBoardVO vo) {
		return dao.insertUserQnaBoard(vo);
	}

	@Override
	public int updateUserQnaBoard(UserQnaBoardVO vo) {
		return dao.updateUserQnaBoard(vo);
	}

	@Override
	public int deleteUserQnaBoard(UserQnaBoardVO vo) {
		return dao.updateUserQnaBoard(vo);
	}


	
}
