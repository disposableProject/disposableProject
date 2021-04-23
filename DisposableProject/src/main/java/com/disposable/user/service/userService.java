package com.disposable.user.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("userService")
public interface userService {
	Integer ceoRegisterPro (Map<String, Object> paramMap) throws SQLException;
	int checkUserId (Map<String, Object> paramMap) throws SQLException;
	int checkEmail (Map<String, Object> paramMap) throws SQLException;
	int emailauth(Map<String, Object> paramMap);
	Map<String, Object> loginPro (Map<String, Object> paramMap) throws SQLException;
}
