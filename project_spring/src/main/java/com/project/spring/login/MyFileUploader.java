package com.project.spring.login;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class MyFileUploader {
	public static String uploadfile(String upLoadPath,String originalFilename,byte[] fileData)
	{
		UUID uuid=UUID.randomUUID();
		//파일데이터가 없을 경우
		if(fileData==null || fileData.equals("")) {
			return null;
		}
		String fileName=uuid+"_"+originalFilename;
		File target=new File(upLoadPath+fileName);
		
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return fileName;
	}

}
