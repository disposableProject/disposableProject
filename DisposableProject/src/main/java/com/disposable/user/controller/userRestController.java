package com.disposable.user.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@Autowired
	HttpServletRequest request;
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
		System.out.println("왔니");
		System.out.println("paramMap:" + paramMap);
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
	 * @description  사장님 아이디 중복 체크
	 */

	@RequestMapping(value="/checkUserId.do", method=RequestMethod.POST)
	public Map<String, Object> checkUserId(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		int userCheck = userservice.checkUserId(paramMap);
		resultMap.put("JavaData", userCheck);
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description  사장님 이메일 중복 체크
	 */
	@RequestMapping(value="/checkEmail.do", method=RequestMethod.POST)
	public Map<String, Object> checkEmail(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		int emailCheck = userservice.checkEmail(paramMap);
		
		if(emailCheck == 0) {
			userservice.emailauth(paramMap);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		
		return resultMap;
	}
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description  사장님 이메일 인증 확인
	 */
	@RequestMapping(value="/emailAuth.do", method=RequestMethod.POST)
	public Map<String, Object> emailAuth(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		String authNum = (String) paramMap.get("authNum");
		HttpSession session = request.getSession();	
		String sessionAuth = (String)session.getAttribute("authNum");
		System.out.println("sessionAuth ==>"+sessionAuth);
		System.out.println("authNum ==>"+authNum);
		if(authNum.equals(sessionAuth)) {
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}
}
