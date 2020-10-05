package com.blog.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ITlog.service.QANDAReplyService;
import com.ITlog.service.QANDA_BoardService;
import com.ITlog.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QANDA_BoardServiceTest {

	@Setter(onMethod_ = @Autowired)
	public QANDA_BoardService service;
	
	@Setter(onMethod_ = @Autowired)
	public ReplyService replyservice;
	
	@Setter(onMethod_ = @Autowired)
	public QANDAReplyService andareplyservice;
	
	@Test
	public void read() {
		andareplyservice.read(1, 121L);
	}
}
