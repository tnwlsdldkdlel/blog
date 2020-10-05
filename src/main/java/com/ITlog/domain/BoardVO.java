package com.ITlog.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data	
public class BoardVO {
	
	private Long bno;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int postlike;
	private int replycount;
	private List<MemberVO> member;

}
