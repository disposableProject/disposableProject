<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/userRegister.css?version=21042510" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일반 회원가입</title>
</head>
<body>
<form name="userRegisterForm" id="userRegisterForm" method="POST">
    <table>
        <thead>
            <tr>
                <th colspan="3">회원가입</th>
            </tr>
        </thead>
        <tbody>
            <tr style="height: 20px;"></th>
            <tr>
				<td class="text">이메일(ID)</td>
				<td><input id="email" name="email"></td>
				<td><button id="dupliButton" type="button" onclick="poenPopup('emailCheckModal')">이메일 인증</button></td>
			</tr>
            <tr>
                <td class="text">닉네임</td>
                <td><input id="nickname" name="nickname"></td>
                <td><button id="dupliButton">중복체크</button></td>
            </tr>
            <tr>
				<td class="text">비밀번호</td>
				<td><input id="password" name="password" type="password"></td>
				<td></td>
			</tr>
			<tr>
				<td class="text">비밀번호확인</td>
				<td><input id="password" name="password2" type="password"></td>
				<td></td>
			</tr>
            <tr>
				<td class="text">전화번호</td>
				<td style="font-size: large;font-weight: bold;"><input id="phone" name="phone"></td>
				<td></td>
			</tr>
            <tr>
				<td></td>
				<td><input type="button" id="regiButton" onclick="register()" value="회원가입" /></td>
				<td></td>
			</tr>
        </tbody>
    </table>
</form>

<jsp:include page="../common/modalPopup.jsp"></jsp:include>

</body>
</html>