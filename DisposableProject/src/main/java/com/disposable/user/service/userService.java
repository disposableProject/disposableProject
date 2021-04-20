package com.disposable.user.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("userService")
public interface userService {
	List<Map<String,Object>> test (Map<String, Object> paramMap) throws SQLException;
}
