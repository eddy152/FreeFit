package co.team.security.service.impl;

import org.springframework.stereotype.Repository;

import co.team.admin.service.AdminVO;
import co.team.security.service.MemberVO;

@Repository
public interface MemberMapper {
	public MemberVO getMemberById(String id);
	public void addOwnerMember(AdminVO member);
}
