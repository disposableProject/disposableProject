package com.disposable.management.controller;

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

import com.disposable.management.service.managementService;
import com.disposable.utils.FileManagement;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/management")
public class managementRestController {

	@Autowired
	private managementService managementservice;
	
	@Autowired
	private FileManagement filemanagement;
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 테스트
	 */
	@RequestMapping(value="/foodInsertPro.do", method=RequestMethod.POST)
	public Map<String, Object> foodInsertPro(HttpServletRequest request,
			@RequestParam(value="foodImg", required=false) MultipartFile[] files
			,@RequestParam(value="foodData", required=false) String param) throws SQLException, Exception {
		System.out.println("files ==>"+files[0]);
		ArrayList fileNames = filemanagement.FileUploader(files);
		
		System.out.println("fileNames =>"+fileNames);
		System.out.println("param:" + param);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> paramMap = mapper.readValue(param, Map.class);

		Map <String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("options ==>"+  paramMap.get("foodOptionInfo"));
		Integer foodInsertCheck = managementservice.foodMainInsert(paramMap);
		System.out.println("options ==>"+  paramMap.get("foodOptionInfo"));
		System.out.println("foodName ==>"+ paramMap.get("foodName"));
		Integer optionInserCheck = managementservice.foodOptionInsert((List<Object>) paramMap.get("foodOptionInfo"));
		if(foodInsertCheck == 1) {
			
		}
		System.out.println("foodInserCheck =>"+foodInsertCheck);
		System.out.println(foodInsertCheck);
		resultMap.put("JavaData", foodInsertCheck);
		return resultMap;
	}
	
}
