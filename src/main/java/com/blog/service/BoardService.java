package com.blog.service;

import java.util.List;

import com.blog.domain.BoardVO;
import com.blog.domain.PageNation;

public interface BoardService {
	
	//게시글작성
	public void register(BoardVO vo);
	
	//게시글수정
	public void Modified(BoardVO vo);
	
	//게시글삭제
	public void remove(Long bno);
	
	//게시글목록
	public List<BoardVO> list();
	
	//게시글목록페이징
	public List<BoardVO> listPaging(int currentPage);
	
	//전체게시글개수
	public int listCount();
	
	

}
