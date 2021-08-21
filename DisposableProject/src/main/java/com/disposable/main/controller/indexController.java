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

@Controller
public class indexController {
	
	@Autowired
	private indexService indexservice;
	
	@RequestMapping(value="/")
		public String index(Model model) {
		System.out.println("index");
		return "index";
	}
	@RequestMapping(value="/new.do")
		public String main_new(Model model) {
		System.out.println("best");
		return "include/main_new";
	}
	@RequestMapping(value="/best.do")
		public String main_best(Model model) {
		System.out.println("best");
		
		return "include/main_best";
	}
	@RequestMapping(value="/around.do")
		public String main_around(Model model) {
		System.out.println("around");
		List<Map<String,Object>> AllStoreList = indexservice.AllStoreList();
		JSONArray jsonArray = new JSONArray();

	
		 JSONArray json_arr=new JSONArray();
		    for (Map<String, Object> map : AllStoreList) {
		        JSONObject json_obj=new JSONObject();
		        for (Map.Entry<String, Object> entry : map.entrySet()) {
		            String key = entry.getKey();
		            Object value = entry.getValue();
		            try {
		                json_obj.put(key,value);
		            } catch (Exception e) {
		                // TODO Auto-generated catch block
		                e.printStackTrace();
		            }                           
		        }
		        json_arr.add(json_obj);
		    }
		model.addAttribute("AllStoreList",json_arr.toString());
		return "include/main_around";
	}
	@RequestMapping(value="/sale.do")
		public String main_sale(Model model) {
		System.out.println("sale");
		return "include/main_sale";
	}
	@RequestMapping(value="/mobile")
		public String mobile(Model model) {
		System.out.println("mobile");
		return "mobile";
	}
}
