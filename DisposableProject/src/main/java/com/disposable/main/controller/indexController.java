package com.disposable.main.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.disposable.main.service.indexService;
import com.disposable.utils.JsonChanger;

@Controller
public class indexController {
	
	@Autowired
	private indexService indexservice;
	
	@RequestMapping(value="/")
		public String index(Model model) {
		System.out.println("index");
		List<Map<String,Object>> RecommendFoodList = indexservice.RecommendFoodList("main");
		List<Map<String,Object>> SaleFoodList = indexservice.SaleFoodList();
		model.addAttribute("RecommendFoodList",RecommendFoodList);
		model.addAttribute("SaleFoodList",SaleFoodList);
		return "index";
	}
	@RequestMapping(value="/new.do")
		public String main_new(Model model) {
		System.out.println("new");
		return "include/main_new";
	}
	@RequestMapping(value="/best.do")
		public String main_best(Model model) {
		List<Map<String,Object>> RecommendFoodList = indexservice.RecommendFoodList("");
		model.addAttribute("RecommendFoodList",RecommendFoodList);
		System.out.println("best");
		
		return "include/main_best";
	}
	@RequestMapping(value="/around.do")
		public String main_around(Model model) {
		System.out.println("around");
		List<Map<String,Object>> AllStoreList = indexservice.AllStoreList();

		model.addAttribute("AllStoreList",JsonChanger.jsonarray(AllStoreList).toString());
		return "include/main_around";
	}
	@RequestMapping(value="/sale.do")
		public String main_sale(Model model) {
		System.out.println("sale");
		List<Map<String,Object>> SaleFoodList = indexservice.SaleFoodList();
		model.addAttribute("SaleFoodList",SaleFoodList);
		return "include/main_sale";
	}
	@RequestMapping(value="/mobile")
		public String mobile(Model model) {
		System.out.println("mobile");
		return "mobile";
	}
	@RequestMapping(value="/mobile/around.do")
	public String mobile_around(Model model) {
	List<Map<String,Object>> AllStoreList = indexservice.AllStoreList();

	model.addAttribute("AllStoreList",JsonChanger.jsonarray(AllStoreList).toString());
	System.out.println("mobile_around");
	return "mobile/include/around";
}
}
