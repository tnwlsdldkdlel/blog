package com.ITlog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ITlog.domain.BoardVO;
import com.ITlog.domain.PageNation;
import com.ITlog.mapper.BoardMapper;

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
	public List<BoardVO> listPaging(int currentPage) {
		return mapper.readPaging(currentPage);
	}

	@Override
	public int listCount() {
		return mapper.readCount();
	}

	@Override
	public List<BoardVO> listID(int currentPage, String id) {
		return mapper.readID(currentPage, id);
	}

	@Override
	public int listIDCount(String id) {
		int count = mapper.readIDCount(id);
		return count;
	}

	@Override
	public BoardVO boardContent(Long bno) {
		return mapper.readContent(bno);
	}

	@Override
	public List<BoardVO> searchContent(int currentPage, String text) {
		return mapper.searchTitleANDContent(currentPage, text);
	}

	@Override
	public void postlikeADD(Long bno) {
		mapper.postlikeADD(bno);
		
	}

	@Override
	public int postlikeCount(Long bno) {
		return mapper.postlikeCount(bno);
	}

	@Override
	public void replyUpdate() {
		mapper.replyUpdate();
		
	}

	@Override
	public List<BoardVO> bestPost() {
		return mapper.bestPost();
	}

	@Override
	public void profileImageUpdate() {
		mapper.profileImageUpdate();
		
	}

	


	
}
