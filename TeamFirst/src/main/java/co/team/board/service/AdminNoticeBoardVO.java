package co.team.board.service;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminNoticeBoardVO {

		private int board_no;
		private String category;
		private String title;
		private String content;
		private Date reg_date;
		private int hit;
			
}
