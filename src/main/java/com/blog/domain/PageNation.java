package com.blog.domain;

import java.util.Scanner;

import lombok.Data;

@Data
public class PageNation {
	
	//startPage = 1,11,21,31...
	//endPage = 10,20,30...
	//totalConunt = 전체게시글
	//nextPage = 게시글이 10개 넘은 경우 
	//prevPage = 1개이상
	//currentPage = 현재페이지 (activce)
	
	private int startPage;
	private int range;
	private int endPage;
	private int totalConunt;
	private int nextPage;
	private int prevPage;
	private int currentPage;
	
	public PageNation(int currentPage, int  totalConunt) {
		this.currentPage = currentPage;
		this.totalConunt = totalConunt;
		this.nextPage = currentPage + 1;
		this.prevPage =  currentPage - 1;
		this.range = (int)Math.ceil(currentPage/10.0)*10;
		this.endPage=(int)Math.ceil(totalConunt/10.0);
		this.startPage = this.range - 9;
		
		
		//전체페이지가 범위보다 큰 경우 딱 10페이지만 보여주게
		if(endPage > range) {
			this.endPage = range;
		}
		
	}
	
	
	
	
	
	
}
