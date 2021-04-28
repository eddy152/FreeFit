package co.team.reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.reservation.service.ReservationService;
import co.team.reservation.service.ReservationVO;

@Service
public class ReservationImpl implements ReservationService {
	@Autowired ReservationMapper dao;

	@Override
	public List<ReservationVO> getReserv(ReservationVO vo) {
		
		return dao.getReserv(vo);
	}

	@Override
	public int insertReserv(ReservationVO vo) {

		
		return dao.insertReserv(vo);
	}
	
	
}
