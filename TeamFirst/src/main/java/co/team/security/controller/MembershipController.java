package co.team.security.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.util.concurrent.Service;

import co.team.admin.service.AdminVO;
import co.team.security.service.MemberService;
import co.team.security.service.impl.MemberMapper;

@Controller
@RequestMapping(path = "/membership")
public class MembershipController {

	@Autowired
	MemberService memberService;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	MemberMapper mapper;
	
	//멤버십 가격
	@GetMapping("/pricing")
	public String joinformH() {
		return "homepage/membership/pricing";
		
	}
	
	//멤버십 등록 페이지 (grade 로 등급넘김)
	@GetMapping("/msRegister")
	public String msRegister(String grade,Model model, HttpSession session) {
		//로그인여부는 security 로 거르고
		String id=(String)session.getAttribute("id");
		AdminVO member=new AdminVO();
		member.setAdmin_id(id);
		List<AdminVO> membership=memberService.ownerMemberships(member);
		if (membership ==null) {
			
		}
		//모델에 등급값, 아이디, 현재 멤버십 등록현황 받아서
		model.addAttribute("id",id);
		//멤버십 있으면 추가페이지로
		
		return "homepage/membership/msRegister";
	}
	
	//멤버십 결제 페이지
	
	
	
}
