package co.team.security.service;

import java.util.List;

import co.team.admin.service.AdminVO;
import co.team.security.service.security.UserDbService;
import co.team.security.service.security.UserEntity;
import co.team.security.service.security.UserRoleEntity;

public interface MemberService extends UserDbService {
	public UserEntity getUser(String loginUserId);
	public List<UserRoleEntity> getUserRoles(String loginUserId);
	public void addAdminMember(AdminVO member, boolean b);
	
}