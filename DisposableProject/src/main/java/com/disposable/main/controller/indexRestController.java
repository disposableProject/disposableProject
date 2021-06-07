package com.disposable.main.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.disposable.main.service.indexService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class indexRestController {
	@Autowired
	private indexService indexservice;
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 식당목록
	 */
	@RequestMapping(value="/getStoreList.do", method=RequestMethod.POST)
	public List<Map<String,Object>> getStoreList(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println("getStoreList ==>"+paramMap);
		int startPage = (Integer.parseInt((String)paramMap.get("page"))-1) * 12;
		int endPage = startPage + 13;
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		List<Map<String,Object>> resultMap = indexservice.storeList(paramMap);
		return resultMap;
	}
	
}
