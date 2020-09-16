package com.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.domain.MemberVO;
import com.blog.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;

@Service
public class MemberServicelmpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	//회원가입
	@Override
	public void join(MemberVO vo) {
		mapper.insert(vo);
	}

	//회원탈퇴
	@Override
	public void secession(String id) {
		mapper.delete(id);

	}

	//회원수정
	@Override
	public void Modified(MemberVO vo) {
		mapper.update(vo);

	}

	//회원정보
	@Override
	public MemberVO Information(String id) {
		MemberVO vo = new MemberVO();
		vo = mapper.read(id);
		return vo;
	}

	@Override
	public List<MemberVO> searchIdANDNickname(int currentPage, String keyword) {
		return mapper.searchIdANDNickname(currentPage, keyword);
	}


}
