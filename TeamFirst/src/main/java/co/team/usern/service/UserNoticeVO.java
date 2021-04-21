package co.team.usern.service;

import java.util.Date;

import lombok.Data;

@Data
public class UserNoticeVO {
	
	private int board_no;
	private String mem_board_no;
	private String category;
	private String title;
	private String content;
	private Date reg_date;
	private int hit;
	private int fitness_id;
	
	public static void setStartIndex(int startIndex) {
	}
	
	public static void setCntPerPage(int startIndex) {
	}
}
