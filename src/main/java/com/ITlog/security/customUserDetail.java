package com.ITlog.security;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ITlog.domain.MemberVO;
import com.ITlog.mapper.MemberMapper;

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
		if(vo == null) {
			 throw new UsernameNotFoundException(username);
		}
		System.out.println(vo);
		return vo;
		
	}

}
