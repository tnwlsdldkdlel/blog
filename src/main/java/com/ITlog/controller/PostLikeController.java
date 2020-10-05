package com.ITlog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ITlog.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PostLikeController {
	
	@Setter(onMethod_ = @Autowired)
	public BoardService service;
	
	@RequestMapping(value = "/like/{bno}", method = RequestMethod.POST,produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> like(@PathVariable("bno") Long bno ) {
		log.info("bno확인: " +  bno);
		service.postlikeADD(bno);
		service.postlikeCount(bno);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

}
