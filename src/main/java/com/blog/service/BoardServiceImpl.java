package com.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.domain.BoardVO;
import com.blog.domain.Criteria;
import com.blog.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	//게시글작성
	@Override
	public void register(BoardVO vo) {
		mapper.insert(vo);

	}

	//
	@Override
	public void Modified(BoardVO vo) {
		mapper.update(vo);

	}

	@Override
	public void remove(Long bno) {
		mapper.delete(bno);

	}

	@Override
	public List<BoardVO> list() {
		return mapper.read();
	}

	@Override
	public List<BoardVO> listPaging(Criteria cri) {
		return mapper.readPaging(cri);
	}

	@Override
	public int countBoard() {
		return mapper.countBoard();
	}

}
