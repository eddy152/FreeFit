package co.team.security.service;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String password;
	private Integer fitness_id; // admin, ff_user, trainer 구분
	private String phone_number;
	private String name;
	private String email;
	private String tblName;
	private String age;
	private String height;
	private String user_id;
	private String weight;
	private String gender;
	private String role_name;
}
