package com.disposable.test;

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
}
