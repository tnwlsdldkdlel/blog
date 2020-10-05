package com.ITlog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ITlog.domain.PageNation;
import com.ITlog.domain.QANDAReplyVO;
import com.ITlog.domain.ReplyVO;

public interface QANDAReplyMapper {
	
	//댓글생성
	public int insert(QANDAReplyVO vo);
	
	//댓글 개별삭제
	public int deleteRNO(Long rno);
	
	//댓글 전체삭제
	public int deleteBNO(Long bno);
	
	//댓글수정
	public int update(QANDAReplyVO vo);
	
	//댓글목록
	public List<QANDAReplyVO> read(@Param("page") int page , @Param("bno")Long bno);
	
	//댓글 개수
	public int replyCount(Long bno);
	
	//댓글 채택
	public int selection(Long rno);
	
	//댓글 정보
	public List<QANDAReplyVO> replyInfo();
	


}
