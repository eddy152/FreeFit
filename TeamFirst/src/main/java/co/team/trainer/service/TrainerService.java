package co.team.trainer.service;

import java.util.List;

public interface TrainerService {
	
	public List<TrainerVO> getTrainerList(TrainerVO member);
	
	public String addTrainerMember(TrainerVO member);
	
	public String getTrainerId(TrainerVO member);
}
