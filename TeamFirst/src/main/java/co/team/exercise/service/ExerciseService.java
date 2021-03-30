package co.team.exercise.service;

import java.util.List;

public interface ExerciseService {
	public List<ExerciseListVO> getSearchExerciseList(ExerciseListVO vo);
	public ExerciseListVO getExerciseListProc(ExerciseListVO vo);
	public int insertExerciseList(ExerciseListVO vo);
	public int updateExerciseList(ExerciseListVO vo);
	public int deleteExerciseList(ExerciseListVO vo);
	
	public List<ExerciseProgramBasicVO> getSearchExerciseProgramBasic(ExerciseProgramBasicVO vo);
	public ExerciseProgramBasicVO getExerciseProgramBasicProc(ExerciseProgramBasicVO vo);
	public int insertExerciseProgramBasic(ExerciseProgramBasicVO vo);
	public int updateExerciseProgramBasic(ExerciseProgramBasicVO vo);
	public int deleteExerciseProgramBasic(ExerciseProgramBasicVO vo);
	
	public List<ExeBasicDetailVO> getSearchExerciseBasicDetail(ExeBasicDetailVO vo);
	public ExeBasicDetailVO getExerciseBasicDetailProc(ExeBasicDetailVO vo);
	public int insertExerciseBasicDetail(ExeBasicDetailVO vo);
	public int updateExerciseBasicDetail(ExeBasicDetailVO vo);
	public int deleteExerciseBasicDetail(ExeBasicDetailVO vo);
	
	public List<ExerciseProgramPersonalVO> getSearchExerciseProgramPersonal(ExerciseProgramPersonalVO vo);
	public ExerciseProgramPersonalVO getExerciseProgramPersonalProc(ExerciseProgramPersonalVO vo);
	public int insertExerciseProgramPersonal(ExerciseProgramPersonalVO vo);
	public int updateExerciseProgramPersonal(ExerciseProgramPersonalVO vo);
	public int deleteExerciseProgramPersonal(ExerciseProgramPersonalVO vo);
}
