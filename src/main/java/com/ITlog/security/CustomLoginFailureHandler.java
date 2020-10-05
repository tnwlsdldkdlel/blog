package com.ITlog.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.ui.Model;

import lombok.Data;
import oracle.jdbc.driver.Message;

@Data
public class CustomLoginFailureHandler implements AuthenticationFailureHandler {

	private String defaultUrl;
	private String id;
	private String password;
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		session.setAttribute("error","error");
		//최대 허용 가능 중복 세션 수
		session.setMaxInactiveInterval(1);
		response.sendRedirect(defaultUrl);

	}

}
