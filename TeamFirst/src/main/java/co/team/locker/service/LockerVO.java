package co.team.locker.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LockerVO {
	private String lock_num;
	private String mem_reg_id;
	private String broken_locker;
	private String first_date;
	private String final_date;
	private String user_id;
}
