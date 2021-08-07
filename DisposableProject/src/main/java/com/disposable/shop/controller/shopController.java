package com.disposable.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String shopMain(Model model,@RequestParam("shopnum") String shopnum,@RequestParam("device") String device) {
		System.out.println("user");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("storenum", shopnum);
		List<Map<String,Object>> resultMap = shopservice.shopMain(paramMap);
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
	@RequestMapping(value="MobileOptionSelect.do")
	public String MobileOptionSelect(Model model,@RequestParam("shopnum") String shopnum,@RequestParam("foodnum") String foodnum) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("storenum", shopnum);
		paramMap.put("foodnum", foodnum);
		List<Map<String,Object>> resultMap = shopservice.getFoodOption(paramMap);
		List<Map<String,Object>> resultMap2 = shopservice.getStoreInfo(shopnum);
		List<Map<String,Object>> resultMap3 = shopservice.shopMain(paramMap);
		model.addAttribute("FoodOptionList", resultMap);
		model.addAttribute("getStoreInfo", resultMap2);
		model.addAttribute("getFoodInfo", resultMap3);
		return "mobile/shop/MobileOptionSelect";
		
		
	}
	@RequestMapping(value="orderPayment.do")
	public String orderPayment(HttpSession session, Model model) {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		System.out.println("userInfo====>" + userInfo);
		String email = String.valueOf(userInfo.get("EMAIL"));
		System.out.println("email ===>" + email);
		
		String orderCode = (String)session.getAttribute("orderCode");
		String foodnum = (String)session.getAttribute("foodnum");
		String optionnum = (String)session.getAttribute("optionnum");
		System.out.println("orderCode ===>" + orderCode);
		System.out.println("foodnum ===>" + foodnum);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("orderCode", orderCode);
		paramMap.put("foodnum", foodnum);
		paramMap.put("optionnum", optionnum);

		List<Map<String,Object>> orderPayment = shopservice.orderPayment(paramMap);
		System.out.println("orderPayment ====> "+orderPayment);
		model.addAttribute("orderPayment", orderPayment);
		
		return "shop/order";
	}
		@RequestMapping(value="foodCart.do")
	public String foodCart(Model model,@RequestParam("shopNum") String shopnum) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("storenum", shopnum);
		List<Map<String,Object>> resultMap = shopservice.getStoreInfo(shopnum);
		model.addAttribute("getStoreInfo", resultMap);
		return "mobile/shop/foodCart";
	}
	
	@RequestMapping(value="best.do")
	public String best() {
		
		return "mobile/shop/best";
	}
		@RequestMapping("/kakaoPay")
	    public String kakaoPay(@RequestParam("price") String price) {
	   
	        return "redirect:" + kakaopay.kakaoPayReady(price);
	    }
	
	@RequestMapping("/kakaoPaySuccess")
   	 public String kakaoPaySuccess() {
   
        return "shop/kakaoPaySuccess";
    	}
}
