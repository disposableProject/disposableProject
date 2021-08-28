package com.disposable.management.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Configuration;

@Configuration("managementDao")
public interface managementDao {
	public Integer foodMainInsert(Map<String, Object> paramMap) throws SQLException;
	public Integer foodOptionInsert(Map<String, Object> paramMap) throws SQLException;
	public Integer foodImageInsert(Map<String, Object> paramMap) throws SQLException;
	public List<Map<String,Object>> storeFoodListGet(Map<String, Object> paramMap);
	public List<Map<String,Object>> storeOrderList(Map<String, Object> paramMap);
	public Integer updateOrder(Map<String, Object> paramMap) throws SQLException;
	public Map<String,Object> shopInfo(String storeNum);
	public Integer shopInfoUpdate(Map<String, Object> paramMap) throws SQLException;
	public List<Map<String,Object>> foodInfo(Map<String, Object> paramMap);
	public Integer foodMainUpdate(Map<String, Object> paramMap) throws SQLException;
	public Integer foodOptiondelete(Map<String, Object> paramMap) throws SQLException;
	public Integer foodImageDelete(Map<String, Object> paramMap) throws SQLException;
	public List<Map<String,Object>> shopSalesInfo(Map<String, Object> paramMap);
}
