package com.disposable.shop.service;

import java.util.List;
import java.util.Map;

public interface shopService {
	public List<Map<String,Object>> shopMain(Map<String,Object> paramMap);
	public List<Map<String,Object>> getFoodOption(Map<String,Object> paramMap);
	public List<Map<String,Object>> getStoreInfo(String shopnum);
	public int orderInsert(Map<String, Object> map);
	List<Map<String, Object>> orderPayment(Map<String, Object> paramMap);
	public int reviewWrite(Map<String, Object> paramMap);
}
