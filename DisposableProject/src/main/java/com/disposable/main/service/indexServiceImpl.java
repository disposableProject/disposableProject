package com.disposable.main.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.disposable.main.dao.indexdao;
import com.disposable.management.service.managementService;

@Service("indexService")
@MapperScan(basePackages="com.disposable.main.dao")
public class indexServiceImpl implements indexService{
	@Autowired
	private indexdao indexdao;
	
	@Override
	public List<Map<String, Object>> storeList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return indexdao.storeList(paramMap);
	}
}
