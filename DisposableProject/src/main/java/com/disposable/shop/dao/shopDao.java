package com.disposable.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Configuration;

@Configuration("shopDao")
public interface shopDao {
	public List<Map<String,Object>> shopMain(String shopnum);
	public List<Map<String,Object>> getFoodOption(Map<String, Object> paramMap);
}
