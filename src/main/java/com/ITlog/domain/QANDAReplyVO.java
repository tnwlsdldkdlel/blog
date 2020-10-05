package com.ITlog.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QANDAReplyVO {
	
	private Long rno;
	private Long bno;
	private String content;
	private String id;
	private Date regdate;
	private Date updatedate;
	private int currnetPage;
	private String selection; 

}
