package co.team.security.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.team.admin.service.AdminVO;
import co.team.security.service.MemberService;
import co.team.trainer.service.TrainerVO;
import co.team.user.service.UserVO;

@Controller
@RequestMapping(path = "/members")
public class MemberController {

	// 가입시
	// owner - admin
	// trainer - trainer
	// user - ff_user

	// 로그인시
	// homepage - admin
	// program - admin
	// app - trainer, user

	// 스프링 컨테이너가 생성자를 통해 자동으로 주입한다.
	@Autowired
	MemberService memberService;
	@Autowired
	PasswordEncoder passwordEncoder;

	@GetMapping("/loginform")
	public String loginform() {
		return "popup/members/loginform";
	}

	@RequestMapping("/loginerror")
	public String loginerror(@RequestParam("login_error") String loginError) {
		return "popup/members/loginerror";
	}

	@GetMapping("/welcome")
	public String welcome() {
		return "home";
	}
	
	
	
	
	//회원가입 폼 만들기
	
	@GetMapping("/joinformH")
	public String joinformH() {
		return "popup/members/loginform"; 
	}
	
	@GetMapping("/joinformP")
	public String joinformP() {
		return "popup/members/loginform";
	}
	
	
	// 오너 가입
	@PostMapping("/joinO")
	public String joinOwner(@ModelAttribute AdminVO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addOwnerMember(member);
		return "home";
	}
	
	//트레이너 가입
	@PostMapping("/joinT")
	public String joinTrainer(@ModelAttribute TrainerVO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addTrainerMember(member);
		return "home";
	}

	//유저 가입
	@PostMapping("/joinU")
	public String joinUser(@ModelAttribute UserVO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addUserMember(member);
		return "home";
	}

}