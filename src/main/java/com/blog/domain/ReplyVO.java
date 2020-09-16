package com.blog.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long rno;
	private Long bno;
	private String content;
	private String id;
	private Date regdate;
	private Date updatedate;
	private List<MemberVO> memberList;
	private List<BoardVO> boardList;
	
}
