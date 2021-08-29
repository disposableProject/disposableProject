package com.disposable.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String myPage() {
		
		return "myPage/myPage";
	}
}
