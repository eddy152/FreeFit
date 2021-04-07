package co.team.security.service;

import java.util.List;

import co.team.admin.service.AdminVO;
import co.team.security.service.security.UserDbService;
import co.team.security.service.security.UserEntity;
import co.team.security.service.security.UserRoleEntity;
import co.team.trainer.service.TrainerVO;
import co.team.user.service.UserVO;

public interface MemberService extends UserDbService {
	public UserEntity getUser(String loginUserId);

	public List<UserRoleEntity> getUserRoles(String loginUserId);

	public void addOwnerMember(AdminVO member);

	public void addTrainerMember(TrainerVO member);

	public void addUserMember(UserVO member);
}