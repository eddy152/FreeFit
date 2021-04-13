package co.team.exercise.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.exercise.service.ExeBasicDetailVO;
import co.team.exercise.service.ExePersonalDetailVO;
import co.team.exercise.service.ExerciseListVO;
import co.team.exercise.service.ExerciseProgramBasicVO;
import co.team.exercise.service.ExerciseProgramPersonalVO;
import co.team.exercise.service.ExerciseRecordVO;
import co.team.exercise.service.ExerciseService;
import co.team.exercise.service.FFUserVO;
import co.team.exercise.service.UserWeightVO;

@Controller
public class ExerciseController {
	@Autowired
	ExerciseService service;

	SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

	// EXERCISE_LIST start
	// 리스트 조회
	@GetMapping("/getSearchExerciseList")
	public String getSearchExerciseList(ExerciseListVO vo, Model model) {
		model.addAttribute("list", service.getSearchExerciseList(vo));
		return "exercise/getSearchExerciseList";
	}

	// ListALL
	@GetMapping("/getSearchExerciseListAll")
	public String getSearchExerciseListAll(ExerciseListVO vo, Model model) {
		model.addAttribute("listAll", service.getSearchExerciseListAll(vo));
		return "exercise/getSearchExerciseListAll";
	}

	// ListALLDel
	@GetMapping("/deleteExerciseListForm")
	public String deleteExerciseListForm(ExerciseListVO vo, Model model) {
		model.addAttribute("listAll", service.getSearchExerciseListAll(vo));
		return "exercise/deleteExerciseListForm";
	}

	// 단건 조회
	@GetMapping("/getExerciseListProc")
	public String getExerciseListProc(ExerciseListVO vo, Model model) {
		model.addAttribute("list", service.getExerciseListProc(vo));
		return "exercise/getExerciseListProc";
	}

	// 단건 등록
	@GetMapping("/insertExerciseList")
	public String insertExerciseList(ExerciseListVO vo) {
		service.insertExerciseList(vo);
		return "redirect:/getSearchExerciseList";
	}

	// 등록 폼
	@GetMapping("/insertExerciseListForm")
	public String insertExerciseListForm() {
		return "exercise/insertExerciseListForm";
	}

	// 단건 수정
	@GetMapping("/updateExerciseList")
	public String updateExerciseList(ExerciseListVO vo) {
		service.updateExerciseList(vo);
		return "redirect:/getSearchExerciseList";
	}

	// 단건 삭제
	@GetMapping("/deleteExerciseList")
	public String deleteExerciseList(ExerciseListVO vo) {
		service.deleteExerciseList(vo);
		return "redirect:/getSearchExerciseList";
	}
	// EXERCISE_LIST end

	// EXERCISE_PROGRAM_BASIC start
	// 리스트 조회
	@GetMapping("/getSearchExerciseProgramBasic")
	public String getSearchExerciseProgramBasic(ExerciseProgramBasicVO vo, ExeBasicDetailVO vo1,
			ExerciseProgramBasicVO vo2, Model model) {
		model.addAttribute("exeList", service.getSearchExerciseProgramBasic(vo));
		model.addAttribute("exeBasicDetail", service.getSearchExerciseBasicDetail(vo1));
		model.addAttribute("exeProgramBasic", service.getSearchExerciseProgramBasic(vo2));
		return "exercise/getSearchExerciseProgramBasic";
	}

	// 단건 조회
	@ResponseBody
	@GetMapping("/getExerciseProgramBasicProc")
	public ExerciseProgramBasicVO getExerciseProgramBasicProc(ExerciseProgramBasicVO vo) {
		return service.getExerciseProgramBasicProc(vo);
	}

	// 단건 등록
	@GetMapping("/insertExerciseProgramBasic")
	public String insertExerciseProgramBasic(ExerciseProgramBasicVO vo) {
		service.insertExerciseProgramBasic(vo);
		return "redirect:/getSearchExerciseProgramBasic";
	}

	// 단건 수정
	@GetMapping("/updateExerciseProgramBasic")
	public String updateExerciseProgramBasic(ExerciseProgramBasicVO vo) {
		service.updateExerciseProgramBasic(vo);
		return "redirect:/getSearchExerciseProgramBasic";
	}

	// 단건 삭제
	@GetMapping("/deleteExerciseProgramBasic")
	public String deleteExerciseProgramBasic(ExerciseProgramBasicVO vo) {
		service.deleteExerciseProgramBasic(vo);
		return "redirect:/getSearchExerciseProgramBasic";
	}
	// EXERCISE_PROGRAM_BASIC end

	// EXERCISE_BASIC_DETAIL start
	// 리스트 조회
	@ResponseBody
	@GetMapping("/getSearchExerciseBasicDetail")
	public List<ExeBasicDetailVO> getSearchExerciseBasicDetail(ExeBasicDetailVO vo) {
		return service.getSearchExerciseBasicDetail(vo);
	}

	// 단건 조회
	@ResponseBody
	@GetMapping("/getExerciseBasicDetailProc")
	public ExeBasicDetailVO getExerciseBasicDetailProc(ExeBasicDetailVO vo) {
		return service.getExerciseBasicDetailProc(vo);
	}

	// 단건 등록
	@GetMapping("/insertExerciseBasicDetail")
	public String insertExerciseBasicDetail(ExeBasicDetailVO vo) {
		service.insertExerciseBasicDetail(vo);
		return "redirect:/getSearchExerciseBasicDetail";
	}

	// 단건 수정
	@GetMapping("/updateExerciseBasicDetail")
	public String updateExerciseBasicDetail(ExeBasicDetailVO vo) {
		service.updateExerciseBasicDetail(vo);
		return "redirect:/getSearchExerciseBasicDetail";
	}

	// 단건 삭제
	@GetMapping("/deleteExerciseBasicDetail")
	public String deleteExerciseBasicDetail(ExeBasicDetailVO vo) {
		service.deleteExerciseBasicDetail(vo);
		return "redirect:/getSearchExerciseBasicDetail";
	}
	// EXERCISE_BASIC_DETAIL end

	// EXERCISE_PROGRAM_PERSONAL start
	// 리스트 조회
	@ResponseBody
	@GetMapping("/getSearchExerciseProgramPersonal")
	public List<ExerciseProgramPersonalVO> getSearchExerciseProgramPersonal(ExerciseProgramPersonalVO vo) {
		return service.getSearchExerciseProgramPersonal(vo);
	}

	// 단건 조회
	@ResponseBody
	@GetMapping("/getExerciseProgramPersonalProc")
	public ExerciseProgramPersonalVO getExerciseProgramPersonalProc(ExerciseProgramPersonalVO vo) {
		return service.getExerciseProgramPersonalProc(vo);
	}

	// 단건 등록
	@GetMapping("/insertExerciseProgramPersonal")
	public String insertExerciseProgramPersonal(ExerciseProgramPersonalVO vo) {
		service.insertExerciseProgramPersonal(vo);
		return "redirect:/getSearchExerciseProgramPersonal";
	}

	// 단건 수정
	@GetMapping("/updateExerciseProgramPersonal")
	public String updateExerciseProgramPersonal(ExerciseProgramPersonalVO vo) {
		service.updateExerciseProgramPersonal(vo);
		return "redirect:/getSearchExerciseProgramPersonal";
	}

	// 단건 삭제
	@GetMapping("/deleteExerciseProgramPersonal")
	public String deleteExerciseProgramPersonal(ExerciseProgramPersonalVO vo) {
		service.deleteExerciseProgramPersonal(vo);
		return "redirect:/getSearchExerciseProgramPersonal";
	}
	// EXERCISE_PROGRAM_PERSONAL end

	// EXERCISE_PERSONAL_DETAIL start
	// 리스트 조회
	@GetMapping("/getSearchExercisePersonalDetail")
	public String getSearchExercisePersonalDetail(ExePersonalDetailVO vo, Model model) {
		model.addAttribute("list", service.getSearchExercisePersonalDetail(vo));
		return "exercise/getSearchExercisePersonalDetail";
	}

	// 단건 조회
	@GetMapping("/getExercisePersonalDetailProc")
	public ExePersonalDetailVO getExercisePersonalDetailProc(ExePersonalDetailVO vo) {
		return service.getExercisePersonalDetailProc(vo);
	}

	// 단건 등록
	@GetMapping("/insertExercisePersonalDetail")
	public String insertExercisePersonalDetail(ExePersonalDetailVO vo) {
		service.insertExercisePersonalDetail(vo);
		return "redirect:/getSearchExercisePersonalDetail";
	}

	// 단건 수정
	@GetMapping("/updateExercisePersonalDetail")
	public String updateExercisePersonalDetail(ExePersonalDetailVO vo) {
		service.updateExercisePersonalDetail(vo);
		return "redirect:/getSearchExercisePersonalDetail";
	}

	// 단건 삭제
	@GetMapping("/deleteExercisePersonalDetail")
	public String deleteExercisePersonalDetail(ExePersonalDetailVO vo) {
		service.deleteExercisePersonalDetail(vo);
		return "redirect:/getSearchExercisePersonalDetail";
	}
	// EXERCISE_PERSONAL_DETAIL end

	// EXERCISE_RECORD start
	// 리스트 조회
	@GetMapping("/getSearchExerciseRecord")
	public String getSearchExerciseRecord(ExerciseRecordVO vo, Model model) {
		model.addAttribute("list", service.getSearchExerciseRecord(vo));
		return "exercise/getSearchExerciseRecord";
	}

	// ajax용 리스트 호출
	@ResponseBody
	@GetMapping("/getExerciseRecordList")
	public List<ExerciseRecordVO> getExerciseRecordList(ExerciseRecordVO vo) {
		return service.getSearchExerciseRecord(vo);
	}

	// PartCount 조회
	@ResponseBody
	@GetMapping("/getExerciseRecordPartCount")
	public List<ExerciseRecordVO> getExerciseRecordPartCount(ExerciseRecordVO vo) {
		return service.getExerciseRecordPartCount(vo);
	}

	// 주간 운동기록 조회
	@ResponseBody
	@GetMapping("/getSearchExerciseRecordBetween")
	public List<ExerciseRecordVO> getSearchExerciseRecordBetween(ExerciseRecordVO vo) {
		return service.getSearchExerciseRecordBetween(vo);
	}

	// 일간 운동기록 조회
	@ResponseBody
	@GetMapping("/getSearchExerciseRecordOneDay")
	public List<ExerciseRecordVO> getSearchExerciseRecordOneDay(ExerciseRecordVO vo) {
		return service.getSearchExerciseRecordOneDay(vo);
	}

	// 단건 조회
	@ResponseBody
	@GetMapping("/getExerciseRecordProc")
	public ExerciseRecordVO getExerciseRecordProc(ExerciseRecordVO vo) {
		return service.getExerciseRecordProc(vo);
	}

	// 단건 등록
	@GetMapping("/insertExerciseRecord")
	public String insertExerciseRecord(ExerciseRecordVO vo) {
		service.insertExerciseRecord(vo);
		return "redirect:/getSearchExerciseRecord";
	}

	// 단건 수정
	@GetMapping("/updateExerciseRecord")
	public String updateExerciseRecord(ExerciseRecordVO vo) {
		service.updateExerciseRecord(vo);
		return "redirect:/getSearchExerciseRecord";
	}

	// 단건 삭제
	@GetMapping("/deleteExerciseRecord")
	public String deleteExerciseRecord(ExerciseRecordVO vo) {
		service.deleteExerciseRecord(vo);
		return "redirect:/getSearchExerciseRecord";
	}
	// EXERCISE_RECORD end

	// FF_USER start
	// 리스트 조회
	@GetMapping("/getSearchFFUser")
	public String getSearchFFUser(FFUserVO vo, Model model) {
		model.addAttribute("list", service.getSearchFFUser(vo));
		return "exercise/getSearchFFUser";
	}

	// 단건 조회
	@GetMapping("/getFFUserProc")
	public String getFFUserProc(FFUserVO vo, Model model) {
		model.addAttribute("list", service.getFFUserProc(vo));
		return "exercise/getFFUserProc";
	}
	// FF_USER end

	// USER_WEIGHT start
	// 리스트 조회
	@ResponseBody
	@GetMapping("/getSearchUserWeight")
	public List<UserWeightVO> getSearchUserWeight(UserWeightVO vo) {
		return service.getSearchUserWeight(vo);
	}

	// 단건 조회
	@ResponseBody
	@GetMapping("/getUserWeightProc")
	public UserWeightVO getUserWeightProc(UserWeightVO vo) {
		return service.getUserWeightProc(vo);
	}

	// 단건 등록
	@GetMapping("/insertUserWeight")
	public String insertUserWeight(UserWeightVO vo) {
		service.insertUserWeight(vo);
		return "redirect:/getSearchUserWeight";
	}

	// 단건 수정
	@GetMapping("/updateUserWeight")
	public String updateUserWeight(UserWeightVO vo) {
		service.updateUserWeight(vo);
		return "redirect:/getSearchUserWeight";
	}

	// 단건 삭제
	@GetMapping("/deleteUserWeight")
	public String deleteUserWeight(UserWeightVO vo) {
		service.deleteUserWeight(vo);
		return "redirect:/getSearchUserWeight";
	}
	// USER_WEIGHT end

}