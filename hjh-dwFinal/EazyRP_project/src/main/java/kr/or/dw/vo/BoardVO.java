package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int viewcnt;
	private Date updatedate;
	private int replycnt;	// 댓글 개수
	
}