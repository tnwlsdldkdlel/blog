package com.ITlog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ITlog.domain.PageNation;
import com.ITlog.domain.QANDAReplyPageNation;
import com.ITlog.domain.QANDAReplyVO;
import com.ITlog.domain.ReplyPageNation;
import com.ITlog.domain.ReplyVO;
import com.ITlog.mapper.QANDAReplyMapper;
import com.ITlog.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class QANDAReplyServiceImpl implements QANDAReplyService{
	
	@Setter(onMethod_ = @Autowired )
	public QANDAReplyMapper mapper;

	@Override
	public int insert(QANDAReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int update(QANDAReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int replyCount(Long bno) {
		return mapper.replyCount(bno);
	}

	@Override
	public QANDAReplyPageNation read(int page , Long bno) {
		return new QANDAReplyPageNation(mapper.replyCount(bno), mapper.read(page, bno));
	}

	@Override
	public int deleteRNO(Long rno) {
		return mapper.deleteRNO(rno);
	}

	@Override
	public int deleteBNO(Long bno) {
		return mapper.deleteBNO(bno);
	}

	@Override
	public int selection(Long rno) {
		return mapper.selection(rno);
	}

	@Override
	public List<QANDAReplyVO> replyInfo() {
		return mapper.replyInfo();
	}

}
