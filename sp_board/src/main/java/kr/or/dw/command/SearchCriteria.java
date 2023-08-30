package kr.or.dw.command;

import lombok.Data;


@Data
public class SearchCriteria {
	private int page = 1;	// 페이지번호
	private int perPageNum = 10;	// 한 페이지당 리스트 개수
	private String searchType = "";	// 검색구분
	private String keyword = "";	// 검색어
	
	
	public SearchCriteria() {
		
	};
	
	public SearchCriteria(String page, String perPageNum, String searchType, String keyword) {
		super();
		if(page != null && !page.isEmpty()) this.page = Integer.parseInt(page);
		if(perPageNum != null && !perPageNum.isEmpty()) this.perPageNum = Integer.parseInt(page);
		if(searchType != null ) this.searchType = searchType;
		if(keyword != null) this.keyword = keyword;
		
	}
	
	public int getPageStartRowNum() {		
		return (this.page -1) * perPageNum;
	}
	
	public void setPage(String page) {	// 스트링으로 넘어오는 것도 받을 수 있도록 set 메서드 하나 더 만듬
		if(page != null && !page.isEmpty()) {
			this.page = Integer.parseInt(page);
		}
	}
	
	public void setPage(int page) {	// 스트링으로 넘어오는 것도 받을 수 있도록 set 메서드 하나 더 만듬
			this.page = page;
		
	}
	
	public void perPageNum(String perPageNum) {
		if(perPageNum != null && !perPageNum.isEmpty()) {
			this.perPageNum = Integer.parseInt(perPageNum);
		}
	}
	
	
	
	
	
	
	
}
