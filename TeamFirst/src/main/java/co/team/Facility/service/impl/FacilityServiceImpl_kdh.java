package co.team.Facility.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.Facility.service.FacilityService_kdh;
import co.team.Facility.service.FacilityVO;

@Service
public class FacilityServiceImpl_kdh implements FacilityService_kdh{

	@Autowired FacilityMapper_kdh dao;
	
	@Override
	// 시설 전체 조회
	public List<FacilityVO> getSearchFacility() {
		return dao.getSearchFacility();
	}

}
