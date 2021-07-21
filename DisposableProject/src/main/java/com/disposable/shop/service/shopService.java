package com.disposable.shop.service;

import java.util.List;
import java.util.Map;

public interface shopService {
	public List<Map<String,Object>> shopMain(String shopnum);
	public List<Map<String,Object>> getFoodOption(Map<String,Object> paramMap);
	public List<Map<String,Object>> getStoreInfo(String shopnum);
}
