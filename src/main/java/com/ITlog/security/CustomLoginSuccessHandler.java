package com.ITlog.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.test.web.reactive.server.WebTestClient.RequestBodySpec;

import com.ITlog.domain.MemberVO;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private String defaultUrl;
	private String id;

	@Autowired
	private UserDetailsService service;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		} else {
			String redirectUrl = (String) session.getAttribute("currentPage");
			if (redirectUrl != null) {
				session.removeAttribute("currentPage");
				response.sendRedirect(redirectUrl);
			} else {
				response.sendRedirect(defaultUrl);
			}
			
			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
			session.removeAttribute("error");
		}

	}

}
