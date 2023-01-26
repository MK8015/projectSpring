package com.project.spring.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class ImageUploader {
	public static String uploadFile(
			String uploadPath, String originalFilename, byte[] fileData) {
		UUID uuid = UUID.randomUUID();
		if(fileData==null || originalFilename.equals("")) {
			return null;
		}
		String saveFilename = uuid + "_" + originalFilename;
		File target = new File(uploadPath + "/" + saveFilename);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
}
