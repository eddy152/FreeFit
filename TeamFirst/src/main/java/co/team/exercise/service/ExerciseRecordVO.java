package co.team.exercise.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExerciseRecordVO {
	int exer_no;
	String user_id;
	int exer_count;
	/*
	 * @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date exer_date;
	 */
	String exer_date;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	Date exer_end_date;
	int exer_weight;
	int exer_do_count;
	int exep_no;
	int exe_no;
	int epd_set;
	int exer_do_set;
	String exe_name;
	String exe_part;
	int exe_part_count;
	int exe_time;
	String selDate;
	String exer_url;
}
