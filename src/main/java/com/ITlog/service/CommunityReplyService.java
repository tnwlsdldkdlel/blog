package com.ITlog.service;

import com.ITlog.domain.CommunityPageNation;
import com.ITlog.domain.CommunityReplyVO;


public interface CommunityReplyService {

	// 댓글생성
	public int insert(CommunityReplyVO vo);

	// 댓글 개별삭제
	public int deleteRNO(Long rno);
	
	// 댓글삭제
		public int deleteBNO(Long bno);

	// 댓글수정
	public int update(CommunityReplyVO vo);

	// 해당댓글개수
	public int replyCount(Long bno);

	// 댓글목록
	public CommunityPageNation read(int page , Long bno);

}
