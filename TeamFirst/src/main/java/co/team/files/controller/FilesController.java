package co.team.files.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.team.files.service.FilesService;
import co.team.files.service.FilesVO;

@Controller
@RequestMapping(path = "/files")
public class FilesController {

	@Autowired
	String uploadPath;

	@Autowired
	FilesService service;

	// get 일때 upload form 페이지로 이동
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String fileupload() {
		return "app/test/home";
	}

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadForm(FilesVO vo, HttpSession session) throws IOException {

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
