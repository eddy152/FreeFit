package co.team.home.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	String uploadPath;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "homepage/home";
	}

	// 타일즈 테스트

	// 홈페이지 타일즈
	@RequestMapping("/tilesTestHomepage") // 주소는 그냥 원하는 것 적으면 됨
	public String tilesTestHomepage() {
		return "homepage/test/home"; // return 값 "homepage/*/*"
	}

	// 프로그램 타일즈
	@RequestMapping("/tilesTestProgram")
	public String tilesTestProgram() {
		return "program/test/home";
	}

	// 앱 타일즈
	@RequestMapping("/tilesTestApp")
	public String tilesTestApp() {
		return "app/test/home";
	}

	// 타일즈 적용을 원하지 않는 경우 (팝업 등)
	@RequestMapping("/tilesNo")
	public String tilesNo() {
		return "popup/home"; // popup 폴더에 넣기
	}
	
	
	
	
	//파일업로드기능

	

	
//	//post 일때 작동하는 upload 기능
//	@RequestMapping(value = "/upload", method = RequestMethod.POST)
//	public ModelAndView uploadForm(MultipartFile file, ModelAndView mv) throws IOException {
//
//		String fileName = file.getOriginalFilename(); //파일 이름 받아온다
//		
//		//같은 이름일때 겹치는 걸 막기 위해서 난수생성기능 추가해야할듯
//		//fileName = (대충 난수생성);
//		
//		
//		//파일 리사이즈
////		BufferedImage originalImage = ImageIO.read(file.getInputStream());
////		Scalr.resize(originalImage, 400, -1);
//		
//		
//		File target = new File(uploadPath, fileName); //상단에 autowired 된 uploadPath 받아온다 (root-context.xml참조)
//														// 그리고 파일이름 저장.
//		
//		// 경로 생성
//		if (!new File(uploadPath).exists()) { //이런 경로가 없으면
//			new File(uploadPath).mkdirs(); //폴더만듦
//		}
//		
//		try {
//			FileCopyUtils.copy(file.getBytes(), target); //임시 디렉토리에 저장된 파일을 지정 디렉토리로 복사
//														//(파일바이트배열 , (업로드경로,파일이름))
//			
//			mv.addObject("file", file); 
//			//모델앤뷰에 file 로 file 추가. ${file.originalFilename},${file.contentType} 등으로 꺼내씀
//
//		} catch (Exception e) {
//			//오류처리
//			e.printStackTrace();
//			mv.addObject("file", "error");
//		}
//		
//		// View 위치 설정
//		mv.setViewName("app/test/home");
//		return mv;
//	}

}
