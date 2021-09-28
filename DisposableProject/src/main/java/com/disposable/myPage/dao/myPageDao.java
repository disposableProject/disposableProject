package com.disposable.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Configuration;

@Configuration("myPageDao")
public interface myPageDao {
	List<Map<String, Object>> userOrderList(Map<String, Object> paramMap);
}
