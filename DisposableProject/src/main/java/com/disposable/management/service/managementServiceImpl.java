package com.disposable.management.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.disposable.management.dao.managementDao;

@Service("managementService")
@MapperScan(basePackages="com.disposable.management.dao")
public class managementServiceImpl implements managementService{
	@Autowired
	private managementDao managementDao;
	
	@Transactional
	@Override
	public Integer foodMainInsert(Map<String, Object> paramMap) throws SQLException {
		return managementDao.foodMainInsert(paramMap);
	}
	
	@Override
	public Integer foodOptionInsert(List<Object> paramMap) throws SQLException {
		Integer check = null;
			for(int i=0;i<paramMap.size();i++) {
				check = managementDao.foodOptionInsert((Map<String, Object>)paramMap.get(i));
			}
		return check;
	}
	
	@Override
	public Integer foodImageInsert(ArrayList paramMap) throws SQLException {
		Integer check = null;
			for(int i=0;i<paramMap.size();i++) {
				check = managementDao.foodImageInsert((String)paramMap.get(i));
			}
		return check;
	}
	@Override
	public List<Map<String, Object>> storeFoodListGet(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return managementDao.storeFoodListGet(paramMap);
	}
}
