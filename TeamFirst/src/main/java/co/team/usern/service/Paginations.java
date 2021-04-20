package co.team.usern.service;

import lombok.Data;

@Data
public class Paginations {
	//한 페이지당 게시글 수
	private int pageSize = 10;
	//한블럭당 페이지 수
	private int rangeSize = 10;
	//현재페이지
	private int curPage = 1;
	//현재블럭
	private int curRange = 1;
	//총 게시글 수
	private int listCnt;
	//총페이지수
	private int pageCnt = 1;
	//총블럭수
	private int rangeCnt;
	//시작페이지
	private int startPage = 1;
	//끝페이지
	private int endPage = 1;
	//시작index
	private int startIndex = 0;
	// 이전페이지
	private int prevPage;
	// 다음페이지
	private int nextPage;
}
