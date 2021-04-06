package co.team.security.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.team.security.service.MemberRoleVO;


//권한 값 mapper
@Repository
public interface MemberRoleMapper {
	public List<MemberRoleVO> getRolesById(String member_id);
	public void addOwnerRole(String memberId);
//		Map<String, Object> params = Collections.singletonMap("memberId", memberId);
//		jdbc.update(MemberRoleDaoSqls.INSERT_ADMIN_ROLE, params);
//	}
	public void addTrainerRole(String memberId);
	public void addUserRole(String memberId);
//		Map<String, Object> params = Collections.singletonMap("memberId", memberId);
//		jdbc.update(MemberRoleDaoSqls.INSERT_USER_ROLE, params);
//	}
	

}
