package co.team.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class UserNoticeBoardVO {
	private int board_no;
	private int mem_board_no;
	private String category;
	private String title;
	private String content;
	private Date reg_date;
	private int hit;
	private int mem_reg_id;
}
