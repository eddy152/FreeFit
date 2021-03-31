package co.team.exercise.service;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExerciseProgramPersonalVO {
	int exep_no;
	String trainer_id;
	String exep_name;
	String exep_trainer_name;
	Date exep_date;
	String user_id;
}
