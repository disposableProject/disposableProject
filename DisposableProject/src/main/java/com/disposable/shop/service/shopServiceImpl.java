package com.disposable.shop.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.disposable.management.service.managementService;
import com.disposable.shop.dao.shopDao;

@Service("shopService")
@MapperScan(basePackages="com.disposable.shop.dao")
public class shopServiceImpl implements shopService{
	
	@Autowired
	private shopDao shopDao;
	
	@Override
	public List<Map<String, Object>> shopMain(String shopnum) {
		// TODO Auto-generated method stub
		return shopDao.shopMain(shopnum);
	}
	@Override
	public List<Map<String, Object>> getFoodOption(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return shopDao.getFoodOption(paramMap);
	}
	@Override
	public List<Map<String, Object>> getStoreInfo(String shopnum) {
		// TODO Auto-generated method stub
		return shopDao.getStoreInfo(shopnum);
	}
}
