package com.disposable.management.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.disposable.management.service.managementService;
import com.disposable.utils.FileManagement;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/management")
public class managementRestController {

	@Autowired
	private managementService managementservice;
	
	@Autowired
	private FileManagement filemanagement;
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 테스트
	 */
	@Transactional
	@RequestMapping(value="/foodInsertPro.do", method=RequestMethod.POST)
	public Map<String, Object> foodInsertPro(HttpServletRequest request,
			@RequestParam(value="foodImg", required=false) MultipartFile[] files
			,@RequestParam(value="foodData", required=false) String param) throws SQLException, Exception {
		ArrayList fileNames = null;
		Integer foodInsertCheck = null;
		
		System.out.println("fileNames =>"+fileNames);
		System.out.println("param:" + param);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> paramMap = mapper.readValue(param, Map.class);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		foodInsertCheck = managementservice.foodMainInsert(paramMap);
		if(((List<Object>) paramMap.get("foodOptionInfo")).size() > 0) {
			foodInsertCheck = managementservice.foodOptionInsert((List<Object>) paramMap.get("foodOptionInfo"));
		}
		if(files.length > 0) {
			fileNames = filemanagement.FileUploader(files);
			foodInsertCheck = managementservice.foodImageInsert(fileNames);
		}
		if(foodInsertCheck == 1) {
			
		}
		resultMap.put("JavaData", foodInsertCheck);
		return resultMap;
	}
	@RequestMapping(value="/storeOrderList.do", method=RequestMethod.POST)
	public List<Map<String,Object>> storeOrderList(HttpSession session,HttpServletRequest request,@RequestParam(value="STATE", required=false) String state) throws SQLException, Exception {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		String storenum = String.valueOf(userInfo.get("STORENUM"));
		Map <String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("storenum",storenum);
		paramMap.put("state",state);
		List<Map<String,Object>> resultMap = managementservice.storeOrderList(paramMap);
		return resultMap;
	}
	
	@RequestMapping(value="/updateOrder.do", method=RequestMethod.POST)
	public Map<String,Object> updateOrder(HttpSession session,HttpServletRequest request,@RequestParam(value="orderCodes", required=false) ArrayList orderCodes,@RequestParam(value="state", required=false) String state) throws SQLException, Exception {
		System.out.println("updateOrder ============== ");
		System.out.println(orderCodes);
		System.out.println(state);
		Map <String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("orderCodes",orderCodes);
		paramMap.put("state",state);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Integer result = managementservice.updateOrder(paramMap);
		if(result > 0) {
			resultMap.put("JavaData", "update");
		}
		return resultMap;
	}
	
	@RequestMapping(value="/shopInfoUpdate.do", method=RequestMethod.POST)
	public Map<String,Object> shopInfoUpdate(HttpSession session,HttpServletRequest request,@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println("shopInfoUpdate ============== ");
		System.out.println(paramMap);
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		String storenum = String.valueOf(userInfo.get("STORENUM"));
		paramMap.put("storenum",storenum);
		Integer result = managementservice.shopInfoUpdate(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		return resultMap;
	}
	
	
}
