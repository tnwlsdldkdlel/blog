package com.ITlog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.ITlog.domain.MemberVO;
import com.ITlog.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;

@Service
public class MemberServicelmpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	//회원가입
	@Override
	public int join(MemberVO vo) {
		return mapper.insert(vo);
	}

	//회원탈퇴
	@Override
	public void secession(String id) {
		mapper.delete(id);

	}

	//회원수정
	@Override
	public int Modified(MemberVO vo) {
		return mapper.update(vo);

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

	@Override
	public int updateImage(String id, String profileImage) {
		return mapper.updateImage(id, profileImage);
	}

	@Override
	public List<MemberVO> allInfo() {
		return mapper.allInfo();
	}


}
