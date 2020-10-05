package com.ITlog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ITlog.domain.CommunityPageNation;
import com.ITlog.domain.CommunityReplyVO;
import com.ITlog.domain.PageNation;
import com.ITlog.domain.QANDAReplyPageNation;
import com.ITlog.domain.QANDAReplyVO;
import com.ITlog.domain.ReplyPageNation;
import com.ITlog.domain.ReplyVO;
import com.ITlog.domain.communityVO;
import com.ITlog.mapper.CommunityReplyMapper;
import com.ITlog.mapper.QANDAReplyMapper;
import com.ITlog.mapper.ReplyMapper;
import com.ITlog.mapper.communityMapper;

import lombok.Setter;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService{
	
	@Setter(onMethod_ = @Autowired )
	public CommunityReplyMapper mapper;

	@Override
	public int insert(CommunityReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int update(CommunityReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int replyCount(Long bno) {
		return mapper.replyCount(bno);
	}

	@Override
	public CommunityPageNation read(int page , Long bno) {
		return new CommunityPageNation(mapper.replyCount(bno), mapper.read(page, bno));
	}

	@Override
	public int deleteRNO(Long rno) {
		return mapper.deleteRNO(rno);
	}

	@Override
	public int deleteBNO(Long bno) {
		return mapper.deleteBNO(bno);
	}

}
