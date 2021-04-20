package co.team.usern.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.usern.service.UserNSearch;
import co.team.usern.service.UsernService;
import co.team.usern.service.UsernVO;

@Service
public class UsernImpl  implements UsernService{

	@Autowired UsernMapper usernMapper;
	

	@Override
	public List<UsernVO> userNList(UsernVO vo) {
		return usernMapper.userNList(vo);
	}
	
	//단건조회
	@Override
	public UsernVO getUserh(int board_no) {
		return usernMapper.getUserh(board_no);
	}

	@Override
	public List<UsernVO> searchUserN(UserNSearch vo) {
		// TODO Auto-generated method stub
		return usernMapper.searchUserN(vo);
	}

	@Override
	public Integer countUserN(UserNSearch vo) {

		return usernMapper.countUserN(vo);
	}
	//등록
	@Override
	public int userWrite(UsernVO vo) {
		return usernMapper.userWrite(vo);
	}
	//수정 상세보기
	public boolean userView(UsernVO vo) {
		return usernMapper.userView(vo);
	}

	@Override
	public boolean userHit(int board_no) {
		return usernMapper.userHit(board_no);
	}

	@Override
	public UsernVO getUserN(UsernVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean userUpdate(UsernVO vo) {
		return usernMapper.userUpdate(vo);
	}

	@Override
	public int userDelete(int board_no) {
		return usernMapper.userDelete(board_no);
				
	}

	

}
