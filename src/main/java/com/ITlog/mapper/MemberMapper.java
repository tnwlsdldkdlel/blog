package com.ITlog.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ITlog.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public int insert(MemberVO vo);
	
	//회원탈퇴
	public void delete(String id);
	
	//회원수정
	public int update(MemberVO vo);
	
	//회원정보
	public MemberVO read(String id);
	
	//회원검색
	public List<MemberVO> searchIdANDNickname(@Param("currentPage")int currentPage, @Param("keyword")String keyword);
	
	//이미지수정
	public int updateImage(@Param("id") String id, @Param("profileImage") String profileImage);
	
	//모든 회원 정보
	public List<MemberVO> allInfo();
	

}
