package com.ITlog.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ITlog.domain.QANDA_BoardVO;
import com.ITlog.domain.communityVO;
import com.ITlog.service.CommunityReplyService;
import com.ITlog.service.CommunityService;
import com.ITlog.service.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/ITlog/community/*")
public class CommunityController {

	@Setter(onMethod_ = @Autowired )
	public CommunityService service;
	
	@Setter(onMethod_ = @Autowired )
	public CommunityReplyService replyservice;
	
	@Setter(onMethod_ = @Autowired )
	public MemberService memberservice;
	
	@GetMapping("/write")
	public String write() {
		return "/community/write";
	}
	
	@PostMapping("/write")
	public String writePost(communityVO vo) {
		service.register(vo);
		return "redirect:/ITlog/community";
	}
	
	@GetMapping("/content")
	public String content(@RequestParam("bno") Long bno, @RequestParam("currentPage") int currentPage, Model model) {
		String id = service.boardContent(bno).getId();
		model.addAttribute("writer", memberservice.Information(id));
		model.addAttribute("content", service.boardContent(bno));
		model.addAttribute("page", currentPage);
		return "/community/content";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam(defaultValue = "1") int currentPage,@RequestParam("keyword") String keyword,Model model) {
		model.addAttribute("search", service.searchContent(currentPage, keyword));
		return "/community/search";
	}
	
	@GetMapping("/content/modified")
	public String modified(@RequestParam("currentPage") int currentPage, @RequestParam("bno") Long bno, Model model) {
		model.addAttribute("content", service.boardContent(bno));
		model.addAttribute("page", currentPage);
		return "/community/modified";
	}

	@PostMapping("/content/modified")
	public String modifiedPost(@RequestParam("currentPage") int currentPage, @RequestParam("bno") Long bno,
			communityVO vo, RedirectAttributes attr) {
		service.Modified(vo);
		attr.addAttribute("currentPage", currentPage);
		attr.addAttribute("bno", bno);
		return "redirect:/ITlog/community/content";
	}

	// 댓글 삭제도 추가해주기
	@GetMapping("/content/remove")
	public String remove(@RequestParam("currentPage") int currentPage, @RequestParam("bno") Long bno) {
		replyservice.deleteBNO(bno);
		service.remove(bno);
		return "redirect:/ITlog/community";
	}
	
}
