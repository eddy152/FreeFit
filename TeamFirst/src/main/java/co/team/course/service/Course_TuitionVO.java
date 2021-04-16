package co.team.course.service;

import java.util.List;

import lombok.Data;

@Data
public class Course_TuitionVO {
	
	private String tuition_no;
	private String course_no;
	private String tuition_title;
	private int unit_method;
	private String unit;
	private String tuition;
	private List<Course_TuitionVO> tulist;
}
