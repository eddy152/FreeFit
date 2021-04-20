package co.team.exercise.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExerciseListVO {
	int exe_no;
	String exe_kinds;
	String exe_part;
	String exe_name;
}
