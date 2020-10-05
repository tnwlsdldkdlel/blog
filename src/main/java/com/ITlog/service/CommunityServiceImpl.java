package com.ITlog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ITlog.domain.BoardVO;
import com.ITlog.domain.PageNation;
import com.ITlog.domain.communityVO;
import com.ITlog.mapper.BoardMapper;
import com.ITlog.mapper.communityMapper;

import lombok.Setter;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Setter(onMethod_ = @Autowired)
	private communityMapper mapper;
	
	//게시글작성
	@Override
	public void register(communityVO vo) {
		mapper.insert(vo);

	}

	//
	@Override
	public void Modified(communityVO vo) {
		mapper.update(vo);

	}

	@Override
	public void remove(Long bno) {
		mapper.delete(bno);

	}
	@Override
	public List<communityVO> listPaging(int currentPage) {
		return mapper.readPaging(currentPage);
	}

	@Override
	public int listCount() {
		return mapper.readCount();
	}

	@Override
	public communityVO boardContent(Long bno) {
		return mapper.readContent(bno);
	}

	@Override
	public List<communityVO> searchContent(int currentPage, String text) {
		return mapper.searchTitleANDContent(currentPage, text);
	}

	@Override
	public void replyUpdate() {
		mapper.replyUpdate();
	}


	
}
