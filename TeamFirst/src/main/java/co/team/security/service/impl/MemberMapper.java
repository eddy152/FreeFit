package co.team.security.service.impl;

import org.springframework.stereotype.Repository;

import co.team.security.service.MemberVO;

@Repository
public interface MemberMapper {
	public MemberVO getMemberById(String id);
}
