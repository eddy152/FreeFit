package co.team.lockerRoom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.lockerRoom.service.LockerRoomService_kdh;
import co.team.lockerRoom.service.LockerRoomVO;

@Service
public class LockerRoomServiceImpl_kdh implements LockerRoomService_kdh{
	
	@Autowired LockerRoomMapper_kdh dao;

	@Override
	// 락커룸 전체 조회
	public List<LockerRoomVO> getSearchRoom() {
		return dao.getSearchRoom();
	}

	@Override
	// 락커룸 수정
	public void updateRoom(LockerRoomVO vo) {
		dao.updateRoom(vo);
	}
	
}
