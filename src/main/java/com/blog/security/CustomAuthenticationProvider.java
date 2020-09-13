package com.blog.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.blog.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAuthenticationProvider implements AuthenticationProvider {
    
    @Autowired
    private UserDetailsService service;
 
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
    	
    	log.info("success");
        
        String id = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        
       MemberVO vo = (MemberVO)service.loadUserByUsername(id);
       
        
        if(!matchPassword(password, vo.getPassword())) {
            throw new BadCredentialsException(id);
        }
        return new UsernamePasswordAuthenticationToken(id, password, vo.getAuthorities());
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
    
    private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }
 
}

