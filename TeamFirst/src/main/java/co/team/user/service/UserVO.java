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
	
	private String id;
	private String password;
	private String phone_number;
	private String name;
	private String age;
	private String height;
	private String notice;
	private int gender;
	private int fitness_id;
}
