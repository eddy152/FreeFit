package co.team.exercise.service;

import java.util.List;

import co.team.admin.service.AdminVO;

public interface ExerciseService {
	public List<AdminVO> getSearchExerciseList(ExerciseListVO vo);
	public ExerciseListVO getExerciseList(ExerciseListVO vo);
	public int insertExerciseList(ExerciseListVO vo);
	public int updateExerciseList(ExerciseListVO vo);
	public int deleteExerciseList(ExerciseListVO vo);
}
