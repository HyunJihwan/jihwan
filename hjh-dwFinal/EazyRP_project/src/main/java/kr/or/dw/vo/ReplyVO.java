package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rno;
	private int bno;
	private String replyer;
	private String replytext;
	private Date regdate;
	private Date updatedate;
	
}
