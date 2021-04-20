package com.disposable.user.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Configuration;

@Configuration("userDao")
public interface userDao {
	public  List<Map<String,Object>> test (Map<String, Object> paramMap) throws SQLException;
}
