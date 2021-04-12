package co.team.user.service.impl;

import org.springframework.stereotype.Repository;

import co.team.user.service.UserVO;

@Repository
public interface UserMapper_hy {
	public void addUserMember(UserVO member);

	public String getUserId(UserVO member);

}
