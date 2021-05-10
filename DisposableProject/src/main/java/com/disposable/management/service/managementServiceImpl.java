package com.disposable.management.service;

import java.sql.SQLException;
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
	public Integer foodOptionInsert(List<String> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return managementDao.foodOptionInsert(paramMap);
	}
}
