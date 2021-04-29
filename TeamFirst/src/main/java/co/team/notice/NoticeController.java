package co.team.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

	@GetMapping("/freefitNotice")
    public String freefitNotice() {
        return "homepage/freefit/freefitNotice";
    }
	
	@GetMapping("/freefitNotice2")
    public String freefitNotice2() {
        return "homepage/freefit/freefitNotice2";
	}
}