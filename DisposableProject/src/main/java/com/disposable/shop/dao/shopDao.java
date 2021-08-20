package com.disposable.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Configuration;

@Configuration("shopDao")
public interface shopDao {
	public List<Map<String,Object>> shopMain(Map<String,Object> paramMap);
	public List<Map<String,Object>> getFoodOption(Map<String, Object> paramMap);
	public List<Map<String,Object>> getStoreInfo(String shopnum);
	public int orderInsert(Map<String, Object> map);
	public List<Map<String,Object>> orderPayment(Map<String, Object> paramMap);
}
