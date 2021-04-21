package co.team.usern.service.impl;

import java.util.List;

import co.team.usern.service.UserNSearch;
import co.team.usern.service.UserNoticeVO;

public interface UserNoticeMapper {

	// 전체조회
	public List<UserNoticeVO> appuserNList(UserNoticeVO vo);

	// 단건조회
	public UserNoticeVO appNoticeUserh(int board_no);

	// 검색
	public List<UserNoticeVO> searchUserN(UserNSearch vo);

	// count
	public Integer countUserN(UserNSearch vo);

	// 조회수
	public boolean userHit(int board_no);

}
