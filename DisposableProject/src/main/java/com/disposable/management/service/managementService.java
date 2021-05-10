package com.disposable.management.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Service;

public interface managementService {
	public Integer foodMainInsert(Map<String, Object> paramMap) throws SQLException;
	public Integer foodOptionInsert(List<String> paramMap) throws SQLException;
}
