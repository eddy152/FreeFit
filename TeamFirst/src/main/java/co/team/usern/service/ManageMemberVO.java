package co.team.usern.service;

import java.util.Date;

import lombok.Data;

@Data
public class ManageMemberVO {

	private int course_reg_no;
	private String user_id;
	private String tuition_no;
	private String reg_state;
	private Date reg_Date;
	private Date start_date;
	private Date end_date;
	private String remains;
}
