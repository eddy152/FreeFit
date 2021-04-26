package co.team.security.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.team.admin.service.AdminVO;
import co.team.security.service.KakaoPay;
import co.team.security.service.MemberService;
import co.team.security.service.impl.MemberMapper;

@Controller
@RequestMapping(path = "/membership")
public class MembershipController {

	@Autowired
	KakaoPay kakaopay;
	@Autowired
	MemberService memberService;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	MemberMapper mapper;

	// 멤버십 가격
	@GetMapping("/pricing")
	public String joinformH() {
		return "homepage/membership/pricing";

	}

	// 멤버십 등록 페이지 (grade 로 등급넘김)
	@GetMapping("/msRegister")
	public String msRegister(String grade, Model model, HttpSession session) {
		// 로그인여부는 security 로 거르고
		String id = (String) session.getAttribute("id");
		AdminVO member = new AdminVO();
		member.setId(id);
		// 피트니스 찾기
		List<AdminVO> fitnesses = memberService.ownerFitnesses(member);
		if (fitnesses == null) { 
			return "homepage/members/profile#fitness-reg";
		}
		// 피트니스 있으면 정보 담아서 보내기
		model.addAttribute("fitnesses", fitnesses);
		model.addAttribute("grade", grade);

		return "homepage/membership/msRegister";
	}
	@GetMapping("/kakaoPay")
	public String kakaoPayget() {
		System.out.println("카카오페이");
		return "redirect:" + kakaopay.kakaoPayReady();
	}

	// 멤버십 결제 페이지
//	@PostMapping("/kakaoPay")
//	public String kakaoPay() {
//		System.out.println("카카오페이");
//		return "redirect:" + kakaopay.kakaoPayReady();
//	}

	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("kakaoPaySuccess get............................................");
		System.out.println("kakaoPaySuccess pg_token : " + pg_token);

		//정보 담아서 리턴
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
		
		//포인트, 어드민(allpoint), 결제내역,멤버십등록현황, 오너 멤버쉽권한, 
		
		return "homepage/membership/kakaoPaySuccess";
	}
	// 결제후페이지

}
