package com.disposable.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.disposable.shop.service.shopService;

@Controller
@RequestMapping("/shop")
public class shopController {
	
	@Autowired
	private shopService shopservice;
	
	@RequestMapping(value="shopMain.do")
	public String usermain(Model model,@RequestParam("shopnum") String shopnum) {
		System.out.println("user");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<Map<String,Object>> resultMap = shopservice.shopMain(shopnum);
		model.addAttribute("StoreFoodList", resultMap);
		return "shop/shop";
	}
	
}
