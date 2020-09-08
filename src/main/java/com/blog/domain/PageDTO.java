package com.blog.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	private int currentPage;
	private int nextPage;
	private int prePage;
}
