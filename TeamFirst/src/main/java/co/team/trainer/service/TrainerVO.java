package co.team.trainer.service;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TrainerVO {
	private String id;
	private int fitness_id;
	private String password;
	private String phone_number;
	private String name;
	private int gender;
	private String awards;
	private String career;
	private Date hire_date; //기본값 sysdate
}
