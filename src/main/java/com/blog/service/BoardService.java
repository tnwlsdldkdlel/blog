package com.blog.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blog.domain.BoardVO;
import com.blog.domain.PageNation;

public interface BoardService {

	// 게시글작성
	public void register(BoardVO vo);

	// 게시글수정
	public void Modified(BoardVO vo);

	// 게시글삭제
	public void remove(Long bno);

	// 게시글목록
	public List<BoardVO> list();

	// 게시글목록페이징
	public List<BoardVO> listPaging(int currentPage);

	// 전체게시글개수
	public int listCount();

	// 해당아이디 글목록
	public List<BoardVO> listID(int currentPage, String id);

	// 해당아이디 글개수
	public int listIDCount(String id);

	// 게시글 내용
	public List<BoardVO> boardContent(Long bno);

	// 제목*내용으로 검색
	public List<BoardVO> searchContent(@Param("currentPage") int currentPage, String text);


}
