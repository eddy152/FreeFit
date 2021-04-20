package co.team.usern.service;

import lombok.Data;

// 오너(유저) 게시판 검색 기능
@Data
public class UserNSearch {

	private int page;
	private int start;
	private String search;
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page; // 여기서 this는?
		this.start = page*10 + 1;
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
