package co.team.user.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	
	private String user_id;
	private String password;
	private String phone_number;
	private String name;
	private String age;
	private String height;
	private String notice;
	private String gender;
	private String mem_reg_id;
}
