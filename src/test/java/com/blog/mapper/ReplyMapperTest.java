package com.blog.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ITlog.domain.CommunityReplyVO;
import com.ITlog.domain.ReplyVO;
import com.ITlog.mapper.CommunityReplyMapper;
import com.ITlog.mapper.QANDAReplyMapper;
import com.ITlog.mapper.ReplyMapper;
import com.ITlog.mapper.communityMapper;
import com.ITlog.service.QANDAReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {
	
	@Setter(onMethod_ = @Autowired )
	private CommunityReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired )
	private QANDAReplyMapper qandamapper;
	
//	@Test
//	public void insertTest() {
//		ReplyVO vo = new ReplyVO();
//		vo.setBno(58L);
//		vo.setId("d");
//		vo.setContent("좋은정보 감사합니다!");
//		mapper.insert(vo);
//		log.info(vo);
//	}
//	
//	@Test
//	public void deleteTest() {
//		mapper.delete(1L);
//	}
	
//	@Test
//	public void updateTest() {
//		ReplyVO vo = new ReplyVO();
//		vo.setContent("나쁜 정보 감사합니다!");
//		vo.setRno(3L);
//		mapper.update(vo);
//	}
	
//	@Test
//	public void readTest() {
//		mapper.read(1, 7L).forEach(list -> log.info("list"));
//	}
	
	/*
	 * @Test public void insertTest() { CommunityReplyVO vo = new
	 * CommunityReplyVO(); vo.setId("v"); vo.setContent("첫 댓글!!"); int count =
	 * mapper.insert(vo); log.info(count); }
	 */
	
	@Test
	public void readTest(){
		qandamapper.read(1, 121L).forEach(list -> log.info(list));
	}
	
	
}
