package com.disposable.main.service;

import java.util.List;
import java.util.Map;

public interface indexService {
	public List<Map<String,Object>> storeList(Map<String, Object> paramMap);
	public List<Map<String,Object>> bestStoreList(Map<String, Object> paramMap);
	public List<Map<String,Object>> AllStoreList();
	public List<Map<String,Object>> SaleFoodList();
}
