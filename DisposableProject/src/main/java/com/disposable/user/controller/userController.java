package com.disposable.user.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.disposable.common.NaverLoginBO;
import com.disposable.user.service.userService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping("/user")
public class userController {
	
	@Autowired
	private userService userservice;
	
	@Autowired
	private NaverLoginBO naverloginbo;

	/**
	 * @author 손호일
	 * @description 유저페이지 이동
	 */
	@RequestMapping(value="usermain.do")
	public String usermain() {
		System.out.println("user");
		return "user/user";
	}
	/**
	 * @author 손호일
	 * @description 사장님 회원가입 페이지 이동
	 */
	@RequestMapping(value="ceoRegister.do")
	public String ceoRegister() {
		System.out.println("ceoRegister");
		return "user/ceoRegister";
	}
	/**
	 * @author 정연우
	 * @description 일반 회원가입 페이지 이동
	 */
	@RequestMapping(value="userRegister.do")
	public String userRegister() {
		System.out.println("userRegister");
		return "user/userRegister";
	}
	/**
	 * @author 손호일
	 * @description 사장님 로그인 페이지 이동
	 */
	@RequestMapping(value="ceoLogin.do")
	public String ceoLogin() {
		System.out.println("ceoLogin");
		return "user/ceoLogin";
	}
	/**
	 * @author 손호일
	 * @description 유저 로그인 페이지 이동
	 */
	@RequestMapping(value="userLogin.do")
	public String userLogin(Model model,HttpSession session) {
		System.out.println("userLogin");	
		String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		return "user/userLogin";
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 유저 네이버 로그인
	 */
	@RequestMapping(value="/userNaverLoginPro.do",  method = {RequestMethod.GET,RequestMethod.POST})
	public String userNaverLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();

		OAuth2AccessToken oauthToken;
		oauthToken = naverloginbo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverloginbo.getUserProfile(oauthToken);
		System.out.println("apiResult =>"+apiResult);
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		
		//apiJson.put("password",apiJson.get("id"));
		Map<String, Object> naverConnectionCheck = userservice.naverConnectionCheck(apiJson);
		
		if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
			//Integer registerCheck = userservice.userNaverRegisterPro(apiJson);
			
			
			/*if(registerCheck == null || registerCheck < 1) {
				model.addAttribute("error","loginFail");
				return "user/userLogin";
			}else {
				Map<String, Object> loginCheck = userservice.userNaverLoginPro(apiJson);
				session.setAttribute("userInfo", loginCheck);
			}*/
			model.addAttribute("email",apiJson.get("email"));
			model.addAttribute("password",apiJson.get("id"));
			model.addAttribute("phone",apiJson.get("mobile"));
			model.addAttribute("flag","naver");
			return "user/setSnsInfo";
		}else if(naverConnectionCheck.get("NAVERLOGIN") == null && naverConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			userservice.setNaverConnection(apiJson);
			Map<String, Object> loginCheck = userservice.userNaverLoginPro(apiJson);
			session.setAttribute("userInfo", loginCheck);
		}else { //모두 연동 되어있을시
			Map<String, Object> loginCheck = userservice.userNaverLoginPro(apiJson);
			session.setAttribute("userInfo", loginCheck);
		}

		return "redirect:usermain.do";
	}
	/**
	 * @author 손호일
	 * @description 로그아웃
	 */
	@RequestMapping(value="logOut.do")
	public String logOut(Model model,HttpSession session) {
		System.out.println("logOut");	
		session.invalidate();
		return "user/user";
	}
	/**
	 * @author 손호일
	 * @description SNS 회원가입 추가 정보 입력
	 */
	@RequestMapping(value="setSnsInfo.do")
	public String setKakaoInfo(Model model,HttpSession session,@RequestParam Map<String,Object> paramMap) {
		System.out.println("setKakaoInfo");	
		System.out.println("param ==>"+paramMap);
		
		model.addAttribute("email",paramMap.get("email"));
		model.addAttribute("password",paramMap.get("id"));
		model.addAttribute("flag",paramMap.get("flag"));
		return "user/setSnsInfo";
	}
	

}
