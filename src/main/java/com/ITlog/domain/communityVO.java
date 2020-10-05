package com.ITlog.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class communityVO {
	
	
	private Long bno;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int reply;
	private List<MemberVO> member;

}
