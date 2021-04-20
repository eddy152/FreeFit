package co.team.usern.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.usern.service.ManageMemberService;
import co.team.usern.service.ManageMemberVO;

@Service
public class ManageMemberImpl implements ManageMemberService{

	@Autowired ManageMemberMapper manageMemberMapper;
	
	//전체조회
	@Override
	public List<ManageMemberVO> manageList(ManageMemberVO vo) {
		
		return manageMemberMapper.manageList(vo);
	}
	//단건조회
	@Override
	public ManageMemberVO getMem(int course_reg_no) {
		return manageMemberMapper.getMem(course_reg_no);
	}
}
