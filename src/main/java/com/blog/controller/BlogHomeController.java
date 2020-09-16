package com.blog.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.domain.PageNation;
import com.blog.mapper.MemberMapper;
import com.blog.security.customUserDetail;
import com.blog.domain.MemberVO;
import com.blog.service.BoardService;
import com.blog.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Methods;
import oracle.jdbc.proxy.annotation.Post;

/**
 * @author admin
 *
 */
@Controller
@RequestMapping("/blog/*")
@AllArgsConstructor
@Log4j
public class BlogHomeController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;

	@GetMapping("/home")
	public String home(@RequestParam(defaultValue = "1") int currentPage, Model model) {
		PageNation page = new PageNation(currentPage, boardService.listCount());
		model.addAttribute("list", boardService.listPaging(currentPage));
		model.addAttribute("page", page);
		return "/blog/home";
	}

	@GetMapping("/login")
	public String loginGet() {
		return "/blog/login";
	}

	@GetMapping("/join")
	public String joinGet() {
		return "/blog/join";
	}

	@PostMapping("/join")
	public String join(@RequestParam("id") String id, @RequestParam("password") String password,
			@RequestParam("nickname") String nickname) {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setNickname(nickname);
		service.join(vo);
		return "/blog/home";
	}

	@GetMapping("/logout")
	public String logoutGet() {
		return "/blog/logout";
	}

	@GetMapping("/search/Post")
	public String searchPost(@RequestParam(defaultValue = "1") int currentPage, @RequestParam("keyword") String keyword,
			@RequestParam("rangeType") String rangeType, RedirectAttributes rttr) {
		rttr.addFlashAttribute("text", boardService.searchContent(currentPage, keyword));
		return "/blog/post";

	}

	@GetMapping("/search/NickAndId")
	public String searchGet(@RequestParam(defaultValue = "1") int currentPage, @RequestParam("keyword") String keyword,
			@RequestParam("rangeType") String rangeType, RedirectAttributes rttr) {
		rttr.addFlashAttribute("text", service.searchIdANDNickname(currentPage, keyword));
		return "/blog/nickAndId";

	}

}
