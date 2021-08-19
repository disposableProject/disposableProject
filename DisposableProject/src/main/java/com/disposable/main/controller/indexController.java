package com.disposable.main.controller;

import java.util.List;
import java.util.Map;

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
