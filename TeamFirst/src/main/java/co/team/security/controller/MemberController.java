package co.team.security.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.team.admin.service.AdminVO;
import co.team.security.service.MemberService;
import co.team.security.service.MemberVO;
import co.team.security.service.impl.MemberMapper;
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
	@Autowired
	MemberMapper mapper;

	@GetMapping("/loginSuccess")

	public String loginSuccess(HttpServletRequest request) {
		System.out.println("hello");
		System.out.println("hellow");

		Enumeration<String> attributes = request.getSession().getAttributeNames();
		while (attributes.hasMoreElements()) {
			String attribute = (String) attributes.nextElement();
			System.out.println(attribute);
			System.out.println("-----");
			System.out.println(request.getSession().getAttribute(attribute));
		}

		return "popup/members/loginSuccess";
	}

	@GetMapping("/loginform")
	public String loginform(HttpSession session) {
		
		return "popup/members/loginform";
	}

	@RequestMapping("/loginerror")
	public String loginerror(@RequestParam("login_error") String loginError) {
		return "popup/members/loginerror";
	}

	@GetMapping("/welcome")
	public String welcome(HttpSession session) {
		int a=  (int) session.getAttribute("mem_reg_id");
		System.out.println(a);
		return "home";
	}

	@GetMapping("/denied")
	public String denied() {
		return "popup/members/denied";
	}

	@GetMapping("/mem_reg_id") //세션저장
	public String mem_reg_id(HttpSession session) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		MemberVO vo = mapper.getMemberById(username);
		session.setAttribute("mem_reg_id", vo.getMem_reg_id());

		return "popup/members/loginform";
	}

	// 회원가입 폼 만들기

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

	// 트레이너 가입
	@PostMapping("/joinT")
	public String joinTrainer(@ModelAttribute TrainerVO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addTrainerMember(member);
		return "home";
	}

	// 유저 가입
	@PostMapping("/joinU")
	public String joinUser(@ModelAttribute UserVO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addUserMember(member);
		return "home";
	}

}