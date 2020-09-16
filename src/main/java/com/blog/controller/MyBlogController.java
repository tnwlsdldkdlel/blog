package com.blog.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.domain.BoardVO;
import com.blog.domain.PageNation;
import com.blog.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/blog/*")
public class MyBlogController {

	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myblog")
	public String myblog(@RequestParam(defaultValue = "1") int currentPage,Model model ,Principal principal) {
		String id = (String)principal.getName();
		PageNation page = new PageNation(currentPage,boardService.listIDCount(id));
		model.addAttribute("list", boardService.listID(currentPage, id));
		model.addAttribute("page", page);
		return "/blog/myblog";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myblog/write")
	public String writeGet() {
		return "/blog/write";
	}
	
	@PostMapping("/myblog/write")
	public String write(@RequestParam("title")String title, @RequestParam("content") String content, BoardVO vo,Principal principal) {
		String id = (String)principal.getName();
		vo.setContent(content);
		vo.setId(id);
		vo.setTitle(title);
		boardService.register(vo);
		return "redirect:/blog/myblog";
	}
	
	@GetMapping("/myblog/boardContent")
	public String detail(@RequestParam("bno") Long bno,@RequestParam("page") int page ,Model model) {
		model.addAttribute("content", boardService.boardContent(bno));
		return "/blog/boardContent";
	}
	
	//댓글 삭제도 추가해주기
	@GetMapping("/myblog/boardContent/remove")
	public String remove(@RequestParam("bno") Long bno) {
		boardService.remove(bno);
		return "/blog/myblog";
	}
	
	@GetMapping("/myblog/boardContent/modified")
	public String modifiedGet(@RequestParam("bno") Long bno,Model model) {
		model.addAttribute("content", boardService.boardContent(bno));
		return "/blog/modified";
	}
	
	@PostMapping("/myblog/boardContent/modified")
	public String modified(BoardVO vo,RedirectAttributes rttr) {
		boardService.Modified(vo);
		rttr.addAttribute("bno", vo.getBno());
		return "redirect:/blog/myblog/boardContent";
	}
	
	
	
}
