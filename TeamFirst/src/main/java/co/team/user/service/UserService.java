package co.team.user.service;

import java.util.List;

public interface UserService {
	public List<UserVO> getSearchUser(UserVO vo);

	public UserVO getUser(UserVO vo);
}
