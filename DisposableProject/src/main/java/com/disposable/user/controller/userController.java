package com.disposable.user.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class userController {
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
}
