package co.team.locker.service;

import java.util.List;

public interface LockerService_kdh {

	// 락커 전체 리스트
		public List<LockerVO> getSearchLocker(LockerVO vo);
		
		// 락커 단건 조회
		public LockerVO getLocker(LockerVO vo);
		
		// 락커 등록
		
		// 락커 수정
		
		// 락커 삭제
}
