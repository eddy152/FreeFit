package co.team.membership.service;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MembershipVO {
	private String mem_reg_id;
	private String membership_no;
	private String membership_start;
	private String membership_end;
	private String admin_id;
	private String membership_name;
	private String membership_price;
}
