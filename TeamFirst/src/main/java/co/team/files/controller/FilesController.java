package co.team.files.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.files.service.FilesService;
import co.team.files.service.FilesVO;

@Controller
@RequestMapping(path = "/files")
public class FilesController {

//	@Autowired
//	String uploadPath;

	@Autowired
	FilesService service;

	// get 일때 upload form 페이지로 이동
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String fileupload() {
		return "app/test/home";
	}

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadForm(@ModelAttribute FilesVO vo, HttpSession session) throws IOException {

		vo.setUploader((String) session.getAttribute("id"));
		
		try {
			service.uploadImage(vo);
			return vo.getPathName();
			// 모델앤뷰에 file 로 file 추가. ${file.originalFilename},${file.contentType} 등으로 꺼내씀

		} catch (Exception e) {
			// 오류처리
			e.printStackTrace();
			return "error";
		}

	}

}









//
//
//package co.team.files.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.net.URLEncoder;
//import java.util.Date;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.util.FileCopyUtils;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//import co.team.files.service.FilesService;
//import co.team.files.service.FilesVO;
//
//@Controller
//@RequestMapping(path = "/files")
//public class FilesController {
//
//	@Autowired
//	String uploadPath;
//
//	@Autowired
//	FilesService service;
//
//	// get 일때 upload form 페이지로 이동
//	@RequestMapping(value = "/upload", method = RequestMethod.GET)
//	public String fileupload() {
//		return "app/test/home";
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/upload", method = RequestMethod.POST)
//	public String uploadForm(MultipartFile file, ModelAndView mv, HttpSession session) throws IOException {
//		FilesVO vo = new FilesVO();
//
//		String uploader = (String) session.getAttribute("id");
//		String fileName = file.getOriginalFilename(); // 파일 이름 받아온다
//		String word = fileName.split("\\.")[fileName.split("\\.").length - 1];
//		String newFileName = uploader + Integer.toString((new Date()).hashCode()) + "." + word;
//		vo.setFileName(newFileName);
//		vo.setPathName("/spring/resources/img/" + newFileName);
//		vo.setUploader(uploader);
//
//		// 파일 리사이즈
////		BufferedImage originalImage = ImageIO.read(file.getInputStream());
////		Scalr.resize(originalImage, 400, -1);
//
//		File target = new File(uploadPath, newFileName); // 상단에 autowired 된 uploadPath 받아온다 (root-context.xml참조)
//															// 그리고 파일이름 저장.
//
//		// 경로 생성
//		if (!new File(uploadPath).exists()) { // 이런 경로가 없으면
//			new File(uploadPath).mkdirs(); // 만듦
//		}
//
//		try {
//			service.uploadImage(vo);
//			FileCopyUtils.copy(file.getBytes(), target); // 임시 디렉토리 저장된 파일을 지정 디렉토리로 복사
//															// (파일바이트배열 , (업로드경로,파일이름))
//			System.out.println("=============================" + "/spring/resources/img/" + vo.getFileName());
//			String result = URLEncoder.encode(vo.getFileName(), "UTF-8");
//			System.out.println("/spring/resources/img/" + result);
//			return "/spring/resources/img/" + result;
//			// 모델앤뷰에 file 로 file 추가. ${file.originalFilename},${file.contentType} 등으로 꺼내씀
//
//		} catch (Exception e) {
//			// 오류처리
//			e.printStackTrace();
//			return "error";
//		}
//
//	}
//
//}
