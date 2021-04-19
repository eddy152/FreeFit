package co.team.gym.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.gym.service.GymListSearch;
import co.team.gym.service.GymService;
import co.team.gym.service.GymVO;

@Service
public class GymServiceImpl implements GymService {
	
	@Autowired
	private GymMapper dao;

	@Override
	public List<GymVO> searchGymList(GymListSearch vo) {
		return dao.serarchGymList(vo);
	}

	@Override
	public int countGymList(GymListSearch vo) {
		return dao.countGymList(vo);
	}

	@Override
	public GymVO getGym(String id) {
		return dao.getGym(id);
	}
}
