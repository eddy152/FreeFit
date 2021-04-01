package co.team.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class BoardSearchVO extends ListPagingVO {

	private int board_no;
	private String title;
	private String category;
	private Date reg_date;
	private int hit;
	
}
