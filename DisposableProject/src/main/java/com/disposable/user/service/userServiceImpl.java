package com.disposable.user.service;

import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.disposable.common.SMTPAuthenticator;
import com.disposable.user.dao.userDao;



@Service("userService")
@MapperScan(basePackages="com.disposable.user.dao")//탐색할 패키시 설정
public class userServiceImpl implements userService{

	@Autowired
	private userDao userDao;
	@Autowired
	HttpServletRequest request;
	
	@Transactional
	@Override
	public Integer ceoRegisterPro(Map<String, Object> paramMap) throws SQLException {
		String password = encrypt((String)paramMap.get("password"));
		paramMap.put("password", password);
		return userDao.ceoRegisterPro(paramMap);
	}
	@Override
	public int checkUserId(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.checkUserId(paramMap);
	}
	@Override
	public int checkEmail(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.checkEmail(paramMap);
	}
	@Override
	public Map<String, Object> loginPro(Map<String, Object> paramMap) throws SQLException {
		String password = encrypt((String)paramMap.get("password"));
		paramMap.put("password", password);
		return userDao.loginPro(paramMap);
	}
	//메일 전송
	public int emailauth(Map<String, Object> paramMap) {
		String email = (String) paramMap.get("email");
		HttpSession session = request.getSession();	
		System.out.println("이메일 인증 실행");
		int result = 0;
		String subject = "회원가입 인증코드입니다."; 
		String authCode = randomString(15);
		System.out.println("authCode ==>"+authCode);
		//Cookie cookie = new Cookie("authNum",authCode);
		session.setAttribute("authNum", authCode);
		

		
		String context = ""
				+ "<div style='background:`lightgreen`;width:`350px`;height:`150px`;color:`white`;display:`flex`;align-items:`center`;justify-content:`center`;font-size:`20px`;font-weight:`bold`"
				+ "'>"
				+ "인증코드: "+authCode
				+ "</div>";
		
		Properties p = new Properties(); 
		p.put("mail.smtp.host","gmail-smtp.l.google.com");
		
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Authenticator auth = new SMTPAuthenticator();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses); 
			msg.setSubject(subject); 
			Address fromAddr = new InternetAddress(email);
			msg.setFrom(fromAddr); 
			Address toAddr = new InternetAddress(email);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(context, "text/html;charset=UTF-8"); 
			Transport.send(msg); 
			System.out.println(authCode);
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("error");
		}
		
		return result;
	}
	//메일 난수 생성
	public String randomString(int num) {
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+ "0123456789"+ "abcdefghijklmnopqrstuvxyz";
		 StringBuilder sb = new StringBuilder(num); 
			for (int i = 0; i < num; i++) { 
				int index  = (int)(AlphaNumericString.length() * Math.random()); 
				sb.append(AlphaNumericString.charAt(index)); 
			} 
			return sb.toString(); 
	}
	//암호화
	public static String encrypt(String planText) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(planText.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	@Override
	public int checkUserEmail(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.checkUserEmail(paramMap);
	}
	@Transactional
	@Override
	public Integer userRegisterPro(Map<String, Object> paramMap) throws SQLException {
		String password = encrypt((String)paramMap.get("password"));
		paramMap.put("password", password);
		return userDao.userRegisterPro(paramMap);
	}
	@Override
	public int checkNickname(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.checkNickname(paramMap);
	}
	@Override
	public Map<String, Object> userLoginPro(Map<String, Object> paramMap) throws SQLException {
		String password = encrypt((String)paramMap.get("password"));
		paramMap.put("password", password);
		return userDao.userLoginPro(paramMap);
	}
	@Override
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.naverConnectionCheck(apiJson);
	}
	@Override
	public Integer setNaverConnection(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.setNaverConnection(paramMap);
	}
	
	@Override
	public Integer userNaverRegisterPro(Map<String, Object> paramMap) throws SQLException {
		String password = encrypt((String)paramMap.get("password"));
		paramMap.put("password", password);
		return userDao.userNaverRegisterPro(paramMap);
	}
	@Override
	public Map<String, Object> userNaverLoginPro(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.userNaverLoginPro(paramMap);
	}
	@Override
	public Map<String, Object> kakaoConnectionCheck(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.kakaoConnectionCheck(paramMap);
	}
	@Override
	public Integer setKakaoConnection(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.setKakaoConnection(paramMap);
	}
	@Override
	public Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.userKakaoLoginPro(paramMap);
	}
	@Override
	public Integer userKakaoRegisterPro(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.userKakaoRegisterPro(paramMap);
	}
	@Override
	public Map<String, Object> googleConnectionCheck(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.googleConnectionCheck(paramMap);
	}
	@Override
	public Integer setGoogleConnection(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.setGoogleConnection(paramMap);
	}
	@Override
	public Map<String, Object> userGoogleLoginPro(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.userGoogleLoginPro(paramMap);
	}
	@Override
	public Integer userGoogleRegisterPro(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.userGoogleRegisterPro(paramMap);
	}
	@Override
	public List<Map<String, Object>> test(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.test(paramMap);
	}
}
