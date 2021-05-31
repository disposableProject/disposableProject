package com.disposable.management.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String managementFoods(HttpSession session,Model model,@RequestParam("pagenum") int pageNum) {
		System.out.println("managementFoods");
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		System.out.println("num ==>"+(Map<String, Object>) session.getAttribute("userInfo"));
		String storeNum = String.valueOf(userInfo.get("STORENUM"));
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startpagenum", (pageNum-1)*12);
		paramMap.put("endpagenum", (pageNum)*12);
		paramMap.put("storenum", storeNum);
		List<Map<String,Object>> resultMap =   managementservice.storeFoodListGet(paramMap);
		model.addAttribute("foodList", resultMap);
		
		int pageGroupNum = (int) Math.floor((pageNum - 1) / 5 + 1);
		int startPage = (pageGroupNum - 1) * 5 + 1;
		int totalCmtCnt = Integer.parseInt(String.valueOf(resultMap.get(0).get("TOTALCNT")));
		int totalPageCnt = (int) Math.floor(totalCmtCnt / 12);
		if (totalCmtCnt % 12 > 0) {
			totalPageCnt++;
		}
		int pageGroupCnt = (int) Math.floor(totalPageCnt / 5);
		if (totalPageCnt % 5 > 0) {
			pageGroupCnt++;
		}
		model.addAttribute("boardNum", storeNum);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageGroupNum", pageGroupNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("totalCmtCnt", totalCmtCnt);
		model.addAttribute("totalPageCnt", totalPageCnt);
		model.addAttribute("pageGroupCnt", pageGroupCnt);
		System.out.println("pageNum =>"+pageNum);
		System.out.println("pageGroupNum =>"+pageGroupNum);
		System.out.println("startPage =>"+startPage);
		System.out.println("totalCmtCnt =>"+totalCmtCnt);
		System.out.println("totalPageCnt =>"+totalPageCnt);
		System.out.println("pageGroupCnt =>"+pageGroupCnt);
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
