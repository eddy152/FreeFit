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
}
