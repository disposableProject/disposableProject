package com.disposable.management.controller;

import java.sql.SQLException;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.disposable.management.service.managementService;

@Controller
@RequestMapping("/management")
public class managementController {
	
	@Autowired
	private managementService managementservice;
	
	/**
	 * @author 손호일
	 * @description 가게 관리 메인 페이지 이동
	 */
	@RequestMapping(value="managementMain.do")
	public String managementMain() {
		System.out.println("managementMain");
		return "management/managementMain";
	}
	/**
	 * @author 손호일
	 * @description 가게 정보 관리 페이지 이동
	 */
	@RequestMapping(value="shopInfo.do")
	public String shopInfo(Model model,HttpSession session) {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		String storeNum = String.valueOf(userInfo.get("STORENUM"));
		Map<String,Object> resultMap =   managementservice.shopInfo(storeNum);
		model.addAttribute("storeInfo", resultMap);
		System.out.println("shopInfo");
		return "management/shopInfo";
	}
	/**
	 * @author 손호일
	 * @description 가게 음식 등록 및 수정 페이지 이동
	 */
	@RequestMapping(value="managementFoods.do")
	public String managementFoods(HttpSession session,Model model,@RequestParam("pagenum") int pageNum) {
		System.out.println("managementFoods");
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		System.out.println("num ==>"+(Map<String, Object>) session.getAttribute("userInfo"));
		String storeNum = String.valueOf(userInfo.get("STORENUM"));
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startpagenum", (pageNum-1)*12);
		paramMap.put("endpagenum", (pageNum)*12);
		paramMap.put("storenum", storeNum);
		List<Map<String,Object>> resultMap =   managementservice.storeFoodListGet(paramMap);
		model.addAttribute("foodList", resultMap);
		
		int pageGroupNum = (int) Math.floor((pageNum - 1) / 5 + 1);
		int startPage = (pageGroupNum - 1) * 5 + 1;
		int totalCmtCnt = Integer.parseInt(String.valueOf(resultMap.get(0).get("TOTALCNT")));
		int totalPageCnt = (int) Math.floor(totalCmtCnt / 12);
		if (totalCmtCnt % 12 > 0) {
			totalPageCnt++;
		}
		int pageGroupCnt = (int) Math.floor(totalPageCnt / 5);
		if (totalPageCnt % 5 > 0) {
			pageGroupCnt++;
		}
		model.addAttribute("boardNum", storeNum);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageGroupNum", pageGroupNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("totalCmtCnt", totalCmtCnt);
		model.addAttribute("totalPageCnt", totalPageCnt);
		model.addAttribute("pageGroupCnt", pageGroupCnt);
		System.out.println("pageNum =>"+pageNum);
		System.out.println("pageGroupNum =>"+pageGroupNum);
		System.out.println("startPage =>"+startPage);
		System.out.println("totalCmtCnt =>"+totalCmtCnt);
		System.out.println("totalPageCnt =>"+totalPageCnt);
		System.out.println("pageGroupCnt =>"+pageGroupCnt);
		return "management/managementFoods";
	}
	/**
	 * @author 손호일
	 * @description 가게 주문 관리 페이지 이동
	 */
	@RequestMapping(value="managementOrders.do")
	public String managementOrders(HttpSession session,Model model) {
		System.out.println("managementOrders");
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		System.out.println("num ==>"+(Map<String, Object>) session.getAttribute("userInfo"));
		String storenum = String.valueOf(userInfo.get("STORENUM"));
		model.addAttribute("storenum", storenum);
		return "management/managementOrders";
	}
	/**
	 * @author 손호일
	 * @description 음식 등록 페이지 이동
	 */
	@RequestMapping(value="foodInsert.do")
	public String foodInsert() {
		System.out.println("foodInsert");
		return "management/foodInsert";
	}
	/**
	 * @author 손호일
	 * @description 가게 매출 관리 페이지 이동
	 */
	@RequestMapping(value="managementSales.do")
	public String managementSales() {
		System.out.println("managementSales");
		return "management/managementSales";
	}
	
	@RequestMapping(value="/downloadOrder.do", method=RequestMethod.GET)
	public String downloadOrder(HttpServletResponse response,HttpSession session,HttpServletRequest request,@RequestParam(value="STATE", required=false) String state) throws SQLException, Exception {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		String storenum = String.valueOf(userInfo.get("STORENUM"));
		Map <String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("storenum",storenum);
		paramMap.put("state",state);
		List<Map<String,Object>> resultMap = managementservice.storeOrderList(paramMap);
		
		
		//엑셀 다운로드 부분
			Workbook wb = new XSSFWorkbook();
	        Sheet sheet = wb.createSheet("첫번째 시트");
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;

	       
	        row = sheet.createRow(rowNum++);
	 	        
	        Iterator iterator = resultMap.get(0).keySet().iterator();
	        int k = 0 ;
	        while(iterator.hasNext()){
	        	cell = row.createCell(k);
	        	String key = (String)iterator.next();
	        	cell.setCellValue(key);
	        	k++;
	        }
	        
	        // Header
	       

		        // Body
	        for (int i=0; i<resultMap.size(); i++) {
	        		Iterator iterator2 = resultMap.get(i).keySet().iterator();
	        		row = sheet.createRow(rowNum++);
	        		int j = 0;
	        		while(iterator2.hasNext()){
	        			cell = row.createCell(j);
	        			String key = (String)iterator2.next();
	        			String value = String.valueOf(resultMap.get(i).get(key));
	        			cell.setCellValue(value);
	        			j++;
	        		}
	        }

	        // 컨텐츠 타입과 파일명 지정
	        response.setContentType("ms-vnd/excel");
//	        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
	        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        // Excel File Output


	        wb.write(response.getOutputStream());
	        wb.close();

	        return "management/managementSales";
	}
	
	/**
	 * @author 손호일
	 * @description 음식 수정 페이지 이동
	 */
	@RequestMapping(value="foodUpdate.do")
	public String foodUpdate(HttpSession session,Model model,@RequestParam(value="foodnum") String foodnum) {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		String storeNum = String.valueOf(userInfo.get("STORENUM"));
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("storenum",storeNum);
		paramMap.put("foodnum",foodnum);
		List<Map<String,Object>> resultMap = managementservice.foodInfo(paramMap);
		System.out.println("foodUpdate =>"+foodnum);
		model.addAttribute("resultMap", resultMap);
		return "management/foodupdate";
	}
}
