package com.blog.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.domain.MemberVO;


import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
@Data
public class MemberMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	public MemberMapper mapper;
	
//	@Test
//	public void insertTest() {
//		MemberVO vo = new MemberVO();
//		vo.setId("b");
//		vo.setPassword("b");
//		vo.setNickname("b");
//		mapper.insert(vo);
//		log.info(vo);
//		
//	}
	
//	@Test
//	public void deleteTest() {
//		mapper.delete("a");
//	}
	
//	@Test
//	public void updateTest() {
//		MemberVO vo = new MemberVO();
//		vo.setId("a");
//		vo.setNickname("변경된 닉네임");
//		vo.setPassword("변경된 패스");
//		mapper.update(vo);
//		log.info(vo);
//	}
	
//	@Test
//	public void listTests() {
//		MemberVO vo = new MemberVO();
//		vo = mapper.read("a");
//		log.info(vo);
//	}
	
	@Test
	public void readTest() {
		MemberVO vo = new MemberVO();
		vo = mapper.read("d");
		
		log.info(vo.getPassword());

	}
}
