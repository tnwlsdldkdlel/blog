package com.blog.service;

import com.blog.domain.MemberVO;

import lombok.Data;

public interface MemberService {
	
	//회원가입
	public void join(MemberVO vo);
	
	//회원탈퇴
	public void secession(String id);
	
	//회원수정
	public void Modified(MemberVO vo);
	
	//회원정보
	public MemberVO Information(String id);
	

}
