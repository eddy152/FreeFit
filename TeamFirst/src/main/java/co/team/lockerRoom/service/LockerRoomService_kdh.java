package co.team.lockerRoom.service;

import java.util.List;

public interface LockerRoomService_kdh {
	
	// 락커룸 전체 리스트
	public List<LockerRoomVO> getSearchRoom();
	
	// 락커룸 수정
	public void updateRoom(LockerRoomVO vo);
}
