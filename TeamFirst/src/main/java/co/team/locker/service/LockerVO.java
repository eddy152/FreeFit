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
	private String lock_no;
	private String mem_reg_id;
	private String broken_locker;
	private String first_date;
	private String final_date;
	private String user_id;
	private String room_no;
	private String gender;
	private String lock_sum;
	private String each_lock_no;
	private String lock_width;
	private String name;
	private String phone_number;
	private String age;
}
