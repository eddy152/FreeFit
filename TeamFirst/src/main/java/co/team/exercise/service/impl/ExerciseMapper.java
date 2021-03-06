package co.team.exercise.service.impl;

import java.util.List;
import java.util.Map;

import co.team.exercise.service.ExeBasicDetailVO;
import co.team.exercise.service.ExePersonalDetailVO;
import co.team.exercise.service.ExerciseListVO;
import co.team.exercise.service.ExerciseProgramBasicVO;
import co.team.exercise.service.ExerciseProgramPersonalVO;
import co.team.exercise.service.ExerciseRecordVO;
import co.team.exercise.service.FFUserVO;
import co.team.exercise.service.UserWeightVO;

public interface ExerciseMapper {
	public List<ExerciseListVO> getSearchExerciseList(ExerciseListVO vo);
	public List<ExerciseListVO> getSearchExerciseListAll(ExerciseListVO vo);
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
	
	public List<ExePersonalDetailVO> getSearchExercisePersonalDetail(ExePersonalDetailVO vo);
	public List<ExePersonalDetailVO> getExercisePersonalDetailProc(ExePersonalDetailVO vo);
	public int insertExercisePersonalDetail(Map<String, Object> vo);
	public int updateExercisePersonalDetail(ExePersonalDetailVO vo);
	public int deleteExercisePersonalDetail(ExePersonalDetailVO vo);
	
	public List<ExerciseRecordVO> getSearchExerciseRecord(ExerciseRecordVO vo);
	public List<ExerciseRecordVO> getExerciseRecordPartCount(ExerciseRecordVO vo);
	public List<ExerciseRecordVO> getSearchExerciseRecordBetween(ExerciseRecordVO vo);
	public List<ExerciseRecordVO> getSearchExerciseRecordOneDay(ExerciseRecordVO vo);
	public List<ExerciseRecordVO> getSearchExerciseRecordList(ExerciseRecordVO vo);
	public ExerciseRecordVO getExerciseRecordProc(ExerciseRecordVO vo);
	public int insertExerciseRecord(Map<String, Object> vo);
	public int updateExerciseRecord(Map<String, Object> vo);
	public int deleteExerciseRecord(ExerciseRecordVO vo);
	
	public List<FFUserVO> getSearchFFUser(FFUserVO vo);
	public FFUserVO getFFUserProc(FFUserVO vo);
	
	public List<UserWeightVO> getSearchUserWeight(UserWeightVO vo);
	public UserWeightVO getUserWeightProc(UserWeightVO vo);
	public int insertUserWeight(UserWeightVO vo);
	public int updateUserWeight(UserWeightVO vo);
	public int deleteUserWeight(UserWeightVO vo);
}
