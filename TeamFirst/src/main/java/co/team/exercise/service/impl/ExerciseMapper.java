package co.team.exercise.service.impl;

import java.util.List;

import co.team.admin.service.AdminVO;
import co.team.exercise.service.ExerciseListVO;

public interface ExerciseMapper {
	public List<ExerciseListVO> getSearchExerciseList(ExerciseListVO vo);
	public ExerciseListVO getExerciseList(ExerciseListVO vo);
	public int insertExerciseList(ExerciseListVO vo);
	public int updateExerciseList(ExerciseListVO vo);
	public int deleteExerciseList(ExerciseListVO vo);
}
