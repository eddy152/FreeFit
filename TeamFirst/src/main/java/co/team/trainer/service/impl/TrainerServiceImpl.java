package co.team.trainer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.trainer.service.TrainerService;
import co.team.trainer.service.TrainerVO;

@Service
public class TrainerServiceImpl implements TrainerService {
	
	@Autowired	TrainerMapper dao;
	@Override
	public List<TrainerVO> getTrainerList(TrainerVO member) {
		return dao.getTrainerList(member);
	}
	@Override
	public String getTrainerId(TrainerVO member) {
		return dao.getTrainerId(member);
	}
	@Override
	public void updateTrainer(TrainerVO member) {
		dao.updateTrainer(member);
	}
	@Override
	public void deleteTrainer(String id) {
		dao.deleteTrainer(id);
	}

}
