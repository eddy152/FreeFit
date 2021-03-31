package co.team.lockerRoom.service.impl;

import java.util.List;

import co.team.lockerRoom.service.LockerRoomVO;

public interface LockerRoomMapper_kdh {

	// 락커룸 전체 리스트
	public List<LockerRoomVO> getSearchRoom();
	
	// 락커룸 단건 조회
	public LockerRoomVO getRoom(LockerRoomVO vo);
	
	// 락커룸 수정
	public void updateRoom(LockerRoomVO vo);
}
