package co.team.admin.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExePersonalDetailVO
{
	int epd_no;
	int exep_no;
	int exe_no;
	int epd_set;
	int epd_count;
	int epd_weight;
	String user_id;
}
