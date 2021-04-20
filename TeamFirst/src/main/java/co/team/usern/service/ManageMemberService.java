package co.team.usern.service;

import java.util.List;

public interface ManageMemberService {

	// 강습회원 전체조회
	public List<ManageMemberVO> manageList(ManageMemberVO vo);

	public ManageMemberVO getMem(int course_reg_no);
}
