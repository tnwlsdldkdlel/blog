package com.ITlog.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ITlog.domain.BoardVO;
import com.ITlog.service.BoardService;
import com.ITlog.service.MemberService;
import com.ITlog.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
public class BlogController {

	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
		
	@GetMapping("/ITlog/myinfoManagement")
	public String myinfoManagement(HttpSession session) {
		session.getAttribute("user");
		return "/blog/myinfoManagement";
	}
	
	@GetMapping("/ITlog/blog/{id}/boardContent")
	public String detail(@RequestParam("bno") Long bno,@PathVariable("id") String id, Model model) {
		model.addAttribute("writer", memberService.Information(id));
		model.addAttribute("content", boardService.boardContent(bno));
		model.addAttribute("bestPostList", boardService.bestPost());
		return "/blog/Blog_boardContent";
	}
	



}
