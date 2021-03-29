package co.team.exercise.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExeBasicDetailVO
{
	int ebd_no;
	int exe_no;
	int exep_no;
	int ebd_lower;
	int ebd_middle;
	int ebd_expert;
	int ebd_set;
	int ebd_gender;
	int exer_weight;
}
