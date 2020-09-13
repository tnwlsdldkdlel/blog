package com.blog.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myblog/*")
@AllArgsConstructor
@Log4j
public class MyBlogController {
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/home")
	public String myblog() {
		return "/blog/myblog";
	}

}
