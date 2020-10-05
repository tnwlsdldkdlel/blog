package com.ITlog.controller;


import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ITlog.domain.MemberVO;
import com.ITlog.domain.PageNation;
import com.ITlog.service.BoardService;
import com.ITlog.service.CommunityService;
import com.ITlog.service.MemberService;
import com.ITlog.service.QANDAReplyService;
import com.ITlog.service.QANDA_BoardService;
import com.ITlog.service.ReplyService;
import com.ITlog.util.ProfileImageThumbnail;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.security.o3logon.b;

@Controller
@RequestMapping("/ITlog/*")
@AllArgsConstructor
@Log4j
public class ITlogHomeController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@Setter(onMethod_ = @Autowired)
	private QANDA_BoardService qandaService;
	
	@Setter(onMethod_ = @Autowired)
	private CommunityService commService;
	
	@Setter(onMethod_ = @Autowired)
	private QANDAReplyService qandareplyService;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;

	@GetMapping("/home")
	public String home(@RequestParam(defaultValue = "1") int currentPage, Model model, Principal principal, HttpSession session) {
		PageNation page = new PageNation(currentPage, boardService.listCount());
		model.addAttribute("bestPostList", boardService.bestPost());
		model.addAttribute("newPostList", boardService.listPaging(currentPage));
		model.addAttribute("qandalist", qandaService.listPaging(currentPage));
		model.addAttribute("commlist", commService.listPaging(currentPage));
		if(principal == null) {
			model.addAttribute("list", boardService.listPaging(currentPage));
			model.addAttribute("page", page);
			session.setAttribute("currentPage", "/ITlog/home");
			return "/home/home";
		}else {
			model.addAttribute("list", boardService.listPaging(currentPage));
			model.addAttribute("page", page);
			session.setAttribute("user", service.Information(principal.getName()));
			return "/home/home";
		}
		
	}
	
	@GetMapping("/join")
	public String joinGet() {
		return "/home/join";
	}

	@PostMapping("/join")
	public String join(@RequestParam("id")String id,@RequestParam("password")String password,@RequestParam("nickName")String nickName,MultipartFile profileImage, Model model) throws Exception{
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setNickname(nickName);
		ProfileImageThumbnail pfthumnail = new ProfileImageThumbnail(profileImage, vo);
		int success = service.join(vo);
		if(success != 1) {
			return "redirect:/home/join";
		}
		model.addAttribute("join", "join");
		return "redirect:/ITlog/home";
	}

	@GetMapping("/logout")
	public String logoutGet() {
		return "/home/logout";
	}

	@GetMapping("/search")
	public String searchPost(@RequestParam(defaultValue = "1") int currentPage, @RequestParam("keyword") String keyword,
			@RequestParam("rangeType") String rangeType, Model model) {
		log.info(rangeType);
		if (rangeType.equals("text")) {
			model.addAttribute("text", boardService.searchContent(currentPage, keyword));
			return "/blog/post";
		} else if (rangeType.equals("idANDnickname")) {
			model.addAttribute("idANDnickname", service.searchIdANDNickname(currentPage, keyword));
			return "/blog/nickAndId";
		}
		return null;

	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myblog")
	public String myblog(@RequestParam(defaultValue = "1") int currentPage, Model model, Principal principal) {
		String id = (String) principal.getName();
		PageNation page = new PageNation(currentPage, boardService.listIDCount(id));
		model.addAttribute("list", boardService.listID(currentPage, id));
		model.addAttribute("page", page);
		return "/blog/myblog";
	}
	
	@GetMapping("/Q&A")
	public String qanda(@RequestParam(defaultValue = "1")int currentPage ,Model model,HttpServletRequest request,Principal principal) {
		PageNation page = new PageNation(currentPage, qandaService.listCount());
		model.addAttribute("list", qandaService.listPaging(currentPage));
		model.addAttribute("reply", qandareplyService.replyInfo());
		model.addAttribute("page", page);
		
		if(principal == null) {
			request.getSession().setAttribute("currentPage", "/ITlog/Q&A");
		}else {
			request.getSession().setAttribute("user", service.Information(principal.getName()));
		}
		return "/Q&A/Q&A";
		
	}
	
	@GetMapping("/community")
	public String community(@RequestParam(defaultValue = "1")int currentPage, Model model,HttpServletRequest request,Principal principal) {
		
		PageNation page = new PageNation(currentPage, commService.listCount());
		request.getSession().setAttribute("currentPage", "/ITlog/community");
		model.addAttribute("list", commService.listPaging(currentPage));
		model.addAttribute("page", page);
		if(principal == null) {
			request.getSession().setAttribute("currentPage", "/ITlog/community");
		}else {
			request.getSession().setAttribute("user", service.Information(principal.getName()));
		}
		
		return "/community/community";
	}
	
	@GetMapping("/blog")
	public String blog(@RequestParam(defaultValue = "1") int currentPage, Model model,HttpServletRequest request) {
		PageNation page = new PageNation(currentPage, boardService.listCount());
		boardService.profileImageUpdate();
		request.getSession().setAttribute("currentPage", "/ITlog/community");
		System.out.println(boardService.listPaging(currentPage));
		model.addAttribute("list", boardService.listPaging(currentPage));
		model.addAttribute("page", page);
		model.addAttribute("memberInfo",service.allInfo());
		return "/blog/blog";
	}
	
	@GetMapping("/blog/{id}")
	public String idBlog(@RequestParam(defaultValue = "1") int currentPage,@PathVariable("id") String id, Model model,HttpServletRequest request) {
		PageNation page = new PageNation(currentPage, boardService.listIDCount(id));
		request.getSession().setAttribute("currentPage", "/ITlog/community");
		model.addAttribute("list", boardService.listID(currentPage, id));
		model.addAttribute("page", page);
		model.addAttribute("blogowner", service.Information(id));
		return "/blog/visitblog";
	}
	
	@PostMapping("/myinfoManagement")
	public String myinfoModified(@ModelAttribute MemberVO vo,Model model){
		int success = service.Modified(vo);
		if(success != 1) {
			model.addAttribute("error", "error");
			return "/ITlog/myblog/myinfoManagement";
		}
		return "redirect:/ITlog/home";
	}
	
	
	
	

	

}
