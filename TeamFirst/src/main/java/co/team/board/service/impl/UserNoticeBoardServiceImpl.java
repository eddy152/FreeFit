package co.team.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.board.service.UserNoticeBoardService;
import co.team.board.service.UserNoticeBoardVO;

@Service
public class UserNoticeBoardServiceImpl implements UserNoticeBoardService {

	@Autowired UserNoticeBoardMapper dao;

	@Override
	public UserNoticeBoardVO getUserNoticeBoard(UserNoticeBoardVO vo) {
		return dao.getUserNoticeBoard(vo);
	}

	@Override
	public List<UserNoticeBoardVO> getUserNoticeBoardList(UserNoticeBoardVO vo) {
		return dao.getUserNoticeBoardList(vo);
	}

	@Override
	public int insertUserNoticeBoard(UserNoticeBoardVO vo) {
		return dao.insertUserNoticeBoard(vo);
	}

	@Override
	public int updateUserNoticeBoard(UserNoticeBoardVO vo) {
		return dao.updateUserNoticBoard(vo);
	}

	@Override
	public int deleteUserNoticeBoard(UserNoticeBoardVO vo) {
		return dao.deleteUserNoticeBoard(vo);
	}

}
