package com.blog.security;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.blog.domain.MemberVO;
import com.blog.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class customUserDetail implements UserDetailsService{
	
	@Setter(onMethod_ = @Autowired )
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info(username);
		MemberVO vo = mapper.read(username);
	
		log.warn("read:" + vo);
		
		return vo == null ? null : vo;
		
	}

}
