package co.team.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class UserQnaBoardVO {
	private int qna_no;
	private String title;
	private String question;
	private String answer;
	private Date reg_date;
	private String user_id;
	private int mem_reg_id;
}
