package com.ITlog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ITlog.domain.CommunityPageNation;
import com.ITlog.domain.CommunityReplyVO;
import com.ITlog.domain.PageNation;
import com.ITlog.domain.QANDAReplyPageNation;
import com.ITlog.domain.QANDAReplyVO;
import com.ITlog.domain.ReplyPageNation;
import com.ITlog.domain.ReplyVO;
import com.ITlog.mapper.communityMapper;
import com.ITlog.service.BoardService;
import com.ITlog.service.CommunityReplyService;
import com.ITlog.service.QANDAReplyService;
import com.ITlog.service.QANDA_BoardService;
import com.ITlog.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reply/*")
@Log4j
public class ReplyController {

	@Setter(onMethod_ = @Autowired)
	private ReplyService service;

	@Setter(onMethod_ = @Autowired)
	private QANDAReplyService QANDAservice;

	@Setter(onMethod_ = @Autowired)
	private CommunityReplyService commservice;
	
	@Setter(onMethod_ = @Autowired)
	private QANDA_BoardService qandaboardservice;
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardservice;
	
	@Setter(onMethod_ = @Autowired)
	private communityMapper commBoardservice;
	
	

	// 댓글작성하기
	@PostMapping(value = "/write", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> replywrite(@RequestBody ReplyVO vo) {

		log.info(vo.getBno());
		log.info(vo.getId());
		log.info(vo.getContent());
		int success = service.insert(vo);
		if (success == 1) {
			boardservice.replyUpdate();
			return new ResponseEntity<>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// QANDA댓글작성하기
	@PostMapping(value = "/QANDAwrite", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> QANDAwrite(@RequestBody QANDAReplyVO vo) {
		
		log.info(vo.getBno());
		log.info(vo.getId());
		log.info(vo.getContent());
		int success = QANDAservice.insert(vo);
		if (success == 1) {
			//댓글 업데이트
			qandaboardservice.replyUpdate();
			return new ResponseEntity<>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// community댓글작성하기
	@PostMapping(value = "/communitywrite", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> communitywrite(@RequestBody CommunityReplyVO vo) {
		
		int success = commservice.insert(vo);
		if (success == 1) {
			commBoardservice.replyUpdate();
			return new ResponseEntity<>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글목록 가져오기
	@GetMapping(value = "/list/{currentPage}/{bno}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageNation> replyList(@PathVariable("currentPage") int currentPage,
			@PathVariable("bno") Long bno) {
		return new ResponseEntity<>(service.read(currentPage, bno), HttpStatus.OK);
	}

	// QANDA댓글목록 가져오기
	@GetMapping(value = "/QANDAlist/{currentPage}/{bno}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<QANDAReplyPageNation> QANDAlist(@PathVariable("currentPage") int currentPage,
			@PathVariable("bno") Long bno) {
		return new ResponseEntity<>(QANDAservice.read(currentPage, bno), HttpStatus.OK);
	}

	// community댓글목록 가져오기
	@GetMapping(value = "/communitylist/{currentPage}/{bno}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<CommunityPageNation> communitylist(@PathVariable("currentPage") int currentPage,
			@PathVariable("bno") Long bno) {
		return new ResponseEntity<>(commservice.read(currentPage, bno), HttpStatus.OK);
	}

	// 댓글 삭제하기
	@DeleteMapping(value = "/remove/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> replyRemove(@PathVariable("rno") Long rno) {
		int success = service.deleteRNO(rno);
		if (success == 1) {
			boardservice.replyUpdate();
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// QANDA댓글 삭제하기
	@DeleteMapping(value = "/QANDAremove/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> QANDAremove(@PathVariable("rno") Long rno) {
		int success = QANDAservice.deleteRNO(rno);
		if (success == 1) {
			//업데이트
			qandaboardservice.replyUpdate();
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// community댓글 삭제하기
	@DeleteMapping(value = "/communityremove/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> communityremove(@PathVariable("rno") Long rno) {
		int success = commservice.deleteRNO(rno);
		if (success == 1) {
			commBoardservice.replyUpdate();
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 댓글수정하기
	@RequestMapping(method = { RequestMethod.PATCH,
			RequestMethod.PUT }, value = "/modify/{rno}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public @ResponseBody ResponseEntity<String> replyModify(@RequestBody ReplyVO vo, @PathVariable Long rno) {
		vo.setRno(rno);
		int success = service.update(vo);
		log.info("success:" + success);
		log.info("content:" + vo.getContent());
		log.info("content:" + vo.getRno());
		if (success == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// QANDA댓글수정하기
	@RequestMapping(method = { RequestMethod.PATCH,
			RequestMethod.PUT }, value = "/QANDAmodify/{rno}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public @ResponseBody ResponseEntity<String> QANDAmodify(@RequestBody QANDAReplyVO vo, @PathVariable Long rno) {
		int success = QANDAservice.update(vo);
		if (success == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// community댓글수정하기
	@RequestMapping(method = { RequestMethod.PATCH,
			RequestMethod.PUT }, value = "/communitymodify/{rno}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public @ResponseBody ResponseEntity<String> communitymodify(@RequestBody CommunityReplyVO vo, @PathVariable Long rno) {
		int success = commservice.update(vo);
		if (success == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 채택
	@RequestMapping(method = {RequestMethod.POST}, value = "/replylike/{rno}")
	public ResponseEntity<String> replylike(@PathVariable("rno") Long rno){
		int success = QANDAservice.selection(rno);
		System.out.println("success:" + success);
		if (success == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

}
