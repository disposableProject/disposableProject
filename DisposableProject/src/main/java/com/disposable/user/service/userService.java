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
	int checkUserEmail (Map<String, Object> paramMap) throws SQLException;
	Integer userRegisterPro (Map<String, Object> paramMap) throws SQLException;
	int checkNickname (Map<String, Object> paramMap) throws SQLException;
	Map<String, Object> userLoginPro (Map<String, Object> paramMap) throws SQLException;
	Map<String, Object> naverConnectionCheck (Map<String, Object> apiJson) throws SQLException;
	Integer setNaverConnection (Map<String, Object> paramMap) throws SQLException;
	Integer userNaverRegisterPro (Map<String, Object> paramMap) throws SQLException;
	Map<String, Object> userNaverLoginPro (Map<String, Object> paramMap) throws SQLException;
}
