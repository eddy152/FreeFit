package co.team.reservation.service.impl;

import java.util.List;

import co.team.reservation.service.ReservationVO;

public interface ReservationMapper {
	public List<ReservationVO> getReserv(ReservationVO vo);
	public int insertReserv(ReservationVO vo);
}
