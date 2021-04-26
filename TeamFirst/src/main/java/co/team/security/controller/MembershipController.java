package co.team.security.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import co.team.security.service.KakaoNeedInfoVO;
import co.team.security.service.KakaoPay;
import co.team.security.service.KakaoPayApprovalVO;
import co.team.security.service.KakaoPayReadyVO;
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
		int allPoint = memberService.getProfileInfo(id).getAll_point();
		// 피트니스 찾기
		List<AdminVO> fitnesses = memberService.ownerFitnesses(member);
		if (fitnesses == null) {
			return "homepage/members/profile#fitness-reg";
		}
		// 피트니스 있으면 정보 담아서 보내기
		model.addAttribute("fitnesses", fitnesses);
		model.addAttribute("grade", grade);
		model.addAttribute("point", allPoint);

		return "homepage/membership/msRegister";
	}

	@PostMapping("/kakaoPay")
	public String kakaoPayget(KakaoNeedInfoVO kakaoVo, HttpServletRequest request, HttpSession session) {

		if (memberService.getProfileInfo((String) session.getAttribute("id")).getAll_point() >= kakaoVo
				.getAll_point()) {
			System.out.println(kakaoVo);
			String admin_id = (String) session.getAttribute("id");
			int payNo = memberService.getPayment(admin_id);
			kakaoVo.setPartner_order_id(admin_id + "_" + kakaoVo.getFitness_name() + "_" + payNo);
			kakaoVo.setPartner_user_id(admin_id);
			

			System.out.println("kakaoVo: "+kakaoVo);
			return "redirect:" + kakaopay.kakaoPayReady(kakaoVo, request);
		} else
			return "redirect:/membership/msRegister";
	}

	// 멤버십 결제 페이지
//	@PostMapping("/kakaoPay")
//	public String kakaoPay() {
//		System.out.println("카카오페이");
//		return "redirect:" + kakaopay.kakaoPayReady();
//	}

	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
		System.out.println("kakaoPaySuccess get............................................");
		System.out.println("kakaoPaySuccess pg_token : " + pg_token);
		KakaoPayApprovalVO approvalvo = kakaopay.kakaoPayInfo(pg_token);
		System.out.println("approvalvo: "+approvalvo);
		//memberService.newPayment(approvalvo);

		// 포인트, 어드민(allpoint), 결제내역,멤버십등록현황, 오너 멤버쉽권한,

		// 정보 담아서 리턴
		model.addAttribute("info", approvalvo);
		return "homepage/membership/kakaoPaySuccess";
	}
	// 결제후페이지

}
