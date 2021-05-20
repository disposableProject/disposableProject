package com.disposable.test;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.disposable.utils.FileManagement;
@Controller
@RequestMapping("/test")
public class testMoveController {
	@Autowired
	private FileManagement filemanagement;
	
	@RequestMapping(value="/test.do")
	public String test() {
	
		return  "test/test";
	}
}
