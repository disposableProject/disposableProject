package com.disposable.shop.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.disposable.shop.service.shopService;
import com.disposable.utils.Uuid;

@RestController
@RequestMapping("/shop")
public class shopRestController {

	@Autowired
	private shopService shopservice;
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 음식 옵션 목록 가져오기
	 */

	@RequestMapping(value="/getFoodOption.do", method=RequestMethod.POST)
	public List<Map<String,Object>> getFoodOption(HttpServletRequest request,@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		List<Map<String,Object>> resultMap = shopservice.getFoodOption(paramMap);
		System.out.println("getFoodOption++++++ : " + resultMap);
		return resultMap;
	}
	
	@RequestMapping(value="/orderInsert.do", method=RequestMethod.POST)
	public List<Map<String,Object>> orderInsert(HttpServletRequest request,@RequestParam String jsondata, HttpSession session) throws SQLException, Exception {
		System.out.println("jsondata ==>"+jsondata);
		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> readValue = null;

		// util에서 클래스 가져옴
		Uuid uuid = new Uuid();
		String orderCode = uuid.uuid();
		session.setAttribute("orderCode", orderCode);
        try {
           readValue = objectMapper.readValue(jsondata,
                    new TypeReference<List<Map<String, Object>>>() {
                    });
 
            for (Map<String, Object> map : readValue) {
                //MapUtils.debugPrint(System.out, "map", map);
            	map.put("ordercode", orderCode);
            	System.out.println("mapmapamp :" + map);
            	String foodnum = (String)map.get("foodnum");
            	String optionnum = (String)map.get("optionnum");
            	System.out.println("foodnumfoodnum=>"+foodnum);
            	session.setAttribute("foodnum", foodnum);
            	session.setAttribute("optionnum", optionnum);
            	int isS = shopservice.orderInsert(map);
            	
            }
        } catch (JsonParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JsonMappingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
		
		return readValue;
	}

	private Object JSONParser(String string) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@RequestMapping(value="/reviewWrite.do", method=RequestMethod.POST)
	public Map<String,Object> reviewWrite(String storenum, HttpSession session){
		System.out.println("String storenum" + storenum);
		
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		System.out.println("userInfo====>" + userInfo);
		String email = String.valueOf(userInfo.get("EMAIL"));
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		paramMap.put("storenum", storenum);
		paramMap.put("email", email);
		
		int isS = shopservice.reviewWrite(paramMap);
		
		if (isS > 0) {
			resultMap.put("result", "YES");
		}else {
			resultMap.put("result", "NO");
		}
		
		return resultMap;
	}
}
