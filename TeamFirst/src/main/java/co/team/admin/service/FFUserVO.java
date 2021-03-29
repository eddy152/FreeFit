package co.team.admin.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FFUserVO
{
	String user_id;
	String password;
	String phone_number;
	String name;
	int age;
	int height;
	String notice;
	int gender;
	int mem_reg_id;
}
