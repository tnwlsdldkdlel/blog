package com.ITlog.util;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.ITlog.domain.MemberVO;
import com.ITlog.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
public class ProfileImageThumbnail {

	MultipartFile profileImage;
	
	@Setter(onMethod_ = @Autowired)
	public MemberService service;

	public ProfileImageThumbnail(MultipartFile profileImage, MemberVO vo) {
		this.profileImage = profileImage;

		String uploadFileName = "";
		String uploadFoler = "C:\\upload";
		

		log.info("-------------------------------");
		log.info("upload file name : " + profileImage.getOriginalFilename());
		log.info("upload file size :" + profileImage.getSize());

		// 증복방지를 위한 UUID적용
		UUID uuid = UUID.randomUUID();

		uploadFileName = profileImage.getOriginalFilename();

		// 파일이름에 UUID 추가
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		File saveFile = new File(uploadFoler, uploadFileName);

		try {
			profileImage.transferTo(saveFile);
			if (checkImageType(saveFile)) {
				FileOutputStream thumnail = new FileOutputStream(new File(uploadFoler, "image_" + uploadFileName));
				Thumbnailator.createThumbnail(profileImage.getInputStream(), thumnail, 161, 161);
				// vo에 이미지 이름 추가
				vo.setProfileImage("image_" + uploadFileName);
				
				thumnail.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 이미지인지 확인 메소드
	public boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

}
