package com.disposable.user.service;

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
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.CookieGenerator;

import com.disposable.common.SMTPAuthenticator;
import com.disposable.user.dao.userDao;



@Service("userService")
@MapperScan(basePackages="com.disposable.user.dao")//탐색할 패키시 설정
public class userServiceImpl implements userService{

	@Autowired
	private userDao userDao;
	@Autowired
	HttpServletResponse response;
	@Override
	public List<Map<String, Object>> test(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.test(paramMap);
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
	
	
	public int emailauth(Map<String, Object> paramMap) {
		String email = (String) paramMap.get("email");
		System.out.println("이메일 인증 실행");
		int result = 0;
		String subject = "회원가입 인증코드입니다."; 
		String authCode = randomString(15);
		System.out.println("authCode ==>"+authCode);
		//Cookie cookie = new Cookie("authNum",authCode);
		CookieGenerator cg = new CookieGenerator();
		cg.setCookieName("authNum");
		cg.addCookie(response, authCode);

	//	cookie.setMaxAge(60*60*3);
	//	response.addCookie(cookie);  
		
		String context = ""
				+ "<div style='background:`lightgreen`;width:`350px`;height:`150px`;color:`white`;display:`flex`;align-items:`center`;justify-content:`center`;font-size:`20px`;font-weight:`bold`"
				+ "'>"
				+ "인증코드: "+authCode
				+ "</div>";
		
		Properties p = new Properties(); // 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙체
		p.put("mail.smtp.host","gmail-smtp.l.google.com"); // 占쏙옙占싱뱄옙 SMTP
		
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
	public String randomString(int num) {
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+ "0123456789"+ "abcdefghijklmnopqrstuvxyz";
		 StringBuilder sb = new StringBuilder(num); 
			for (int i = 0; i < num; i++) { 
				int index  = (int)(AlphaNumericString.length() * Math.random()); 
				sb.append(AlphaNumericString.charAt(index)); 
			} 
			return sb.toString(); 
	}
}
