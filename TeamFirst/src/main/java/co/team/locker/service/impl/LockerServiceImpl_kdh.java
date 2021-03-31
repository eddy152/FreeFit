package co.team.locker.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.locker.service.LockerService_kdh;
import co.team.locker.service.LockerVO;

@Service
public class LockerServiceImpl_kdh implements LockerService_kdh{

	@Autowired LockerService_kdh dao;
	
	@Override
	public List<LockerVO> getSearchLocker(LockerVO vo) {
		// 락커 전체 조회
		return dao.getSearchLocker(vo);
	}

	@Override
	public LockerVO getLocker(LockerVO vo) {
		// 락커 단건 조회
		return dao.getLocker(vo);
	}

}
