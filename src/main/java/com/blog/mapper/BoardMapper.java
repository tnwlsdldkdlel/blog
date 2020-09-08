package com.blog.mapper;

import java.util.List;

import com.blog.domain.BoardVO;
import com.blog.domain.Criteria;

public interface BoardMapper {
	
	//게시글작성
	public void insert(BoardVO vo);
	
	//게시글삭제
	public void delete(Long bno);
	
	//게시글수정
	public void update(BoardVO vo);
	
	//게시글목록
	public List<BoardVO> read();
	
	//페이징한 게시글 목록
	public List<BoardVO> readPaging(Criteria cri);
	
	//게시글갯수
	public int countBoard();

}
