package co.team.usern.service;

import java.util.List;

public interface UserNoticeService {

	// 전체조회
	public List<UserNoticeVO> appuserNList(UserNoticeVO vo);

	// 단건조회
	public UserNoticeVO appNoticeUserh(int board_no);

	public List<UserNoticeVO> searchUserN(UserNSearch vo);

	// count
	public Integer countUserN(UserNSearch vo);

	// 조회수
	public boolean userHit(int board_no);

}
