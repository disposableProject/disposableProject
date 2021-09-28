package com.disposable.myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.disposable.myPage.service.myPageService;

@Controller
@RequestMapping("/myPage")
public class myPageController {
	
	@Autowired
	private myPageService mypageservice;
	
	/**
	 * @author 정연우
	 * @description 마이페이지 이동
	 */
	@RequestMapping(value="myPage.do")
	public String myPage(HttpSession session,Model model) {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		String email = String.valueOf(userInfo.get("EMAIL"));
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		List<Map<String, Object>> userOrderList =  mypageservice.userOrderList(paramMap);
		model.addAttribute("userOrderList", userOrderList);
		return "myPage/myPage";
	}
	
	
	@RequestMapping(value="myorderList.do")
	public String myorderList() {
		System.out.println("myorderList");
		return "myPage/myorderList";
	}
	
	@RequestMapping(value="myInfo.do")
	public String myInfo() {
		System.out.println("myInfo");
		return "myPage/myInfo";
	}
}
