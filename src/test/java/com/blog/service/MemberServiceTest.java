package com.blog.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTest {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
//	@Test
//	public void joinTest() {
//		MemberVO vo = new MemberVO();
//		vo.setId("c");
//		vo.setNickname("c");
//		vo.setPassword("c");
//		service.join(vo);
//		log.info(vo);
//	}
	
//	@Test
//	public void secessionTest() {
//		service.secession("b");
//	}
	
//	@Test
//	public void ModifiedTest() {
//		MemberVO vo = new MemberVO();
//		vo.setId("c");
//		vo.setNickname("c닉네임");
//		vo.setPassword("c비밀번호");
//		service.Modified(vo);
//	}
//	
	@Test
	public void InformationTest() {
		service.searchIdANDNickname(1, "i");
	} 
	
	
}
