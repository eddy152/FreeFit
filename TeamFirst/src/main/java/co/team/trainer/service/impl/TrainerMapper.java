package co.team.trainer.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.team.trainer.service.TrainerVO;

@Repository
public interface TrainerMapper {
	
	//전체조회
	public List<TrainerVO> getTrainerList(TrainerVO member);
	
	//ID
	public String getTrainerId(TrainerVO member);

	//상세조회
	public TrainerVO getTrainer(String trainerId);

	//등록
	public void addTrainerMember(TrainerVO member);

	//수정
	public void updateTrainer(TrainerVO member);
	
	//삭제
	public void deleteTrainer(String id);

	
}
	

