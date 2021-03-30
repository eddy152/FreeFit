package co.team.exercise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.exercise.service.ExeBasicDetailVO;
import co.team.exercise.service.ExerciseListVO;
import co.team.exercise.service.ExerciseProgramBasicVO;
import co.team.exercise.service.ExerciseProgramPersonalVO;
import co.team.exercise.service.ExerciseService;

@Controller
public class ExerciseController {
	@Autowired
	ExerciseService service;

	// EXERCISE_LIST start
	// 리스트 조회
	@ResponseBody
	@GetMapping("/getSearchExerciseList")
	public List<ExerciseListVO> getSearchExerciseList(ExerciseListVO vo) {
		return service.getSearchExerciseList(vo);
	}

	// 단건 조회
	@ResponseBody
	@GetMapping("/getExerciseListProc")
	public ExerciseListVO getExerciseListProc(ExerciseListVO vo) {
		return service.getExerciseListProc(vo);
	}

	// 단건 등록
	@GetMapping("/insertExerciseList")
	public String insertExerciseList(ExerciseListVO vo) {
		service.insertExerciseList(vo);
		return "redirect:/getSearchExerciseList";
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
	@ResponseBody
	@GetMapping("/getSearchExerciseProgramBasic")
	public List<ExerciseProgramBasicVO> getSearchExerciseProgramBasic(ExerciseProgramBasicVO vo) {
		return service.getSearchExerciseProgramBasic(vo);
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

}