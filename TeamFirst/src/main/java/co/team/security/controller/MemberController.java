package co.team.security.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.admin.service.AdminVO;
import co.team.security.service.MemberService;
import co.team.security.service.MemberVO;
import co.team.security.service.impl.MailSend;
import co.team.security.service.impl.MemberMapper;
import co.team.trainer.service.TrainerVO;
import co.team.user.service.UserVO;

@Controller
@RequestMapping(path = "/members")
public class MemberController {
	// 스프링 컨테이너가 생성자를 통해 자동으로 주입한다.
	@Autowired
	MemberService memberService;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	MemberMapper mapper;

	// 정규식으로 번호 이외 걸러내기
	public String phoneReplace(String str) {
		String restr = str.replaceAll("[^0-9]", "");
		return restr;
	}

	// 마이페이지(프로필폼)
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		AdminVO member=new AdminVO();
		member.setId(id);
		member.setAdmin_id(id);
		List<AdminVO> fitness=memberService.ownerFitnesses(member);
		List<AdminVO> membership=memberService.ownerMemberships(member);
		if (membership!=null) {
			model.addAttribute("memList", membership);
		}
		if (fitness!=null) {
		model.addAttribute("fitList", fitness);}

		member = memberService.getProfileInfo(id);
		model.addAttribute("admin", member);
		
		List<AdminVO> payments = memberService.ownerPayments(id);
		model.addAttribute("payments", payments);


		return "homepage/membership/profile";
	}

	// 로그인폼으로
	@GetMapping("/loginform")
	public String loginform(HttpSession session) {

		return "popup/members/loginform";
	}

//로그인 에러
	@RequestMapping("/loginerror")
	public String loginerror(@RequestParam("login_error") String loginError) {
		return "popup/members/loginerror";
	}

//거부 당함
	@GetMapping("/denied")
	public String denied() {
		return "popup/members/denied";
	}

	// 아이디, fitness_id 세션저장
	@RequestMapping("/log")
	public String log(HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); // 인증정보
		String username = auth.getName(); // 이름(id)을 가져온다

		if (username.equals("anonymousUser")) { // 로그인한 상태가 아닐 경우
			session.invalidate(); // 세션을 삭제한다
			return "redirect:/";
		} else {
			//오너 권한 있는지 확인
			boolean hasOwnerRole = auth.getAuthorities().stream()
			          .anyMatch(r -> r.getAuthority().equals("ROLE_OWNER"));

			MemberVO vo = mapper.getMemberById(username);
			
			//오너가 아니면 로그인할때 fitness_id 값을 세션저장한다
			session.setAttribute("id", vo.getId());
			if(!hasOwnerRole) {
			session.setAttribute("fitness_id", vo.getFitness_id());

			return "redirect:/appMain";
			
			}
			return "redirect:/members/profile";
		}

	}

	// 권한없음
	@RequestMapping("/noAuth")
	public String dellog(HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); // 인증정보
		String username = auth.getName(); // 이름(id)을 가져온다

		if (username.equals("anonymousUser")) { // 로그인한 상태가 아닐 경우
			session.invalidate(); // 세션을 삭제한다
			return "redirect:/loginform";
		} else {
			return "redirect:/loginform";

		}

	}

	// owner 가입 폼
	@GetMapping("/joinformH")
	public String joinformH() {
		return "homepage/joinLogin/joinform";
	}

	// trainer, user 등록 폼
	@GetMapping("/joinformP")
	public String joinformP() {
		return "popup/members/joinform";
	}

	// owner 가입
	@PostMapping("/joinO")
	public String joinOwner(@ModelAttribute AdminVO member) {

		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addOwnerMember(member);
		return "redirect:/members/loginform";
	}

	// 트레이너 가입
	@PostMapping("/joinT")
	public String joinTrainer(@ModelAttribute TrainerVO member, HttpSession session) {
		int max = mapper.getMax(); // 가입자수 불러오기

		member.setFitness_id(Integer.parseInt((String) session.getAttribute("fitness_id")));
		member.setId("trainer" + session.getAttribute("fitness_id") + "_" + max); // 아이디 = trainer가입자수mem_reg_id
		member.setPhone_number(phoneReplace(member.getPhone_number()));
		member.setPassword(passwordEncoder.encode(member.getPhone_number()));
		memberService.addTrainerMember(member);
		return "redirect:/fitnessHome";
	}

	// 유저 가입
	@PostMapping("/joinU")
	public String joinUser(@ModelAttribute UserVO member, HttpSession session) {
		int max = mapper.getMax();
		member.setFitness_id(Integer.parseInt((String) session.getAttribute("fitness_id")));
		member.setId(session.getAttribute("fitness_id") + "_" + "user" + max);
		member.setPhone_number(phoneReplace(member.getPhone_number()));
		member.setPassword(passwordEncoder.encode(member.getPhone_number()));
		memberService.addUserMember(member);
		return "redirect:/fitnessHome";
	}

	// 아이디 중복체크
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {
		String existedId = "0";

		return memberService.userCheck(id);
	}

	// owner 개인 정보 수정
	@ResponseBody
	@PostMapping(value = "/updateOwner", produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String updateOwner(@ModelAttribute AdminVO member, HttpSession session) {
		member.setId((String) session.getAttribute("id"));
		if (member.getNewPW() != "" & member.getPassword() != "") {

			// 비번비교 후 맞으면 새비번 입력
			if (passwordEncoder.matches(member.getPassword(), memberService.comparePw(member))) {
				member.setPassword(passwordEncoder.encode(member.getNewPW()));
			} else {
				return "비밀번호가 다릅니다.";
			}
		} else {
			member.setPassword(null);
		}

		int update = memberService.updateOwner(member);
		System.out.println(update + " : 업데이트");
		if (update == 1) {
			return "수정 성공";
		}

		return "수정 실패";
	}

	// 피트니스 정보 수정
	@ResponseBody
	@PostMapping(value = "/updateFitness", produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String updateFitness(@ModelAttribute AdminVO member, HttpSession session) {
		// fitness_id hidden 값

		int update = memberService.updateFitness(member);
		if (update == 1) {
			return "수정 성공";
		}

		return "수정 실패";
	}

	// 피트니스 등록
	@ResponseBody
	@PostMapping(value = "/addFitness", produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String addFitness(@ModelAttribute AdminVO member, HttpSession session) {
		member.setId((String) session.getAttribute("id"));
		memberService.addFitness(member);
		return "";
	}

	// 아이디, 비밀번호 찾기 폼
	@GetMapping("/rememberForm")
	public String rememberForm() {
		return "popup/members/rememberForm";
	}

	// 아이디, 비밀번호 찾기 기능
	@ResponseBody
	// 아이디찾기
	@PostMapping("/rememberId")
	public String rememberId(@ModelAttribute MemberVO member) {

		member.setPhone_number(phoneReplace(member.getPhone_number()));
		String id = memberService.rememberId(member);

		return id;
	}

//비번찾기
	@ResponseBody
	@PostMapping("/newPassword")
	public String sendEmail(@ModelAttribute MemberVO member) {
		Random random = new Random();
		String rd = random.toString();
		member = memberService.getAllBy(member);

		String email = member.getEmail();
		if (email != "" & email != null) {
			// 16자리 비번만들어줌
			String setRawPw = getRandomStr(16);
			member.setPhone_number(phoneReplace(member.getPhone_number()));
			member.setPassword(passwordEncoder.encode(setRawPw));
			int success = memberService.setPassword(member);
			if (success == 1) {
				MailSend mail = new MailSend();
				// 메일로 보내줌
				mail.MailSend(email, setRawPw, member.getId());
				return email;
			}
		}

		return "error";
	}

//랜덤문자 만들기
	public static String getRandomStr(int size) {
		if (size > 0) {
			char[] tmp = new char[size];
			for (int i = 0; i < tmp.length; i++) {
				int div = (int) Math.floor(Math.random() * 2);

				if (div == 0) { // 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0');
				} else { // 1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A');
				}
			}
			return new String(tmp);
		}
		return "ERROR : Size is required.";
	}

}

//정보변경

// 시간(sysdate), id 저장하는 비번용 테이블 생성
// address 에 sysdate 값 넣기

// changePwForm 에서 요청하면
// sysdate 랑 저장된 시간 비교해서 30분 이상 차이나면 delete, 차이나지 않으면 id 주는 프로시저 만들기
// id 주면 changePwId 로 세션저장후 return "form"
// 세션changePwId 없으면 만료되었습니다 뜨고 홈페이지 location.href
// 세션값 있으면 변경할 비밀번호, 비밀번호 재확인 받기

// changePw에서 세션에 저장된 changePwId와 form에서 넘긴 pw 받기
// password encoder 로 pw 암호화
// id 값으로 위에 만든 비번용 데이터 삭제
// update 로 pw 변경 ->result int 로 받아서 1이면 비번변경 성공, 0이면 실패로 값 보내기
//

// 아니면 그냥 비번 랜덤값으로 update 해서 보내주기.

//	
//	@GetMapping("/changePwForm")
//	public String changePwForm(String link)
//	{
//		return "popup/members/changePwForm";
//	}
//	
//	@ResponseBody
//	@PostMapping("/")
//	public String changePw(@ModelAttribute MemberVO member)
//	{
//		
//		return "popup/members/changePw";
//	}
