package co.team.trainer.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.team.trainer.service.TrainerVO;

@Repository
public interface TrainerMapper {
	
	//트레이너 전체리스트
	public List<TrainerVO> getTrainerList(TrainerVO member);
	
	//트레이너 상세조회
	public String getTrainerId(TrainerVO member);

	//지우니깐 에러뜸..
	public void addTrainerMember(TrainerVO member);
	
	//수정
	public void updateTrainer(TrainerVO member);
	
	//삭제 
	public void deleteTrainer(String id);
}
	

