package com.ITlog.security;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.ITlog.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UserDetailsService service;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String id = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
	
		
		MemberVO vo = (MemberVO) service.loadUserByUsername(id);
		System.out.println(vo.getPassword());
		if (!matchPassword(password, vo.getPassword())) {
			
			throw new BadCredentialsException(id);
		}
		
		
		// 시큐리티 태그중 principal를 사용하기 위해 -> 로그인 후 정보전달
		return new UsernamePasswordAuthenticationToken(vo, vo, vo.getAuthorities());
	}

	// ProviderManager는 AuthenticationProvider목록을 순회하면서 해결가능한지
	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

	private boolean matchPassword(String loginPwd, String password) {
		return loginPwd.equals(password);
	}

}
