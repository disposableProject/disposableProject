package com.disposable.management.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.disposable.management.service.managementService;

@Controller
@RequestMapping("/management")
public class managementController {
	
	@Autowired
	private managementService managementservice;
	
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
	public String managementFoods(HttpSession session,Model model) {
		System.out.println("managementFoods");
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		System.out.println("num ==>"+(Map<String, Object>) session.getAttribute("userInfo"));
		String storeNum = String.valueOf(userInfo.get("STORENUM"));
		List<Map<String,Object>> resultMap =   managementservice.storeFoodListGet(storeNum);
		model.addAttribute("foodList", resultMap);
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
	/**
	 * @author 손호일
	 * @description 음식 등록 페이지 이동
	 */
	@RequestMapping(value="foodInsert.do")
	public String foodInsert() {
		System.out.println("foodInsert");
		return "management/foodInsert";
	}
}
