package com.disposable.test;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.disposable.utils.FileManagement;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/test")
public class testController {
	
	@Autowired
	private FileManagement filemanagement;
	
	@RequestMapping(value="/testPro.do", method=RequestMethod.POST)
	public String testPro(testDto td) throws SQLException, Exception {
		System.out.println(td.getTest1());
		System.out.println(td.getTest2());
		ArrayList fileNames = filemanagement.FileUploader(td.getTest3());
		return "ok";
	}
	
	/**
	 * @param requestMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @description 글 작성
	 */
	
	@RequestMapping(value="WriteBoard.do", method=RequestMethod.POST)
	public  Map<String,Object> WriteBoard (HttpServletRequest request,
			@RequestParam(value="file", required=false) MultipartFile[] files
			,@RequestParam(value="tag", required=false) String tag
            ,@RequestParam(value="comment", required=false) String comment) throws SQLException  {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		String FileNames ="";
		System.out.println("paramMap =>"+files[0]);
		System.out.println("paramMap =>"+tag);
		System.out.println("paramMap =>"+comment);
		String filepath = "C:/cookingapp/churchfront/public/image/saveFolder/";
		   for (MultipartFile mf : files) {
			   
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	            String safeFile =System.currentTimeMillis() + originFileName;
	            
	            FileNames = FileNames+","+safeFile; 
	            try {
	            	File f1 = new File(filepath+safeFile);
	                mf.transferTo(f1);
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		Map<String, Object> paramMap = new HashMap<String, Object>();
		FileNames = FileNames.substring(1);
		System.out.println("FileNames =>"+ FileNames);
		paramMap.put("comment", comment);
		paramMap.put("FileNames", FileNames);
		paramMap.put("tag", tag);
		resultMap.put("JavaData", paramMap);
		return resultMap;
	}
}
