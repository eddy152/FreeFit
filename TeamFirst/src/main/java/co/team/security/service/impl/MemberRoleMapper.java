package co.team.security.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.team.security.service.MemberRoleVO;

@Repository
public interface MemberRoleMapper {
	public List<MemberRoleVO> getRolesById(String member_id);
}
