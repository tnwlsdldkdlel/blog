package com.ITlog.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.NonFinal;

@Data
@NoArgsConstructor
public class MemberVO implements UserDetails {
	
	private String id;
	private String password;
	private String nickname;
	private Date joindate;
	private String blog_name;
	private String blog_itroduction;
	private String profileImage;
	private String auth;
	
	
	@Override
	public  Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority(auth));
		return authority;
	}
	@Override
	public String getUsername() {
		return this.id;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return false;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return false;
	}
	@Override
	public boolean isEnabled() {
		return false;
	}
	
	//수정 생성자
	public MemberVO(String id, String password, String nickname, String blog_name, String blog_itroduction,
			String profileImage) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.blog_name = blog_name;
		this.blog_itroduction = blog_itroduction;
		this.profileImage = profileImage;
	}
	public MemberVO(String id, String password, String nickname, Date joindate, String blog_name,
			String blog_itroduction, String profileImage, String auth) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.joindate = joindate;
		this.blog_name = blog_name;
		this.blog_itroduction = blog_itroduction;
		this.profileImage = profileImage;
		this.auth = auth;
	}
	
	
	
	
	
	
}
