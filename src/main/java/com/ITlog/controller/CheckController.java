package com.ITlog.controller;

import java.lang.management.MemoryType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ITlog.domain.MemberVO;
import com.ITlog.service.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/check/*")
public class CheckController {
	
	@Setter(onMethod_ = @Autowired)
	public MemberService memberService;
	
	@RequestMapping(value = "/id/{id}", method = RequestMethod.POST)
	public ResponseEntity<String> idCheck(@PathVariable("id") String id) {
		MemberVO vo = memberService.Information(id);
		System.out.println(id);
		System.out.println(vo);
		if(vo == null) {
			return new ResponseEntity<>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<>("fail",HttpStatus.OK);
		}
		
	}

}
