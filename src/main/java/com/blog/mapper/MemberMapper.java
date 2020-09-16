package com.blog.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	//회원검색
	public List<MemberVO> searchIdANDNickname(@Param("currentPage")int currentPage, @Param("keyword")String keyword);
	

}
