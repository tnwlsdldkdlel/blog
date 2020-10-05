package com.ITlog.domain;

import java.sql.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long rno;
	private Long bno;
	private String content;
	private String id;
	private Date regdate;
	private Date updatedate;
	private int currnetPage;

	
}
