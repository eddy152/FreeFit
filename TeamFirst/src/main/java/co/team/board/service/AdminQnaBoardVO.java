package co.team.board.service;

import java.util.Date;

import lombok.Data;


@Data
public class AdminQnaBoardVO {
	
	//어드민 문의 게시판VO
	private int qna_no;
	private String title;
	private String question;
	private String answer;
	private Date reg_date;
	private String admin_id;
	private int hit;
			
}
