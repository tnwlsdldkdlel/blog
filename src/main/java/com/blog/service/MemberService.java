package com.blog.service;


import java.util.List;

import com.blog.domain.MemberVO;

public interface MemberService {

	// 회원가입
	public void join(MemberVO vo);

	// 회원탈퇴
	public void secession(String id);

	// 회원수정
	public void Modified(MemberVO vo);

	// 회원정보
	public MemberVO Information(String id);

	// 회원검색
	public List<MemberVO> searchIdANDNickname(int currentPage, String keyword);
}
