package com.disposable.main.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class indexController {
	
	@RequestMapping(value="/")
		public String index(Model model) {
		System.out.println("index");
		
		return "index";
	}
}
