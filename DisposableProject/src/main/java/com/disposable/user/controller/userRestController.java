package com.disposable.user.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.disposable.user.service.userService;

@RestController
@RequestMapping("/user")
public class userRestController {
	
	@Autowired
	private userService userservice;
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 
	 */
	@RequestMapping(value="/ceoRegisterPro.do", method=RequestMethod.POST)
	public Map<String, Object> ceoRegisterPro(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> userList = userservice.test(paramMap);
		System.out.println(userList);
		resultMap.put("JavaData", userList);
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 
	 */
	@RequestMapping(value="/ceoRegisterPro2.do", method=RequestMethod.POST)
	public Map<String, Object> ceoRegisterPro2(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> detailCodeList = null;
		
		return resultMap;
	}
}
