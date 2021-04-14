package co.team.board.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

// 어드민 공지 이벤트 게시판 검색
public class AdminNoticeBoardListSearch {
	
	private int page;
	private int start;
	private String search;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		this.start = page*10;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getStart() {
		return start;
	}
}
