package com.disposable.user.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.disposable.common.NaverLoginBO;
import com.disposable.user.service.userService;
import com.disposable.utils.FileManagement;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/user")
public class userRestController {
	
	@Autowired
	private userService userservice;
	
	@Autowired
	private NaverLoginBO naverloginbo;
	
	@Autowired
	private FileManagement filemanagement;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 테스트
	 */
	@RequestMapping(value="/test.do", method=RequestMethod.POST)
	public Map<String, Object> test(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> registerCheck = userservice.test(paramMap);
		//Map <String, Object> 
		System.out.println(registerCheck);
		resultMap.put("JavaData", registerCheck);
		return resultMap;
	}
	
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 사장님 회원가입
	 */
	@RequestMapping(value="/ceoRegisterPro.do", method=RequestMethod.POST)
	public Map<String, Object> ceoRegisterPro(
			@RequestParam(value="foodImg", required=false) MultipartFile[] files
			,@RequestParam(value="registerData", required=false) String param) throws SQLException, Exception {
		System.out.println("paramMap:" + param);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> paramMap = mapper.readValue(param, Map.class);
		
		ArrayList fileNames = null;
		if(files.length > 0) {
			fileNames = filemanagement.FileUploader(files);
		}
		paramMap.put("PHOTO", fileNames.get(0));
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Integer registerCheck = userservice.ceoRegisterPro(paramMap);
		System.out.println(registerCheck);
		resultMap.put("JavaData", registerCheck);
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description  사장님 아이디 중복 체크
	 */

	@RequestMapping(value="/checkUserId.do", method=RequestMethod.POST)
	public Map<String, Object> checkUserId(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		int userCheck = userservice.checkUserId(paramMap);
		resultMap.put("JavaData", userCheck);
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description  사장님 이메일 중복 체크
	 */
	@RequestMapping(value="/checkEmail.do", method=RequestMethod.POST)
	public Map<String, Object> checkEmail(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		int emailCheck = userservice.checkEmail(paramMap);
		
		if(emailCheck == 0) {
			userservice.emailauth(paramMap);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		
		return resultMap;
	}
	
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description  사장님 이메일 인증 확인
	 */
	@RequestMapping(value="/emailAuth.do", method=RequestMethod.POST)
	public Map<String, Object> emailAuth(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		
		
		Map <String, Object> resultMap = new HashMap<String, Object>();
		String authNum = (String) paramMap.get("authNum");
		HttpSession session = request.getSession();	
		String sessionAuth = (String)session.getAttribute("authNum");
		System.out.println("sessionAuth ==>"+sessionAuth);
		System.out.println("authNum ==>"+authNum);
		if(authNum.equals(sessionAuth)) {
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 사장님 로그인
	 */
	@RequestMapping(value="/loginPro.do", method=RequestMethod.POST)
	public Map<String, Object> loginPro(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> loginCheck = userservice.loginPro(paramMap);
		HttpSession session = request.getSession();	
		System.out.println(loginCheck);
		System.out.println((String) loginCheck.get("USERID"));
		session.setAttribute("userInfo", loginCheck);
		resultMap.put("JavaData", loginCheck);
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description  유저 이메일 중복 체크
	 */
	@RequestMapping(value="/checkUserEmail.do", method=RequestMethod.POST)
	public Map<String, Object> checkUserEmail(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		int emailCheck = userservice.checkUserEmail(paramMap);
		
		if(emailCheck == 0) {
			userservice.emailauth(paramMap);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 유저 회원가입
	 */
	@RequestMapping(value="/userRegisterPro.do", method=RequestMethod.POST)
	public Map<String, Object> userRegisterPro(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Integer registerCheck = userservice.userRegisterPro(paramMap);
		System.out.println(registerCheck);
		resultMap.put("JavaData", registerCheck);
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description  유저 닉네임 중복 체크
	 */
	@RequestMapping(value="/checkNickname.do", method=RequestMethod.POST)
	public Map<String, Object> checkNickname(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println(paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		int nicknameCheck = userservice.checkNickname(paramMap);
		
		if(nicknameCheck == 0) {
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 유저 로그인
	 */
	@RequestMapping(value="/userLoginPro.do", method=RequestMethod.POST)
	public Map<String, Object> userLoginPro(@RequestParam Map<String,Object> paramMap) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> loginCheck = userservice.userLoginPro(paramMap);
		HttpSession session = request.getSession();	
		session.setAttribute("userInfo", loginCheck);
		resultMap.put("JavaData", loginCheck);
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 유저 네이버 회원가입
	 */
	@RequestMapping(value="/userNaverRegisterPro.do", method=RequestMethod.POST)
	public Map<String, Object> userNaverRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Integer registerCheck = userservice.userNaverRegisterPro(paramMap);
		System.out.println(registerCheck);
		
		if(registerCheck != null && registerCheck > 0) {
			Map<String, Object> loginCheck = userservice.userNaverLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 유저 카카오 로그인
	 */
	@RequestMapping(value="/kakaoLoginPro.do", method=RequestMethod.POST)
	public Map<String, Object> kakaoLoginPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String, Object> kakaoConnectionCheck = userservice.kakaoConnectionCheck(paramMap);
		if(kakaoConnectionCheck == null) { //일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
		}else if(kakaoConnectionCheck.get("KAKAOLOGIN") == null && kakaoConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
			System.out.println("kakaoLogin");
			userservice.setKakaoConnection(paramMap);
			Map<String, Object> loginCheck = userservice.userKakaoLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else{
			Map<String, Object> loginCheck = userservice.userKakaoLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}
		
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 유저 SNS 회원가입
	 */
	@RequestMapping(value="/userSnsRegisterPro.do", method=RequestMethod.POST)
	public Map<String, Object> userSnsRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		String flag = (String) paramMap.get("flag");
		Integer registerCheck = null;
		if(flag.equals("kakao")) {
			registerCheck = userservice.userKakaoRegisterPro(paramMap);
		}else if(flag.equals("google")) {
			registerCheck = userservice.userGoogleRegisterPro(paramMap);
		}else if(flag.equals("naver")) {
			registerCheck = userservice.userNaverRegisterPro(paramMap);
		}
		
		
		if(registerCheck != null && registerCheck > 0) {
			Map<String, Object> loginCheck = null;
			if(flag.equals("kakao")) {
				loginCheck = userservice.userKakaoLoginPro(paramMap);
			}else if(flag.equals("google")) {
				loginCheck = userservice.userGoogleLoginPro(paramMap);
			}else if(flag.equals("naver")) {
				loginCheck = userservice.userNaverLoginPro(paramMap);
			}
			 
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else {
			resultMap.put("JavaData", "NO");
		}
		return resultMap;
	}
	/**
	 * @author 손호일
	 * @param paramMap
	 * @return Map<String, Object>
	 * @throws SQLException
	 * @throws Exception
	 * @description 유저 구글 로그인
	 */
	@RequestMapping(value="/googleLoginPro.do",  method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> googleLoginPro(Model model,@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> googleConnectionCheck = userservice.googleConnectionCheck(paramMap);
		System.out.println(googleConnectionCheck);
		
		if(googleConnectionCheck == null) { //일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
		}else if(googleConnectionCheck.get("GOOGLELOGIN") == null && googleConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			userservice.setGoogleConnection(paramMap);
			Map<String, Object> loginCheck = userservice.userGoogleLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else { //모두 연동 되어있을시
			Map<String, Object> loginCheck = userservice.userGoogleLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}

		return resultMap;
	}
	
	/**
	 * @author 정연우
	 * @description 주문 후기 댓글 작성
	 */
	@RequestMapping(value="reviewWrite.do",  method = {RequestMethod.GET,RequestMethod.POST})
	public String reviewWrite() {
		
		return "user/myPage";
	}
	
}
