package co.team.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.spring.service.DeptService;
import co.team.spring.service.DeptVO;

@Controller
public class DeptController {
	@Autowired
	DeptService service;

//	@GetMapping("/insertProduct") // 등록페이지로
//	public String insertProduct(ProductVO vo) {
//		return "product/insertProduct";
//	}
//
//	@PostMapping("/insertProduct") // 등록처리
//	public String insertProductProc(ProductVO vo) {
//		productService.insertProduct(vo);
//		return "redirect:/";
//	}

	@ResponseBody
	@GetMapping("/getTest") // 검색조회
	public DeptVO getDept(DeptVO vo) {

		return service.getDept(vo);
	}

}
