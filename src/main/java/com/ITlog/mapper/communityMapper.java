package com.ITlog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ITlog.domain.communityVO;

public interface communityMapper {

	// 게시글작성
	public void insert(communityVO vo);

	// 게시글삭제
	public void delete(Long bno);

	// 게시글수정
	public void update(communityVO vo);

	// 페이징한 게시글 목록
	public List<communityVO> readPaging(int currentPage);

	// 해당 게시글 내용
	public communityVO readContent(Long bno);

	// 전체글개수
	public int readCount();

	// 제목*내용으로 검색
	public List<communityVO> searchTitleANDContent(@Param("currentPage") int currentPage,
			@Param("keyword") String text);

	// 댓글 업데이트
	public void replyUpdate();

}
