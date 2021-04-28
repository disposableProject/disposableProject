package com.disposable.user.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Configuration;

@Configuration("userDao")
public interface userDao {
	public Integer ceoRegisterPro (Map<String, Object> paramMap) throws SQLException;
	public int checkUserId (Map<String, Object> paramMap) throws SQLException;
	public int checkEmail (Map<String, Object> paramMap) throws SQLException;
	public Map<String, Object> loginPro (Map<String, Object> paramMap) throws SQLException;
	public int checkUserEmail (Map<String, Object> paramMap) throws SQLException;
	public Integer userRegisterPro (Map<String, Object> paramMap) throws SQLException;
	public int checkNickname (Map<String, Object> paramMap) throws SQLException;
	public Map<String, Object> userLoginPro (Map<String, Object> paramMap) throws SQLException;
	public Map<String, Object> naverConnectionCheck (Map<String, Object> apiJson) throws SQLException;
	public Integer setNaverConnection (Map<String, Object> paramMap) throws SQLException;
	public Integer userNaverRegisterPro (Map<String, Object> paramMap) throws SQLException;
	public Map<String, Object> userNaverLoginPro (Map<String, Object> apiJson) throws SQLException;
}
