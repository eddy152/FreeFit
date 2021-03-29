package co.team.exercise.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.admin.service.AdminVO;
import co.team.exercise.service.ExerciseListVO;

@Service
public class ExerciseServiceImpl implements ExerciseMapper
{
	@Autowired ExerciseMapper dao;

	@Override
	public List<AdminVO> getSearchExerciseList(ExerciseListVO vo) {
		return getSearchExerciseList(vo);
	}

	@Override
	public ExerciseListVO getExerciseList(ExerciseListVO vo) {
		return dao.getExerciseList(vo);
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

}
