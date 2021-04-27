package co.team.trainer.service;

import java.util.List;

public interface TrainerService {
	
	//트레이너 전체조회
		public List<TrainerVO> getTrainerList(TrainerVO member);
		
		//ID
		public String getTrainerId(TrainerVO member);
		
		//상세조회
		public TrainerVO getTrainer(String trainerId);
		
		//수정
		public void updateTrainer(TrainerVO member);
		
		//삭제
		public void deleteTrainer(String id);
		
		//trainer app
		
		
		
		

		}
