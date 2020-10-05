package com.ITlog.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ITlog.domain.MemberVO;

public interface MemberService {

	// 회원가입
	public int join(MemberVO vo);

	// 회원탈퇴
	public void secession(String id);

	// 회원수정
	public int Modified(MemberVO vo);

	// 회원정보
	public MemberVO Information(String id);

	// 회원검색
	public List<MemberVO> searchIdANDNickname(int currentPage, String keyword);

	// 이미지수정
	public int updateImage(String id, String profileImage);

	// 모든 회원 정보
	public List<MemberVO> allInfo();
}
