package co.team.user.service.impl;

import java.util.List;

import co.team.user.service.UserVO;

public interface UserMapper {
	public List<UserVO> getSearchUser(UserVO vo);
	
	public UserVO getUser(UserVO vo);
}
