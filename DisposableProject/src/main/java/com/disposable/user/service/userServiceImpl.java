package com.disposable.user.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.disposable.user.dao.userDao;

@Service("userService")
@MapperScan(basePackages="com.disposable.user.dao")//탐색할 패키시 설정
public class userServiceImpl implements userService{

	@Autowired
	private userDao userDao;
	
	@Override
	public List<Map<String, Object>> test(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.test(paramMap);
	}
}
