package co.team.exercise.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.exercise.service.ExeBasicDetailVO;
import co.team.exercise.service.ExePersonalDetailVO;
import co.team.exercise.service.ExerciseListVO;
import co.team.exercise.service.ExerciseProgramBasicVO;
import co.team.exercise.service.ExerciseProgramPersonalVO;
import co.team.exercise.service.ExerciseRecordVO;
import co.team.exercise.service.ExerciseService;
import co.team.exercise.service.FFUserVO;
import co.team.exercise.service.UserWeightVO;

@Service
public class ExerciseServiceImpl implements ExerciseService {
	@Autowired
	ExerciseMapper dao;

	@Override
	public List<ExerciseListVO> getSearchExerciseList(ExerciseListVO vo) {
		return dao.getSearchExerciseList(vo);
	}
	
	@Override
	public List<ExerciseListVO> getSearchExerciseListAll(ExerciseListVO vo) {
		return dao.getSearchExerciseListAll(vo);
	}

	@Override
	public ExerciseListVO getExerciseListProc(ExerciseListVO vo) {
		return dao.getExerciseListProc(vo);
	}

	@Override
	public int insertExerciseList(ExerciseListVO vo) {
		dao.insertExerciseList(vo);
		return 0;
	}

	@Override
	public int updateExerciseList(ExerciseListVO vo) {
		dao.updateExerciseList(vo);
		return 0;
	}

	@Override
	public int deleteExerciseList(ExerciseListVO vo) {
		dao.deleteExerciseList(vo);
		return 0;
	}

	@Override
	public List<ExerciseProgramBasicVO> getSearchExerciseProgramBasic(ExerciseProgramBasicVO vo) {
		return dao.getSearchExerciseProgramBasic(vo);
	}

	@Override
	public ExerciseProgramBasicVO getExerciseProgramBasicProc(ExerciseProgramBasicVO vo) {
		return dao.getExerciseProgramBasicProc(vo);
	}

	@Override
	public int insertExerciseProgramBasic(ExerciseProgramBasicVO vo) {
		dao.insertExerciseProgramBasic(vo);
		return 0;
	}

	@Override
	public int updateExerciseProgramBasic(ExerciseProgramBasicVO vo) {
		dao.updateExerciseProgramBasic(vo);
		return 0;
	}

	@Override
	public int deleteExerciseProgramBasic(ExerciseProgramBasicVO vo) {
		dao.deleteExerciseProgramBasic(vo);
		return 0;
	}

	@Override
	public List<ExeBasicDetailVO> getSearchExerciseBasicDetail(ExeBasicDetailVO vo) {
		return dao.getSearchExerciseBasicDetail(vo);
	}

	@Override
	public ExeBasicDetailVO getExerciseBasicDetailProc(ExeBasicDetailVO vo) {
		return dao.getExerciseBasicDetailProc(vo);
	}

	@Override
	public int insertExerciseBasicDetail(ExeBasicDetailVO vo) {
		dao.insertExerciseBasicDetail(vo);
		return 0;
	}

	@Override
	public int updateExerciseBasicDetail(ExeBasicDetailVO vo) {
		dao.updateExerciseBasicDetail(vo);
		return 0;
	}

	@Override
	public int deleteExerciseBasicDetail(ExeBasicDetailVO vo) {
		dao.deleteExerciseBasicDetail(vo);
		return 0;
	}

	@Override
	public List<ExerciseProgramPersonalVO> getSearchExerciseProgramPersonal(ExerciseProgramPersonalVO vo) {
		return dao.getSearchExerciseProgramPersonal(vo);
	}

	@Override
	public ExerciseProgramPersonalVO getExerciseProgramPersonalProc(ExerciseProgramPersonalVO vo) {
		return dao.getExerciseProgramPersonalProc(vo);
	}

	@Override
	public int insertExerciseProgramPersonal(ExerciseProgramPersonalVO vo) {
		dao.insertExerciseProgramPersonal(vo);
		return 0;
	}

	@Override
	public int updateExerciseProgramPersonal(ExerciseProgramPersonalVO vo) {
		dao.updateExerciseProgramPersonal(vo);
		return 0;
	}

	@Override
	public int deleteExerciseProgramPersonal(ExerciseProgramPersonalVO vo) {
		dao.deleteExerciseProgramPersonal(vo);
		return 0;
	}

	@Override
	public List<ExePersonalDetailVO> getSearchExercisePersonalDetail(ExePersonalDetailVO vo) {
		return dao.getSearchExercisePersonalDetail(vo);
	}

	@Override
	public ExePersonalDetailVO getExercisePersonalDetailProc(ExePersonalDetailVO vo) {
		return dao.getExercisePersonalDetailProc(vo);
	}

	@Override
	public int insertExercisePersonalDetail(Map<String, Object> vo) {
		dao.insertExercisePersonalDetail(vo);
		return 0;
	}

	@Override
	public int updateExercisePersonalDetail(ExePersonalDetailVO vo) {
		dao.updateExercisePersonalDetail(vo);
		return 0;
	}

	@Override
	public int deleteExercisePersonalDetail(ExePersonalDetailVO vo) {
		dao.deleteExercisePersonalDetail(vo);
		return 0;
	}

	@Override
	public List<ExerciseRecordVO> getSearchExerciseRecord(ExerciseRecordVO vo) {
		return dao.getSearchExerciseRecord(vo);
	}
	
	@Override
	public List<ExerciseRecordVO> getExerciseRecordPartCount(ExerciseRecordVO vo) {
		return dao.getExerciseRecordPartCount(vo);
	}
	
	@Override
	public List<ExerciseRecordVO> getSearchExerciseRecordBetween(ExerciseRecordVO vo) {
		return dao.getSearchExerciseRecordBetween(vo);
	}
	
	@Override
	public List<ExerciseRecordVO> getSearchExerciseRecordOneDay(ExerciseRecordVO vo) {
		return dao.getSearchExerciseRecordOneDay(vo);
	}
	
	@Override
	public ExerciseRecordVO getExerciseRecordProc(ExerciseRecordVO vo) {
		return dao.getExerciseRecordProc(vo);
	}

	@Override
	public int insertExerciseRecord(ExerciseRecordVO vo) {
		dao.insertExerciseRecord(vo);
		return 0;
	}

	@Override
	public int updateExerciseRecord(ExerciseRecordVO vo) {
		dao.updateExerciseRecord(vo);
		return 0;
	}

	@Override
	public int deleteExerciseRecord(ExerciseRecordVO vo) {
		dao.deleteExerciseRecord(vo);
		return 0;
	}

	@Override
	public List<FFUserVO> getSearchFFUser(FFUserVO vo) {
		return dao.getSearchFFUser(vo);
	}

	@Override
	public FFUserVO getFFUserProc(FFUserVO vo) {
		return dao.getFFUserProc(vo);
	}

	@Override
	public List<UserWeightVO> getSearchUserWeight(UserWeightVO vo) {
		return dao.getSearchUserWeight(vo);
	}

	@Override
	public UserWeightVO getUserWeightProc(UserWeightVO vo) {
		return dao.getUserWeightProc(vo);
	}

	@Override
	public int insertUserWeight(UserWeightVO vo) {
		dao.insertUserWeight(vo);
		return 0;
	}

	@Override
	public int updateUserWeight(UserWeightVO vo) {
		dao.updateUserWeight(vo);
		return 0;
	}

	@Override
	public int deleteUserWeight(UserWeightVO vo) {
		dao.deleteUserWeight(vo);
		return 0;
	}


}
