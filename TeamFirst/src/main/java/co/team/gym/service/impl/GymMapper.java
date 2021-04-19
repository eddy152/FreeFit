package co.team.gym.service.impl;

import java.util.List;

import co.team.gym.service.GymListSearch;
import co.team.gym.service.GymVO;

public interface GymMapper {

	public List<GymVO> serarchGymList(GymListSearch vo);
	
	public int countGymList(GymListSearch vo);
	
	public GymVO getGym(String id);
}
