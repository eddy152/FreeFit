package co.team.gym.service;

import java.util.List;

public interface GymService {
	
	public List<GymVO> searchGymList(GymListSearch vo);
	
	public int countGymList(GymListSearch vo);
	
	public GymVO getGym(String id);
	public List<GymVO> mainGymList(String vo);
}
