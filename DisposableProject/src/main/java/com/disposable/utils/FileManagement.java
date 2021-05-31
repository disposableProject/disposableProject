package com.disposable.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import com.amazonaws.services.s3.AmazonS3Client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileManagement {

	@Autowired
	private S3Uploader S3Uploader;
	
	private static String getUuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
	
	public ArrayList FileUploader(MultipartFile[] files) throws IOException {
		ArrayList filelist = new ArrayList();
		String FileNames ="";
		S3Uploader.S3Uploader();
		  for (MultipartFile mf : files) {
			    
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);
	         // 확장자를 찾기 위한 코드
	            final String ext = originFileName.substring(originFileName.lastIndexOf('.'));
	            // 파일이름 암호화
	            final String saveFileName = getUuid() + ext;
	            
	            S3Uploader.fileUpload("cookingcoding",saveFileName,mf);
	            String safeFile =System.currentTimeMillis() + saveFileName;
	            
	            FileNames = FileNames+","+safeFile; 
	            filelist.add(saveFileName);
	            try {
	            //	File f1 = new File(filepath+safeFile);
	            //    mf.transferTo(f1);
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		
		return filelist;
	}
	
}
