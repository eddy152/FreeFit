package co.team.locker.service.impl;

import java.util.List;

import co.team.locker.service.LockerVO;

public interface LockerMapper_kdh {
	
	// 락커 전체 리스트
	public List<LockerVO> getSearchLocker(LockerVO vo);
	
	// 락커 단건 조회
	public LockerVO getLocker(LockerVO vo);
	
	// 락커 등록
	
	// 락커 수정
	
	// 락커 삭제
	
}
