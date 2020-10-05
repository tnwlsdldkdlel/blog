package com.ITlog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ITlog.domain.QANDA_BoardVO;
import com.ITlog.mapper.QANDAReplyMapper;
import com.ITlog.mapper.QANDA_BoardMapper;

import lombok.Setter;

@Service
public class QANDA_BoardServiceImpl implements QANDA_BoardService {
	
	@Setter(onMethod_ = @Autowired)
	public QANDA_BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	public QANDAReplyMapper replymapper;

	@Override
	public void register(QANDA_BoardVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public void Modified(QANDA_BoardVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void remove(Long bno) {
		mapper.delete(bno);
		
	}

	@Override
	public List<QANDA_BoardVO> listPaging(int currentPage) {
		return mapper.readPaging(currentPage);
	}

	@Override
	public int listCount() {
		return mapper.readCount();
	}

	@Override
	public QANDA_BoardVO boardContent(Long bno) {
		return mapper.readContent(bno);
	}

	@Override
	public List<QANDA_BoardVO> search(String rangeType, String keyword,int currentPage) {
		return mapper.search(rangeType, keyword,currentPage);
	}

	@Override
	public int searchCount(String rangeType, String keyword) {
		return mapper.searchCount(rangeType, keyword);
	}

	@Override
	public void replyUpdate() {
		mapper.replyUpdate();
		
	}

}
