package co.team.security.service;

import lombok.Data;

@Data
public class KakaoNeedInfoVO {
	private String partner_order_id;
	private String partner_user_id;
	private String item_name; //등급
	private String quantity; //개월
	private int total_amount; //총액
	private String fitness_name; //이름
	private int fitness_id;
	private int all_point;//사용포인트
	private String tid;
}
