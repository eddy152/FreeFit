package co.team.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class AdminNoticeBoardVO {

		private int board_no;
		private String category;
		private String title;
		private String content;
		private Date reg_date;
		private int hit;
			
}
