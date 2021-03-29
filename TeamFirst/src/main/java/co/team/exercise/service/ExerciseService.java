package co.team.exercise.service;

import java.util.List;

public interface ExerciseService {
	public List<ExerciseListVO> getSearchExerciseList(ExerciseListVO vo);
	public ExerciseListVO getExerciseList(ExerciseListVO vo);
	public int insertExerciseList(ExerciseListVO vo);
	public int updateExerciseList(ExerciseListVO vo);
	public int deleteExerciseList(ExerciseListVO vo);
}
