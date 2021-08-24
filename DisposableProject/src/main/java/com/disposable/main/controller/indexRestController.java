package com.disposable.main.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.disposable.main.service.indexService;

@RestController
public class indexRestController {
	@Autowired
	private indexService indexservice;
	
	@Autowired
	private SimpMessageSendingOperations messagingTemplate;
	
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 식당목록
	 */
	@RequestMapping(value="/getStoreList.do", method=RequestMethod.POST)
	public List<Map<String,Object>> getStoreList(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println("getStoreList ==>"+paramMap);
		int startPage = (Integer.parseInt((String)paramMap.get("page"))-1) * 12;
		int endPage = startPage + 13;
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		List<Map<String,Object>> resultMap = indexservice.storeList(paramMap);
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 주문 많은 식당목록
	 */
	@RequestMapping(value="/bestStoreList.do", method=RequestMethod.POST)
	public List<Map<String,Object>> bestStoreList(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		
		List<Map<String,Object>> resultMap = indexservice.bestStoreList(paramMap);
		return resultMap;
	}
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 식당목록
	 */
	@RequestMapping(value="/getAroundstoreList.do", method=RequestMethod.POST)
	public List<Map<String,Object>> getAroundstoreList(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		List<Map<String,Object>> resultMap = indexservice.getAroundstoreList(paramMap);
		return resultMap;
	}
	
	@MessageMapping("/live/oreder/{storenum}")
    public void addUser(String storenum,SimpMessageHeaderAccessor headerAccessor){
		  headerAccessor.getSessionAttributes().put("storenum", storenum);
		  System.out.println("storenum ==>"+storenum);
		  messagingTemplate.convertAndSend("/topic/public/"+storenum,storenum);
       // return storenum;
    }
}
