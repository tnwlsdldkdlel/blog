package com.ITlog.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ITlog.domain.PageNation;
import com.ITlog.domain.QANDA_BoardVO;
import com.ITlog.service.MemberService;
import com.ITlog.service.QANDAReplyService;
import com.ITlog.service.QANDA_BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ITlog/Q&A/*")
@Log4j
public class QANDA_BoardController {

	@Setter(onMethod_ = @Autowired)
	public QANDA_BoardService service;
	
	@Setter(onMethod_ = @Autowired)
	public QANDAReplyService replyservice;
	
	@Setter(onMethod_ = @Autowired)
	public MemberService memberservice;

	@GetMapping("/write")
	public String write() {
		return "/Q&A/write";
	}

	@PostMapping("/write")
	public String writePost(QANDA_BoardVO vo) {
		service.register(vo);
		return "redirect:/ITlog/Q&A";
	}

	@GetMapping("/content")
	public String content(@RequestParam("bno") Long bno, @RequestParam("currentPage") int currentPage, Model model,HttpServletRequest request,Principal principal) {
		
		String id = service.boardContent(bno).getId();
		model.addAttribute("writer", memberservice.Information(id));
		model.addAttribute("content", service.boardContent(bno));
		model.addAttribute("page", currentPage);
		if(principal == null) {
			request.getSession().setAttribute("currentPage", "/ITlog/Q&A/content?currentPage="+currentPage+"&bno="+bno);
		}else {
			request.getSession().setAttribute("user", memberservice.Information(principal.getName()));
		}
		return "/Q&A/content";
	}

	@GetMapping("/search")
	public String search(@RequestParam(defaultValue = "1") int currentPage, @RequestParam("rangeType") String rangeType,
			@RequestParam("keyword") String keyword, Model model,HttpServletRequest request) {
		request.getSession().setAttribute("currentPage", "/ITlog/Q&A/search");
		if (rangeType.equalsIgnoreCase("선택")) {
			return "redirect:/ITlog/Q&A";
		} else {
			PageNation page = new PageNation(currentPage, service.searchCount(rangeType, keyword));
			model.addAttribute("search", service.search(rangeType, keyword, currentPage));
			model.addAttribute("page", page);
			return "/Q&A/search";
		}

	}

	@GetMapping("/content/modified")
	public String modified(@RequestParam("currentPage") int currentPage, @RequestParam("bno") Long bno, Model model) {
		model.addAttribute("content", service.boardContent(bno));
		model.addAttribute("page", currentPage);
		return "/Q&A/modified";
	}

	@PostMapping("/content/modified")
	public String modifiedPost(@RequestParam("currentPage") int currentPage, @RequestParam("bno") Long bno,
			QANDA_BoardVO vo, RedirectAttributes attr) {
		service.Modified(vo);
		attr.addAttribute("currentPage", currentPage);
		attr.addAttribute("bno", bno);
		return "redirect:/ITlog/Q&A/content";
	}

	// 댓글 삭제도 추가해주기
	@GetMapping("/content/remove")
	public String remove(@RequestParam("currentPage") int currentPage, @RequestParam("bno") Long bno) {
		replyservice.deleteBNO(bno);
		service.remove(bno);
		return "redirect:/ITlog/Q&A/";
	}

}
