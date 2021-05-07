package com.disposable.management.dao;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.context.annotation.Configuration;

@Configuration("managementDao")
public interface managementDao {
	public Integer foodMainInsert(Map<String, Object> paramMap) throws SQLException;
}
