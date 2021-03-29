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
public class UserWeightVO
{
	int weight_no;
	String user_id;
	int weight;
	Date check_date;
}
