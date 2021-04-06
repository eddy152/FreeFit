package co.team.home.controller;

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

@Controller
@RequestMapping(path = "/members")
public class MemberController {
    // 스프링 컨테이너가 생성자를 통해 자동으로 주입한다.
    @Autowired MemberService memberService;
    @Autowired PasswordEncoder passwordEncoder;

    @GetMapping("/loginform")
    public String loginform(){
        return "popup/members/loginform";
    }

    @RequestMapping("/loginerror")
    public String loginerror(@RequestParam("login_error")String loginError){
        return "popup/members/loginerror";
    }
    

	@GetMapping("/joinformA")
	public String joinformA() {
		return "homepage/admin_member/joinform";
	}
	
	@GetMapping("/welcome")
	public String welcome() {
		return "home";
	}
	
	@PostMapping("/joinA")
	public String joinA(@ModelAttribute AdminVO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addAdminMember(member, false);
		return "home";
	}

}