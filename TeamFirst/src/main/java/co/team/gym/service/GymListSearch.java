package co.team.gym.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder


public class GymListSearch {

	private int page;
	private int start;
	private String search;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;		this.start = page * 10 + 1;
		
	}
	public String getSerach() {
		return search;
	}
	
	public void setSearch(String search) {
	
		this.search = search;
	}
	public int getStart() {
		return start;
	}
}
