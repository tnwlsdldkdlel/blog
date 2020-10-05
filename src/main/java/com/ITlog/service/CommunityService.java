package com.ITlog.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ITlog.domain.BoardVO;
import com.ITlog.domain.PageNation;
import com.ITlog.domain.communityVO;

public interface CommunityService {

	// 게시글작성
	public void register(communityVO vo);

	// 게시글수정
	public void Modified(communityVO vo);

	// 게시글삭제
	public void remove(Long bno);

	// 게시글목록페이징
	public List<communityVO> listPaging(int currentPage);

	// 전체게시글개수
	public int listCount();

	// 게시글 내용
	public communityVO boardContent(Long bno);

	// 제목*내용으로 검색
	public List<communityVO> searchContent(@Param("currentPage") int currentPage, String text);

	// 댓글 업데이트
	public void replyUpdate();

}
