package co.team.security.controller;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@GetMapping("/loginform") // 로그인폼으로
	public String loginform(HttpSession session) {

		return "popup/members/loginform";
	}

	@RequestMapping("/loginerror")
	public String loginerror(@RequestParam("login_error") String loginError) {
		return "popup/members/loginerror";
	}

	@GetMapping("/denied")
	public String denied() {
		return "popup/members/denied";
	}
 
	@RequestMapping("/log") // 아이디, mem_reg_id 세션저장, 삭제
	@ResponseBody
	public String log(HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); // 인증정보
		String username = auth.getName(); // 이름(id)을 가져온다

		System.out.println("username=" + username);
		if (username.equals("anonymousUser")) {
			session.invalidate();
		} else {
			MemberVO vo = mapper.getMemberById(username);
			session.setAttribute("mem_reg_id", vo.getMem_reg_id());
			session.setAttribute("id", vo.getId());
		}
		return "log";

	}

	// 회원가입 폼

	@GetMapping("/joinformH")
	public String joinformH() {
		return "homepage/joinLogin/joinform";
	}

	@GetMapping("/joinformP")
	public String joinformP() {
		return "popup/members/joinform";
	}

	// 오너 가입
	@PostMapping("/joinO")
	public String joinOwner(@ModelAttribute AdminVO member) {

		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addOwnerMember(member);
		return "redirect:/tilesTestProgram";
	}

	// 트레이너 가입
	@PostMapping("/joinT")
	public String joinTrainer(@ModelAttribute TrainerVO member, HttpSession session) {
		member.setMem_reg_id((int) session.getAttribute("mem_reg_id"));
		String[] pn= member.getPhone_number().split("-");
		member.setId((int) session.getAttribute("mem_reg_id")+"_"+pn[1]+pn[2]);
		member.setPassword(passwordEncoder.encode(pn[0]+pn[1]+pn[2]));
		memberService.addTrainerMember(member);
		return "redirect:/tilesTestProgram";
	}

	// 유저 가입
	@PostMapping("/joinU")
	public String joinUser(@ModelAttribute UserVO member, HttpSession session) {
		member.setMem_reg_id((int) session.getAttribute("mem_reg_id"));
		String[] pn= member.getPhone_number().split("-");
		member.setId((int) session.getAttribute("mem_reg_id")+"_"+pn[1]+pn[2]);
		member.setPassword(passwordEncoder.encode(pn[0]+pn[1]+pn[2]));
		memberService.addUserMember(member);
		return "redirect:/tilesTestProgram";
	}
	
	//아이디 중복체크
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {
		String existedId="0";
		
		
		return memberService.userCheck(id);
	}

}