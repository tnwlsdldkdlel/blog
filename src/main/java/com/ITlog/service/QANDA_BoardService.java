package com.ITlog.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ITlog.domain.PageNation;
import com.ITlog.domain.QANDA_BoardVO;

public interface QANDA_BoardService {

	// 게시글작성
	public void register(QANDA_BoardVO vo);

	// 게시글수정
	public void Modified(QANDA_BoardVO vo);

	// 게시글삭제
	public void remove(Long bno);

	// 게시글목록페이징
	public List<QANDA_BoardVO> listPaging(int currentPage);

	// 전체게시글개수
	public int listCount();

	// 게시글 내용
	public QANDA_BoardVO boardContent(Long bno);

	// content_kind로 내용과 제목 검색
	public List<QANDA_BoardVO> search(String rangeType, String keyword, int currentPage);

	// 검색결과 개수
	public int searchCount(String rangeType, String keyword);
	
	//댓글수 업데이트
	public void replyUpdate();

}
