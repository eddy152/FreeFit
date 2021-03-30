package co.team.exercise.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.exercise.service.ExerciseListVO;
import co.team.exercise.service.ExerciseProgramBasicVO;
import co.team.exercise.service.ExerciseService;

@Service
public class ExerciseServiceImpl implements ExerciseService
{
	@Autowired ExerciseMapper dao;

	@Override
	public List<ExerciseListVO> getSearchExerciseList(ExerciseListVO vo) {
		return dao.getSearchExerciseList(vo);
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

}
