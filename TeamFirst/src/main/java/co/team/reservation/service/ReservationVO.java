package co.team.reservation.service;

import lombok.Data;

@Data
public class ReservationVO {
	
	private String reservation_no;
	private String user_id;
	private String trainer_id;
	private String reservation_date;
	private String content;
	private String reg_date;
	
}
