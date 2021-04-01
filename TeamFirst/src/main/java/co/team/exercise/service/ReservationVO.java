package co.team.exercise.service;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReservationVO {
	int reservation_no;
	String user_id;
	String trainer_id;
	Date reservation_date;
	String content;
	Date reg_date;
}
