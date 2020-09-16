package com.blog.mapper;

import java.util.List;

import com.blog.domain.ReplyVO;

public interface ReplyMapper {
	
	//댓글생성
	public void insert(ReplyVO vo);
	
	//댓글삭제
	public void delete(Long rno);
	
	//댓글수정
	public void update(ReplyVO vo);
	
	//해당댓글개수
	public int replyCount(Long rno);
	
	//댓글목록
	public List<ReplyVO> read(Long bno);

}
