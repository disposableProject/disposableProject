package com.disposable.shop.controller;

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

import com.disposable.shop.service.shopService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/shop")
public class shopRestController {

	@Autowired
	private shopService shopservice;
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 음식 옵션 목록 가져오기
	 */

	@RequestMapping(value="/getFoodOption.do", method=RequestMethod.POST)
	public List<Map<String,Object>> getFoodOption(HttpServletRequest request,@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		List<Map<String,Object>> resultMap = shopservice.getFoodOption(paramMap);
		return resultMap;
	}
}
