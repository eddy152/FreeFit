package co.team.trainer.service;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TrainerVO {
	private String trainer_id;
	private String mem_reg_id;
	private String password;
	private String phone_number;
	private String name;
	private String gender;
	private String awards;
	private String career;
	private String hire_date;
}
