package co.team.locker.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.locker.service.LockerService_kdh;
import co.team.locker.service.LockerVO;

@Service
public class LockerServiceImpl_kdh implements LockerService_kdh{

	@Autowired LockerMapper_kdh dao;
	
	// 락커 전체 조회
	@Override
	public List<LockerVO> getSearchLocker() {
		return dao.getSearchLocker();
	}

	// 락커 단건 조회
	@Override
	public LockerVO getLocker(LockerVO vo) {
		return dao.getLocker(vo);
	}

	// 락커 등록
	@Override
	public void insertLocker(LockerVO vo) {
		dao.insertLocker(vo);
	}

	// 락커 수정
	@Override
	public void updateLocker(LockerVO vo) {
		dao.updateLocker(vo);
	}

	// 락커 삭제
	@Override
	public void deleteLocker(LockerVO vo) {
		dao.deleteLocker(vo);
	}

}
