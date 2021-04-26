package co.team.security.service;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	private String p_membership_no;
	private String fitness_name;
	private String tid;
	private String next_redirect_app_url;
	private String next_redirect_mobile_url;
	private String next_redirect_pc_url;
	private String android_app_scheme;
	private String ios_app_scheme;
	private Date created_at;
	private String partner_order_id;
	private String partner_user_id;
	private int all_point;
	private int fitness_id;

}
