package com.disposable.management.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
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
			String foodnum = "";
			fileNames = filemanagement.FileUploader(files);
			foodInsertCheck = managementservice.foodImageInsert(fileNames,foodnum);
		}
		if(foodInsertCheck == 1) {
			
		}
		resultMap.put("JavaData", foodInsertCheck);
		return resultMap;
	}
	@RequestMapping(value="/storeOrderList.do", method=RequestMethod.POST)
	public List<Map<String,Object>> storeOrderList(HttpSession session,HttpServletRequest request,@RequestParam(value="STATE", required=false) String state,@RequestParam(value="startDate", required=false) String startDate,@RequestParam(value="endDate", required=false) String endDate) throws SQLException, Exception {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		String storenum = String.valueOf(userInfo.get("STORENUM"));
		Map <String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("storenum",storenum);
		paramMap.put("state",state);
		paramMap.put("startDate",startDate);
		paramMap.put("endDate",endDate);
		System.out.println(paramMap);
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
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 음식수정
	 */
	@Transactional
	@RequestMapping(value="/foodUpdatePro.do", method=RequestMethod.POST)
	public Map<String, Object> foodUpdatePro(HttpServletRequest request,
			@RequestParam(value="foodImg", required=false) MultipartFile[] files
			,@RequestParam(value="foodData", required=false) String param) throws SQLException, Exception {
		ArrayList fileNames = null;
		Integer foodUpdateCheck = null;

		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> paramMap = mapper.readValue(param, Map.class);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		foodUpdateCheck = managementservice.foodMainUpdate(paramMap);
		if(((List<Object>) paramMap.get("foodOptionInfo")).size() > 0) {
			foodUpdateCheck = managementservice.foodOptiondelete((List<Object>) paramMap.get("foodOptionInfo"));
			foodUpdateCheck = managementservice.foodOptionInsert((List<Object>) paramMap.get("foodOptionInfo"));
		}
		if(files != null) {
			if(files.length > 0) {
				fileNames = filemanagement.FileUploader(files);
				String foodnum = (String)paramMap.get("foodnum");
				foodUpdateCheck = managementservice.foodImageDelete(paramMap);
				foodUpdateCheck = managementservice.foodImageInsert(fileNames,foodnum);
			}
		}
		
		if(foodUpdateCheck == 1) {
			
		}
		resultMap.put("JavaData", foodUpdateCheck);
		return resultMap;
	}
	
}
