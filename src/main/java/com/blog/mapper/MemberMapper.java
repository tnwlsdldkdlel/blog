package com.blog.mapper;


import com.blog.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void insert(MemberVO vo);
	
	//회원탈퇴
	public void delete(String id);
	
	//회원수정
	public void update(MemberVO vo);
	
	//회원정보
	public MemberVO read(String id);
	

}
