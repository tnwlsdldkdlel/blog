package com.blog.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.test.web.reactive.server.WebTestClient.RequestBodySpec;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private String defaultUrl;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		//로그인실패했을 경우 에러세션지우기
		HttpSession session = request.getSession(false);
		if (session == null)
			return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);

		response.sendRedirect(defaultUrl);

	}

}
