package com.ITlog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ITlog.domain.PageNation;
import com.ITlog.domain.ReplyVO;

public interface ReplyMapper {

	// 댓글생성
	public int insert(ReplyVO vo);

	// 댓글 개별삭제
	public int deleteRNO(Long rno);

	// 댓글 전체삭제
	public int deleteBNO(Long bno);

	// 댓글수정
	public int update(ReplyVO vo);

	// 해당댓글개수
	public int replyCount(Long bno);

	// 댓글목록
	public List<ReplyVO> read(@Param("page") int page, @Param("bno") Long bno);


}
