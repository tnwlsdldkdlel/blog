package com.blog.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ITlog.domain.MemberVO;
import com.ITlog.domain.QANDA_BoardVO;
import com.ITlog.mapper.QANDA_BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QANDA_BoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	public QANDA_BoardMapper mapper;
	
//	@Test
//	public void insertTest() {
//		QANDA_BoardVO vo = new QANDA_BoardVO();
//		vo.setId("mj");
//		vo.setTitle("mj의 질문");
//		vo.setContent("mj내용");
//		vo.setContent_kind("HTML");
//		mapper.insert(vo);
//		log.info(vo);
//	}
//	
//	@Test
//	public void delete() {
//		mapper.delete(64L);
//	}
//	
//	@Test
//	public void update() {
//		QANDA_BoardVO vo = new QANDA_BoardVO();
//		vo.setBno(65L);
//		vo.setContent("내용을 바꿔보자");
//		vo.setContent_kind("JAVA");
//		vo.setTitle("제목을 바꿔보자");
//		mapper.update(vo);
//	}
	
	@Test
	public void readPaging() {
		mapper.readPaging(1).forEach(list -> log.info(list));
	}
}
