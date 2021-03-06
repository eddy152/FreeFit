package co.team.food.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.food.service.FoodService_kdh;
import co.team.food.service.FoodVO;
import co.team.security.service.MemberVO;

@Controller
public class FoodController_kdh {
	@Autowired
	FoodService_kdh service;

	// 식단 전체 조회
	@RequestMapping("/getSearchFood")
	public String getSearchFood(Model model, FoodVO vo) {
		model.addAttribute("list", service.getSearchFood(vo));
		return "program/Food/getSearchFood";
	}

	// 회원 단건 조회
	@RequestMapping("/getFood")
	// @ResponseBody
	public String getFood(FoodVO vo, Model model) {
		model.addAttribute("food", service.getFood(vo));
		List<FoodVO> foodList = service.getRealFood(vo);
		model.addAttribute("calories", foodList);
		System.out.println("foodList ---> " + foodList);
		model.addAttribute("week", service.getFoodWeek(vo)); // 주간별 회원 식단 조회
		System.out.println("week ---" + service.getFoodWeek(vo));
		return "program/Food/getFood";
	}

	// 식단 통계 조회(단건)
	@RequestMapping("/getFoodSelect")
	@ResponseBody
	public FoodVO getFoodList(FoodVO vo, Model model) {
		return (FoodVO) service.getRealFood(vo);
	}

	// 날짜 조회(+)
	@RequestMapping("/getDate")
	@ResponseBody
	public List<FoodVO> getDate(FoodVO vo, Model model) {
		List<FoodVO> list = service.getFoodWeek(vo);
		System.out.println("list 1 ---> " + service.getFoodWeek(vo));
		list = service.getDate(vo);
		System.out.println("list 2 --->" + service.getDate(vo));
		return list;
	}

	// 추천별 식단 리스트(앱)
	@RequestMapping("/getAppFoodList")
	public String getAppFoodList(FoodVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberVO user = new MemberVO();
		user.setId(id); 
		model.addAttribute("member", service.getEachMember(user));
		model.addAttribute("list", service.getAppFoodList(vo));
		return "app/Food/getAppFoodList";
	}      

	// 추천별 식단 단건 조회(앱)
	@RequestMapping("/getAppFood")
	@ResponseBody
	public ArrayList<FoodVO> getAppFood(@RequestParam String diet_no) {
		FoodVO vo = service.getAppFood(diet_no);
		String[] list = vo.getDiet_content().split(", ");
		ArrayList<FoodVO> aList = new ArrayList<>();
		for (int i = 0; i < list.length; i++) {
			System.out.println("444 " + list[i]);
			FoodVO fvo = new FoodVO();
			String[] list2 = list[i].split("/");
			fvo.setDetail_food(list2[0]);
			System.out.println(list2[0] + " ---- " + list2[1]);
			fvo.setDetail_count(list2[1]);
			fvo.setDiet_no(diet_no);
			fvo.setDiet_title(vo.getDiet_title());
			fvo.setTotal_calorie(vo.getTotal_calorie());
			System.out.println("-----fvo ======" + fvo);
			aList.add(fvo);
			System.out.println("------------" + aList);
		}
		return aList;


	}

	// 추천별 식단 추가 게시판(앱)
	@GetMapping("/insertFood")
	public String getAppFoodForm(FoodVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		model.addAttribute("foodList", service.getFoodList(vo));
		return "app/Food/getAppFoodForm";
	}

	// 추천별 식단 등록(앱)
	@PostMapping("/insertFood")
	// @ResponseBody
	public String insertFood(FoodVO vo, Model model) {
		service.insertFood(vo);
		return "redirect:/getAppFoodList";
	}

	// 추천별 식단 수정(앱)
	@GetMapping("/updateFood")
	public String updateFoodForm(@RequestParam String diet_no, Model model) {
		FoodVO vo = service.getAppFood(diet_no);
		String[] arr = vo.getDiet_content().split(", ");
		ArrayList<FoodVO> list = new ArrayList<>();
		for (int i = 0; i < arr.length; i++) {
			FoodVO fvo = new FoodVO();
			String[] arr2 = arr[i].split("/");

			fvo.setFood_name(arr2[0]);
			fvo.setFood_cnt(arr2[1]);

			list.add(fvo);
		}

		model.addAttribute("arr", list);
		model.addAttribute("vo", vo);
		model.addAttribute("list", service.getFoodList(null));
		return "app/Food/getAppFoodUpdateForm";
	}

	// 추천별 식단 수정(앱)
	@PostMapping("/updateFood")
	public String updateFood(FoodVO vo) {
		service.updateFood(vo);
		return "redirect:/getAppFoodList";
	}

	// 추천별 식단 삭제(앱)
	@PostMapping("/deleteFood")
	@ResponseBody
	public int deleteFood(FoodVO vo) {
		return service.deleteFood(vo);
	}

	@RequestMapping("/Test")
	// @ResponseBody
	public String Test(FoodVO vo, Model model, HttpSession session) {
		//String id = (String) session.getAttribute("id");
		//MemberVO user = new MemberVO();
		//user.setId(id);
		//user.setFitness_id(Integer.parseInt((String)session.getAttribute("fitness_id")));
		//model.addAttribute("user", service.getEachMember(user));
		
		model.addAttribute("list", service.getSearchFood(vo));
		return "app/Food/Test";
	}

	// 회원 리스트
	@RequestMapping("/getEachMember")
	public String getEachMember(FoodVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberVO user = new MemberVO();
		user.setId(id); 
		model.addAttribute("user", service.getEachMember(user));
		return "app/Food/getEachMember";
	}
	
	// 해당 회원의 실제 섭취 식단 통계 (앱)
	@RequestMapping("/getMemberFoodList")
	public String getMemberFoodList(FoodVO vo, Model model) {
		List<FoodVO> rvo = service.getRealFood(vo);
		System.out.println("-----" + rvo);
		if (rvo != null) {
			System.out.println(rvo + "------------------------------");
			model.addAttribute("list", service.getRealFood(vo)); // 실제 섭취 식단 단건 조회
		} else {
			vo.setTake_date("sysdate");
			model.addAttribute("list", service.getRealFood(vo));
		}
		model.addAttribute("food", service.getFood(vo));
		model.addAttribute("week", service.getFoodWeek(vo)); // 주간별 회원 식단 조회
		System.out.println("week ---" + service.getFoodWeek(vo));
		vo.setCnt("0");
		model.addAttribute("day", service.getWeeks(vo));
		System.out.println("day  ----  " + service.getWeeks(vo));
		return "app/Food/getMemberFoodList";
	}
	
	@RequestMapping("/getWeeks")
	@ResponseBody
	public List<FoodVO> getWeeks(FoodVO vo) {
		List<FoodVO> list = service.getWeeks(vo);
		return list;
	}

	// 해당 회원의 실제 섭취 식단 상세 및 작성 폼(앱)
	@GetMapping("/getMemberFoodInsert")
	public String getMemberFoodInsertForm(FoodVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberVO user = new MemberVO();
		user.setId(id); 
		model.addAttribute("member", service.getEachMember(user));
		
		vo.setTake_date("sysdate");
		List<FoodVO> fake = new ArrayList<FoodVO>();
		FoodVO rvo= new FoodVO();
		rvo = service.getRealFoodMember(vo);
		model.addAttribute("user", service.getFood(vo)); // 회원 단건 조회
		model.addAttribute("foodList", service.getFoodList(vo)); // 음식 정보
		model.addAttribute("food", rvo); // 실제 섭취 식단 단건 조회
		if(rvo.getReal_diet_no()!=null) {
			System.out.println(rvo.getReal_diet_no() +"널값아닌");
		vo.setReal_diet_no(rvo.getReal_diet_no()); // vo에 식단번호 담기
		
		model.addAttribute("comment", service.getComment(vo));
		} else { 
		rvo.setCnt("0");
		rvo.setCalorie("0");
		model.addAttribute("comment", fake); 
		model.addAttribute("date", service.current(rvo.getCnt()));
		model.addAttribute("food", rvo);
		System.out.println("calorie : " + rvo.getCalorie());
		System.out.println(rvo.getReal_diet_no() +"널값인");
		
		}
		model.addAttribute("oneDay", service.getFoodOne(vo)); // 일별 회원 식단 조회
		


		if (rvo != null) {

			if (rvo.getDetail_content() != null) {

				String[] arr = rvo.getDetail_content().split("/");
				System.out.println(arr + "--------------------------");
				ArrayList<FoodVO> aList = new ArrayList<>();
				for (int i = 0; i < arr.length; i++) {
					FoodVO fvo = new FoodVO();
					String[] arr2 = arr[i].split(",");

					fvo.setDetail_food(arr2[0]);
					fvo.setDetail_calorie(arr2[1]);
					fvo.setDetail_count(arr2[2]);

					aList.add(fvo);
				}
				model.addAttribute("detail", aList);
				System.out.println(aList);
			}
		}
		

		return "app/Food/getMemberFoodInsert";
	}

	// 실제 섭취 식단 추가(앱)
	@PostMapping("/getMemberFoodInsert")
	@ResponseBody
	public int getMemberFoodInsert(FoodVO vo) {
		return service.getMemberFoodInsert(vo);
	}

	
	 // 댓글 조회
	 
	@GetMapping("/getComment")
	@ResponseBody public List<FoodVO> getComment(FoodVO vo, Model model) {
	  List<FoodVO> rvo = service.getComment(vo); // 댓글 조회
	  System.out.println(rvo + "------");
	  return rvo; 
	  }
	  
	 
	// 댓글 추가
	@RequestMapping("/addComment")
	@ResponseBody
	public FoodVO addComment(FoodVO vo) {
		service.addComment(vo);
		
		System.out.println("vo ----->" + vo);
		
		FoodVO rvo = service.getDescComment(vo);
		
		vo.setComment_no(rvo.getComment_no());
		
		System.out.println("댓글 정보 -----> " + vo);
		
		return vo;
		
		
	}

	// 댓글 수정
	@RequestMapping("/updateComment")
	@ResponseBody
	public FoodVO updateComment(FoodVO vo) {
		System.out.println("vo ---> " + vo);
		service.updateComment(vo);
		return vo;
	}

	// 댓글 삭제
	@RequestMapping("/deleteComment")
	@ResponseBody
	public FoodVO deleteComment(FoodVO vo) {
		service.deleteComment(vo);
		return vo;
	}

	// 식단 내용 등록
	@RequestMapping("/insertImg")
	@ResponseBody
	public FoodVO insertImg(FoodVO vo) {
		service.insertImg(vo);
		return vo;
	}

	// 식단 내용 수정
	@RequestMapping("/foodUpdate")
	@ResponseBody
	public FoodVO foodUpdate(FoodVO vo) {
		service.foodUpdate(vo);
		return vo;
	}

	// 식단 내용 삭제
	@RequestMapping("/foodDel")
	@ResponseBody
	public FoodVO foodDel(FoodVO vo) {
		service.foodDel(vo);
		return vo;
	}

	// 일별 단건 조회
	@RequestMapping("/getDay")
	@ResponseBody
	public FoodVO getDay(FoodVO vo) {

		FoodVO result = service.getDay(vo);

		if(result == null) {
			vo.setAge("0");
			result = vo;
			System.out.println("-----" + result);
			return result;
		}

		return result;

	}

	@RequestMapping("/getComment")
	@ResponseBody
	public List<FoodVO> getComment(FoodVO real_no) {
		System.out.println("---------real_no : " + real_no);
		List<FoodVO> list = service.getComment(real_no);
		System.out.println("--------댓글리스트 조회 : " + list);

		return list;
	}

	@RequestMapping("/currentDay")
	@ResponseBody
	public FoodVO current(String cnt) {
		FoodVO fv = service.current(cnt);
		if (fv==null) {

			SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd");    

			Date today = new Date();

			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.setTime(today);

			cal.add(Calendar.DATE, Integer.parseInt(cnt));

			String y_date = formatter.format(cal.getTime());
			fv.setSysdate(y_date);
			
		}
		return fv;
	}

	// 총 칼로리 저장
	@RequestMapping("/updateCalorie")
	@ResponseBody
	public FoodVO updateCalorie(FoodVO vo) {
		System.out.println(vo.getDetail_content() + "-------------------------");

		service.updateCalorie(vo);
		return vo;

	}


	
}