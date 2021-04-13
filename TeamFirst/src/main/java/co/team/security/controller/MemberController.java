package co.team.security.controller;

import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
import co.team.security.service.impl.MailSend;
import co.team.security.service.impl.MemberMapper;
import co.team.trainer.service.TrainerVO;
import co.team.user.service.UserVO;

@Controller
@RequestMapping(path = "/members")
public class MemberController {

	// 정규식으로 번호 이외 걸러내기
	public String phoneReplace(String str) {
		String restr = str.replaceAll("[^0-9]", "");
		return restr;
	}

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
		if (username.equals("anonymousUser")) { // 로그인한 상태가 아닐 경우
			session.invalidate(); // 세션을 삭제한다
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
		int max = mapper.getMax(); // 가입자수 불러오기

		member.setMem_reg_id((int) session.getAttribute("mem_reg_id"));
		member.setId("trainer" + max + session.getAttribute("mem_reg_id")); // 아이디 = trainer가입자수mem_reg_id
		member.setPhone_number(phoneReplace(member.getPhone_number()));
		member.setPassword(passwordEncoder.encode(member.getPhone_number()));
		memberService.addTrainerMember(member);
		return "redirect:/tilesTestProgram";
	}

	// 유저 가입
	@PostMapping("/joinU")
	public String joinUser(@ModelAttribute UserVO member, HttpSession session) {
		int max = mapper.getMax();
		member.setMem_reg_id((int) session.getAttribute("mem_reg_id"));
		member.setId("user" + max + session.getAttribute("mem_reg_id"));
		member.setPhone_number(phoneReplace(member.getPhone_number()));
		member.setPassword(passwordEncoder.encode(member.getPhone_number()));
		memberService.addUserMember(member);
		return "redirect:/tilesTestProgram";
	}

	// 아이디 중복체크
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {
		String existedId = "0";

		return memberService.userCheck(id);
	}

	// 아이디, 비밀번호 찾기 폼
	@GetMapping("/rememberForm")
	public String rememberForm() {
		return "popup/members/rememberForm";
	}

	// 아이디, 비밀번호 찾기 기능
	@ResponseBody
	@PostMapping("/rememberId")
	public String rememberId(@ModelAttribute MemberVO member) {

		member.setPhone_number(phoneReplace(member.getPhone_number()));
		String id = memberService.rememberId(member);

		return id;
	}

	@ResponseBody
	@GetMapping("/sendEmail")
	public String sendEmail(@ModelAttribute MemberVO member) {
		Random random = new Random();
		String rd = random.toString();

		String email = memberService.getEmailById(member).getEmail();
		if (email != "" & email != null) {
			String setRawPw = getRandomStr(16);
			member.setPassword(passwordEncoder.encode(setRawPw));
			int success = memberService.setPassword(member);
			if (success == 1) {
				MailSend mail = new MailSend();
				mail.MailSend(email, setRawPw);
				return email;
			}
		}

		return "error";
	}
	
	
	
	
	
	
	
	public static String getRandomStr(int size) {
		if(size > 0) {
			char[] tmp = new char[size];
			for(int i=0; i<tmp.length; i++) {
				int div = (int) Math.floor( Math.random() * 2 );
				
				if(div == 0) { // 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0') ;
				}else { //1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A') ;
				}
			}
			return new String(tmp);
		}
		return "ERROR : Size is required."; 
	}
}
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
