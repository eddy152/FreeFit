package co.team.usern.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.usern.service.UserNSearch;
import co.team.usern.service.UserNoticeService;
import co.team.usern.service.UserNoticeVO;
import co.team.usern.service.UsernVO;

@Service
public class UserNoticeImpl implements UserNoticeService {

	@Autowired
	UserNoticeMapper userNoticeMapper;


	// 전체조회
	@Override
	public List<UserNoticeVO> appuserNList(UserNoticeVO vo) {
		return userNoticeMapper.appuserNList(vo);
	}

	@Override	
	public UserNoticeVO appNoticeUserh(int board_no) {
		return userNoticeMapper.appNoticeUserh(board_no);
	}

	@Override
	public List<UserNoticeVO> searchUserN(UserNSearch vo) {
		return userNoticeMapper.searchUserN(vo);
	}

	@Override
	public Integer countUserN(UserNSearch vo) {
		return userNoticeMapper.countUserN(vo);
	}

	@Override
	public boolean userHit(int board_no) {
		return userNoticeMapper.userHit(board_no);
	}
	

}
