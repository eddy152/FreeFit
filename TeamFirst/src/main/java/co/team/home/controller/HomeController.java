package co.team.home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "homepage/home";
	}
	
	//타일즈 테스트
	

	//홈페이지 타일즈
	@RequestMapping("/tilesTestHomepage") //주소는 그냥 원하는 것 적으면 됨
	public String tilesTestHomepage() {
		return "homepage/test/home"; //return 값 "homepage/*/*" 
	}
	
	//프로그램 타일즈
	@RequestMapping("/tilesTestProgram")
	public String tilesTestProgram() {
		return "program/test/home";
	}
	
	//앱 타일즈
	@RequestMapping("/tilesTestApp")
	public String tilesTestApp() {
		return "app/test/home";
	}
	
	//타일즈 적용을 원하지 않는 경우 (팝업 등)
	@RequestMapping("/tilesNo")
	public String tilesNo() {
		return "popup/home"; //popup 폴더에 넣기
	}
	
}
