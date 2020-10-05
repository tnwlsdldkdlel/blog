package com.ITlog.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.print.attribute.standard.Media;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ITlog.domain.MemberVO;
import com.ITlog.service.MemberService;
import com.ITlog.util.ProfileImageThumbnail;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ImageController {

	@Setter(onMethod_ = @Autowired)
	public MemberService service;

	@RequestMapping(method = RequestMethod.POST, value = "/myinfo/Modified/{id}")
	@ResponseBody
	public ResponseEntity<String> imageModified(MultipartFile profileImage, @PathVariable("id") String id)
			throws MultipartException {

		String dir = "C:\\upload\\";
		String removeFileName = service.Information(id).getProfileImage();
		
		 File file;
		try {
			file = new File(dir+ URLDecoder.decode(removeFileName,"UTF-8"));
			String realFileName = file.getAbsolutePath().replace("image_", "");
			 System.out.println("진짜이름:" + realFileName); 
			 file = new File(realFileName);
			 file.delete();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		 
		 
		

		MemberVO vo = new MemberVO();
		ProfileImageThumbnail thumbnail = new ProfileImageThumbnail(profileImage, vo);
		int success = service.updateImage(id, vo.getProfileImage());
		System.out.println(success);
		if (success == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

}
