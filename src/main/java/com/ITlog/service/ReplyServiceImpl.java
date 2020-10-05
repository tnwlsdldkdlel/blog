package com.ITlog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ITlog.domain.PageNation;
import com.ITlog.domain.ReplyPageNation;
import com.ITlog.domain.ReplyVO;
import com.ITlog.mapper.BoardMapper;
import com.ITlog.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ = @Autowired )
	public ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired )
	public BoardMapper boardmapper;

	@Override
	public int insert(ReplyVO vo) {
		boardmapper.replyCountADD(vo.getBno());
		return mapper.insert(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int replyCount(Long bno) {
		return mapper.replyCount(bno);
	}

	@Override
	public ReplyPageNation read(int page , Long bno) {	
		return new ReplyPageNation(mapper.replyCount(bno), mapper.read(page, bno));
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
