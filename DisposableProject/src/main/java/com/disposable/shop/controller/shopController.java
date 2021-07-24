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
	public String usermain(Model model,@RequestParam("shopnum") String shopnum,@RequestParam("device") String device) {
		System.out.println("user");
		List<Map<String,Object>> resultMap = shopservice.shopMain(shopnum);
		List<Map<String,Object>> resultMap2 = shopservice.getStoreInfo(shopnum);
		System.out.println("resultMap>>>>>>>>>>>>>>>>>>>>" + resultMap);
		System.out.println("resultMap>>>>>>>>>>>>>>>>>>>>" + resultMap2);
		model.addAttribute("StoreFoodList", resultMap);
		model.addAttribute("getStoreInfo", resultMap2);
		System.out.println("device ==>"+device);
		if(device.equals("mobile")) {
			System.out.println("check1");
			return "mobile/shop/shop";
		}else {
			return "shop/shop";
		}
		
	}
	
	
}
