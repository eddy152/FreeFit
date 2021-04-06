package co.team.security.service;

import lombok.Data;

@Data
public class MemberVO {
private String id;
private String password;
private String table; // admin, ff_user, trainer 구분
}
