package com.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.domain.MemberVO;
import com.blog.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;

@Service
@AllArgsConstructor
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

}
