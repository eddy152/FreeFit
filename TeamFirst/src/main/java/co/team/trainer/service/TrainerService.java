package co.team.trainer.service;

import java.util.List;

public interface TrainerService {
	
	//트레이너리스트
	public List<TrainerVO> getTrainerList(TrainerVO member);
	
	//상세조회
	public String getTrainerId(TrainerVO member);

	//수정
	public void updateTrainer(TrainerVO member);
	
	//삭제
	public void deleteTrainer(String id);
}
