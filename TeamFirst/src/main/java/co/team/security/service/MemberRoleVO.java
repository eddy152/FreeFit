package co.team.security.service;

import lombok.Data;

@Data
public class MemberRoleVO {
	private int id;
	private String member_id;
	private String role_name;
}
