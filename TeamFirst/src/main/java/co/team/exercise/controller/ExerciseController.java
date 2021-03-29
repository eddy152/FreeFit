package co.team.exercise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.admin.service.AdminVO;
import co.team.exercise.service.ExerciseListVO;
import co.team.exercise.service.ExerciseService;

@Controller
public class ExerciseController {
	@Autowired
	ExerciseService service;

	// 리스트 조회
	@ResponseBody
	@GetMapping("/getSearchExerciseList") 
	public List<ExerciseListVO> getSearchExerciseList(ExerciseListVO vo) {

		return service.getSearchExerciseList(vo);
	}

	//단건 등록
	@GetMapping("/insertExerciseList") 
	public String insertExerciseList(ExerciseListVO vo) {
		service.insertExerciseList(vo);
		return "redirect:/getSearchExerciseList";
	}
	
	
}