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
public class ExerciseRecordVO
{
	int exer_no;
	String user_id;
	int exer_count;
	Date exer_date;
	Date exer_end_date;
	int exer_weight;
	int exer_do_count;
	int exep_no;
	int exe_no;
	int epd_set;
	int exer_do_set;
}
