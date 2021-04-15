package co.team.trainer.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.team.trainer.service.TrainerVO;

@Repository
public interface TrainerMapper {
	
	public List<TrainerVO> getTrainerList(TrainerVO member);
	
	public String getTrainerId(TrainerVO member);

	public void addTrainerMember(TrainerVO member);
	}
	

