package com.blog.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.domain.PageNation;
import com.blog.domain.MemberVO;
import com.blog.service.BoardService;
import com.blog.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/blog/*")
@AllArgsConstructor
@Log4j
public class BlogController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
//	Criteria cri = new Criteria();
	
	@GetMapping("/home")
	public String home(@RequestParam(defaultValue = "1") int currentPage, Model model) {
		PageNation page = new PageNation(currentPage, boardService.listCount());
		model.addAttribute("list", boardService.listPaging(currentPage));
		model.addAttribute("page", page );
		return "/blog/home";
	}
	
	@GetMapping("/login")
	public String loginGet() {
		return "/blog/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("id")String id, @RequestParam("password") String password) {
		MemberVO vo = new MemberVO();
		vo = service.Information(id);
		if(!vo.getPassword().equals(password)) {
			log.info("로그인 실패");
			return null;
		}else {
			log.info("로그인 성공");
			return "/blog/home";
		}
	}
	
	@GetMapping("/join")
	public String joinGet() {
		return "/blog/join";
	}
	
	@PostMapping("join")
	public String join(@RequestParam("id")String id, @RequestParam("password") String password, @RequestParam("nickname")String nickname) {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setNickname(nickname);
		service.join(vo);
		return "/blog/home";
	}

}
