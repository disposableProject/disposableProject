package com.disposable.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Configuration;

@Configuration("indexdao")
public interface indexdao {
	public List<Map<String,Object>> storeList(Map<String, Object> paramMap);
	public List<Map<String,Object>> bestStoreList(Map<String, Object> paramMap);
	public List<Map<String,Object>> AllStoreList();
	public List<Map<String,Object>> SaleFoodList();
	public List<Map<String,Object>> getAroundstoreList(Map<String, Object> paramMap);
	public List<Map<String,Object>> RecommendFoodList(String Flag);
}
