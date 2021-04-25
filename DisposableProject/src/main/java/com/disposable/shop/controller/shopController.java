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
	/**
	 * @author 손호일
	 * @description 가게 관리 선택 페이지 이동
	 */
	@RequestMapping(value="shopManagementSelect.do")
	public String shopManagementSelect() {
		System.out.println("shopManagementSelect");
		return "shop/shopManagementSelect";
	}
}
