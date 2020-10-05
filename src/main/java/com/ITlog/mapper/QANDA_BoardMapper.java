package com.ITlog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ITlog.domain.QANDA_BoardVO;

public interface QANDA_BoardMapper {
	
	//게시글작성
		public void insert(QANDA_BoardVO vo);	
		
		//게시글삭제
		public void delete(Long bno);
		
		//게시글수정
		public void update(QANDA_BoardVO vo);
		
		//페이징한 게시글 목록
		public List<QANDA_BoardVO> readPaging(int currentPage);
		
		//해당 게시글 내용
		public QANDA_BoardVO readContent(Long bno);
		
		//전체글개수
		public int readCount();
		
		//content_kind로  내용과 제목 검색
		public List<QANDA_BoardVO>search(@Param("rangeType")String rangeType, @Param("keyword") String keyword,@Param("currentPage") int currentPage);
	
		//검색결과 개수
		public int searchCount(@Param("rangeType")String rangeType, @Param("keyword") String keyword);

		//댓글 업데이트
		public void replyUpdate();
}
