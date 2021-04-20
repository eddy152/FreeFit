package co.team.usern.service.impl;

import java.util.List;

import co.team.usern.service.ManageMemberVO;

public interface ManageMemberMapper {

	//강습회원 전체조회
	public List<ManageMemberVO> manageList(ManageMemberVO vo);
	//단건
	public ManageMemberVO getMem(int course_reg_no);
}
