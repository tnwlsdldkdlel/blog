package com.ITlog.service;

import java.util.List;

import com.ITlog.domain.PageNation;
import com.ITlog.domain.QANDAReplyPageNation;
import com.ITlog.domain.QANDAReplyVO;
import com.ITlog.domain.ReplyPageNation;
import com.ITlog.domain.ReplyVO;

public interface QANDAReplyService {

	// 댓글생성
	public int insert(QANDAReplyVO vo);

	// 댓글 개별삭제
	public int deleteRNO(Long rno);

	// 댓글삭제
	public int deleteBNO(Long bno);

	// 댓글수정
	public int update(QANDAReplyVO vo);

	// 해당댓글개수
	public int replyCount(Long bno);

	// 댓글목록
	public QANDAReplyPageNation read(int page, Long bno);

	// 댓글 좋아요
	public int selection(Long rno);

	// 댓글 정보
	public List<QANDAReplyVO> replyInfo();

}
