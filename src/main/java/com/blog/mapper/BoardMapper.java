package com.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blog.domain.BoardVO;
import com.blog.domain.PageNation;

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
	public List<BoardVO> readPaging(int currentPage);
	
	//해당 게시글 내용
	public List<BoardVO> readContent(Long bno);
	
	//전체글개수
	public int readCount();
	
	//해당아이디에 대한 글목록
	public List<BoardVO> readID(@Param("currentPage") int currentPage, @Param("id") String id);
	
	//해당아이디에 대한 글개수
	public int readIDCount(String id);
	
	//제목*내용으로 검색
	public List<BoardVO> searchTitleANDContent(@Param("currentPage") int currentPage, @Param("text") String text);
	

}
