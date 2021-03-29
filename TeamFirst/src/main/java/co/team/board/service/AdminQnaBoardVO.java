package co.team.board.service;



import java.util.Date;

import lombok.Data;

@Data
public class AdminQnaBoardVO {

	private int qna_no;
	private String question;
	private String answer;
	private Date reg_date;
	private String admin_id;
	private int hit;
			
}
