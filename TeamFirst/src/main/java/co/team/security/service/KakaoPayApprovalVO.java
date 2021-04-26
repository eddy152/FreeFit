package co.team.security.service;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayApprovalVO {
	private int p_all_point;
	private String aid, tid, cid, sid, p_fitness_name;
	private String partner_order_id, partner_user_id, payment_method_type;
	private AmountVO amount;
	private CardVO card_info;
	private String item_name, item_code, payload;
	private Integer quantity, tax_free_amount, vat_amount, p_membership_no;
	private Date created_at, approved_at;
	private int p_fitness_id;
}
