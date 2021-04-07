package co.team.trainer.service.impl;

import org.springframework.stereotype.Repository;

import co.team.trainer.service.TrainerVO;

@Repository
public interface TrainerMapper {
	public void addTrainerMember(TrainerVO member);

	public String getTrainerId(TrainerVO member);
}
