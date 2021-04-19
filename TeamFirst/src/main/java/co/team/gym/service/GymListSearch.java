package co.team.gym.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class GymListSearch {

	private int page;
	private int start;
	private int String search;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;		this.start = page * 10 + 1;
		
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
