package co.team.lockerRoom.service;

import java.util.List;

public interface LockerRoomService_kdh {
	
	// 락커룸 전체 리스트
	public List<LockerRoomVO> getSearchRoom();
	
	// 락커룸 단건 조회
	public LockerRoomVO getRoom(LockerRoomVO vo);
	
	// 락커룸 수정
	public void updateRoom(LockerRoomVO vo);
	
	// 락커룸 삭제
	public int deleteRoom(LockerRoomVO vo);
	
	// 락커 갯수 관리
	public void manageRoom(LockerRoomVO vo);
}
