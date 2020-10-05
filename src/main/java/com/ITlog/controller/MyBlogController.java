package com.ITlog.controller;

import java.io.File;
import java.security.Principal;
import java.security.Provider.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ITlog.domain.BoardVO;
import com.ITlog.domain.MemberVO;
import com.ITlog.domain.PageNation;
import com.ITlog.service.BoardService;
import com.ITlog.service.MemberService;
import com.ITlog.service.ReplyService;
import com.ITlog.util.ProfileImageThumbnail;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ITlog/myblog/*")
public class MyBlogController {

	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
		
	@GetMapping("/myinfoManagement")
	public String myinfoManagement(HttpSession session) {
		session.getAttribute("user");
		return "/blog/myinfoManagement";
	}
	
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public String writeGet() {
		return "/blog/write";
	}
	
	@PostMapping("/write")
	public String write(BoardVO vo,Principal principal) {
		String id = (String)principal.getName();
		vo.setId(id);
		boardService.register(vo);
		
		return "redirect:/ITlog/myblog";
	}
	
	@GetMapping("/boardContent")
	public String detail(@RequestParam("page") int page ,@RequestParam("bno") Long bno, Model model) {
		boardService.profileImageUpdate();
		model.addAttribute("content", boardService.boardContent(bno));
		model.addAttribute("page", page);
		return "/blog/boardContent";
	}
	
	//댓글 삭제도 추가해주기
	@GetMapping("/content/remove")
	public String remove(@RequestParam("bno") Long bno) {
		replyService.deleteBNO(bno);
		boardService.remove(bno);
		return "redirect:/ITlog/myblog";
	}
	
	@GetMapping("/content/modified")
	public String modifiedGet(@RequestParam("page")int page,@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("content", boardService.boardContent(bno));
		model.addAttribute("page", page);
		return "/blog/modified";
	}
	
	@PostMapping("/content/modified")
	public String modified(@RequestParam("page") int page,@RequestParam("bno") Long bno, BoardVO vo, RedirectAttributes rttr) {
		boardService.Modified(vo);
		rttr.addAttribute("bno", bno);
		rttr.addAttribute("page", page);
		return "redirect:/ITlog/myblog/boardContent";
	}
	

	
}
