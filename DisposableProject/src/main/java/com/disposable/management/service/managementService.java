package com.disposable.management.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface managementService {
	public Integer foodMainInsert(Map<String, Object> paramMap) throws SQLException;
	public Integer foodOptionInsert(List<Object> paramMap) throws SQLException;
	public Integer foodImageInsert(ArrayList paramMap) throws SQLException;
	public List<Map<String,Object>> storeFoodListGet(Map<String, Object> paramMap);
}
