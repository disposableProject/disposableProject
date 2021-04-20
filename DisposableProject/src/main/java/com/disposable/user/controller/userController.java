package com.disposable.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class userController {
	@RequestMapping(value="usermain.do")
	public String usermain() {
		System.out.println("user");
		return "user/user";
	}
}
