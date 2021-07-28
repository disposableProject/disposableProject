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
	
	@RequestMapping(value="/mobile")
		public String mobile(Model model) {
		System.out.println("mobile");
		return "mobile";
	}
}
