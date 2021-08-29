package com.disposable.myPage.service;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.disposable.myPage.dao.myPageDao;

@Service("myPageService")
@MapperScan(basePackages="com.disposable.myPage.dao")
public class myPageServiceImpl implements myPageService{
	
	@Autowired
	private myPageDao myPageDao;

}
