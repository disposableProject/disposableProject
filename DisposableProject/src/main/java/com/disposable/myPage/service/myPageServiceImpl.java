package com.disposable.myPage.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.disposable.myPage.dao.myPageDao;

@Service("myPageService")
@MapperScan(basePackages="com.disposable.myPage.dao")
public class myPageServiceImpl implements myPageService{
	
	@Autowired
	private myPageDao myPageDao;
	
	@Override
	public List<Map<String, Object>> userOrderList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return myPageDao.userOrderList(paramMap);
	}

}
