package co.team.spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Controller1 {

	@RequestMapping(value="layout.do", method= RequestMethod.GET)
	public String layout(Model model) {
		return "layout";
	}
}
