package co.team.course.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Course_Info_VO {
	
	private String course_no;
	private String trainer_id;
	private String category;
	private String course_title;
	private String course_start;
	private String course_end;
	private String course_day;
	private String limit;
	private String course_state;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date end_date;
	private int unit_method_get;
	

}
