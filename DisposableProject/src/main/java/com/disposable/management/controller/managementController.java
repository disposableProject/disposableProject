package com.disposable.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/management")
public class managementController {
	/**
	 * @author 손호일
	 * @description 가게 관리 메인 페이지 이동
	 */
	@RequestMapping(value="managementMain.do")
	public String managementMain() {
		System.out.println("managementMain");
		return "management/managementMain";
	}
	/**
	 * @author 손호일
	 * @description 가게 정보 관리 페이지 이동
	 */
	@RequestMapping(value="shopInfo.do")
	public String shopInfo() {
		System.out.println("shopInfo");
		return "management/shopInfo";
	}
	/**
	 * @author 손호일
	 * @description 가게 음식 등록 및 수정 페이지 이동
	 */
	@RequestMapping(value="managementFoods.do")
	public String managementFoods() {
		System.out.println("managementFoods");
		return "management/managementFoods";
	}
	/**
	 * @author 손호일
	 * @description 가게 주문 관리 페이지 이동
	 */
	@RequestMapping(value="managementOrders.do")
	public String managementOrders() {
		System.out.println("managementOrders");
		return "management/managementOrders";
	}
}
