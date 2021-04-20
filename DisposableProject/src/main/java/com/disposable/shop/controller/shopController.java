package com.disposable.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop")
public class shopController {
	@RequestMapping(value="shopmain.do")
	public String usermain() {
		System.out.println("user");
		return "shop/shop";
	}
}
