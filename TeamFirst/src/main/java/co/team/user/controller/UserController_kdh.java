package co.team.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.user.service.UserService;
import co.team.user.service.UserVO;

@Controller
public class UserController_kdh {

	@Autowired UserService service;
	
	// 유저 전체 조회
	@ResponseBody
	@GetMapping("/getSearchUser")
	public List<UserVO> getSearchUser(UserVO vo) {
		return service.getSearchUser(vo);
	}
	
	// 유저 단건 조회
	@GetMapping("/getUser")
	@ResponseBody
	public UserVO getUser(UserVO vo) {
		return service.getUser(vo);
	}
	
}
