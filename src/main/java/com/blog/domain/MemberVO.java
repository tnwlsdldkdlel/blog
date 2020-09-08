package com.blog.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String password;
	private String nickname;
	private Date joindate;
}
