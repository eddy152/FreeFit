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
		// 피트니스 찾기
		List<AdminVO> fitnesses = memberService.ownerFitnesses(member);
		if (fitnesses.isEmpty()) {
			return "redirect:/members/profile#fitness";
		}
		// 피트니스 있으면 정보 담아서 보내기
		int allPoint = memberService.getProfileInfo(id).getAll_point();
		model.addAttribute("fitnesses", fitnesses);
		model.addAttribute("grade", grade);
		model.addAttribute("point", allPoint);

		return "homepage/membership/msRegister";
	}

	@PostMapping("/kakaoPay")
	public String kakaoPayget(KakaoNeedInfoVO kakaoVo, HttpServletRequest request, HttpSession session) {
		String admin_id = (String) session.getAttribute("id");
		if (memberService.getProfileInfo(admin_id).getAll_point() >= kakaoVo
				.getAll_point()) {
			
			int payNo = memberService.getPayment(admin_id);
			kakaoVo.setPartner_order_id(admin_id + "_" + kakaoVo.getFitness_name() + "_" + payNo);
			kakaoVo.setPartner_user_id(admin_id);

			KakaoPayReadyVO kakaoPayReadyVO=kakaopay.kakaoPayReady(kakaoVo, request);
			System.out.println("kakaoVo: " + kakaoVo);
			kakaoVo.setTid(kakaoPayReadyVO.getTid());
			session.setAttribute("kakaoVo", kakaoVo);
			return "redirect:" + kakaoPayReadyVO.getNext_redirect_pc_url() ;
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
		KakaoNeedInfoVO kakaoVo = (KakaoNeedInfoVO) session.getAttribute("kakaoVo");
		KakaoPayApprovalVO approvalvo = kakaopay.kakaoPayInfo(pg_token, kakaoVo);
		approvalvo.setTax_free_amount(approvalvo.getAmount().getTotal());
		;
		approvalvo.setP_fitness_id(kakaoVo.getFitness_id());
		if (kakaoVo.getItem_name().equals("gold")) {
			approvalvo.setP_membership_no(2);
		} else
			approvalvo.setP_membership_no(3);
		approvalvo.setP_all_point(kakaoVo.getAll_point());
		System.out.println("approvalvo: " + approvalvo);
		// 포인트, 어드민(allpoint), 결제내역,멤버십등록현황, 오너 멤버쉽권한,
		memberService.newPayment(approvalvo);
		

		// 정보 담아서 리턴
		model.addAttribute("info", approvalvo);
		return "popup/membership/kakaoPaySuccess";
	}
	// 결제후페이지

}
