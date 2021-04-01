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
	// 락커룸 단건 조회
	public LockerRoomVO getRoom(LockerRoomVO vo) {
		return dao.getRoom(vo);
	}
	
	@Override
	// 락커룸 수정
	public void updateRoom(LockerRoomVO vo) {
		dao.updateRoom(vo);
	}

	@Override
	// 락커룸 삭제
	public int deleteRoom(LockerRoomVO vo) {
		int i = dao.deleteRoom(vo);
		if (i==0)
		{i = -1;}
		return i;
	}

	
}
