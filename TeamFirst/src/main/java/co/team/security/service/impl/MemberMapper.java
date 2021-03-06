package co.team.security.service.impl;

import org.springframework.stereotype.Repository;

import co.team.security.service.MemberVO;

@Repository
public interface MemberMapper {
	public MemberVO getMemberById(String id);
	public MemberVO rememberId(MemberVO vo);
	public MemberVO getAllBy(MemberVO vo);
	public int getMax();
	public int setPassword(MemberVO vo);
	
}
