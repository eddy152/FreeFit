package co.team.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.user.service.UserService;
import co.team.user.service.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired UserMapper dao;
	
	@Override
	public List<UserVO> getSearchUser(UserVO vo) {
		return dao.getSearchUser(vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return dao.getUser(vo);
	}

}
