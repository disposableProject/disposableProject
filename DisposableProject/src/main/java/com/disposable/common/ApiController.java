package com.disposable.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
public class ApiController {
	@Value("${KAKAO.JS}")
	String kakaoApi;
	
	@Value("${GOOGLE.CLIENT}")
	String googleKey;
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 카카오 api 키 전달
	 */
	@RequestMapping(value="/getKakaoApi.do", method=RequestMethod.POST)
	public String getKakaoApi() throws SQLException, Exception {
		System.out.println("getKakaoApi");
		return kakaoApi;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 구글 api 키 전달
	 */
	@RequestMapping(value="/getGoogleApi.do", method=RequestMethod.POST)
	public String getGoogleApi() throws SQLException, Exception {
		System.out.println("getGoogleApi");
		return googleKey;
	}
}
