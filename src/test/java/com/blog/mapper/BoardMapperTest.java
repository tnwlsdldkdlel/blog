package com.blog.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ITlog.domain.BoardVO;
import com.ITlog.domain.MemberVO;
import com.ITlog.domain.PageNation;
import com.ITlog.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
//	@Test
//	public void insertTest() {
//		BoardVO vo = new BoardVO();
//		
//		vo.setId("a");
//		vo.setTitle("c제목");
//		vo.setContent("c내용");
//		mapper.insert(vo);
//		log.info(vo);
//	}
	
//	@Test
//	public void deleteTest() {
//		mapper.delete(5L);
//	}
	
//	@Test
//	public void updateTest() {
//		BoardVO vo = new BoardVO();
//		vo.setBno(3L);
//		vo.setTitle("제목변경");
//		vo.setContent("내용변경");
//		mapper.update(vo);
//		log.info(vo);
//	}
//	
//	@Test
//	public void readTest() {
//		mapper.read().forEach(board-> log.info(board));
//
//	}
	

//	@Test
//	public void readCountTest() {
//		mapper.readID(1, "a").forEach(list -> log.info(list));
//	
//	}
	
//	@Test
//	public void readContent() {
//		mapper.readContent(81L).forEach(list -> log.info(list));
//	}
//	
	/*
	 * @Test public void search() { mapper.readID(2, "d", 5).forEach(list ->
	 * log.info(list)); }
	 */
	
	@Test
	public void test() {
		mapper.readID(1, "test1").forEach(list -> log.info(list));
	}
	
	
		
}
