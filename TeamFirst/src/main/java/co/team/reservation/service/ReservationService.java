package co.team.reservation.service;

import java.util.List;

public interface ReservationService {
	public List<ReservationVO> getReserv(ReservationVO vo);
	public int insertReserv(ReservationVO vo);
}
