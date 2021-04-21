<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/ceoRegister.css?v=210420" /><!-- 버전 수정 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사장님 회원가입</title>
</head>
<body>
<form name="registerForm" id="registerForm" method = "post">
	<table >
		<thead>
			<tr>
				<th colspan="3">사장님 회원가입</th>
			</tr>
		</thead>
		<tbody>
			<tr style="height: 20px"></tr>
			<tr>
				<td class="text">아이디</td>
				<td><input id="userid" name="userid"></td>
				<td><button id="purpleButton">중복체크</button></td>
			</tr>
			<tr>
				<td class="text">이메일</td>
				<td><input id="email" name="email"></td>
				<td><button id="purpleButton" type="button" onclick="poenPopup('emailCheckModal')">이메일 인증</button></td>
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
				<td class="text">주소</td>
				<td><input id="address" name="address"></td>
				<td><button id="purpleButton" type="button" onclick="poenPopup('addressCheckModal')">주소검색</button></td>
			</tr>
			<tr>
				<td class="text">가게이름</td>
				<td><input id="shopName" name="shopName"></td>
				<td></td>
			</tr>
			<tr>
				<td class="text">전화번호</td>
				<td style="font-size: large;font-weight: bold;"><input id="phone" name="phone" style="width: 24%">-<input id="phone" name="phone2">-<input id="phone" name="phone3"></td>
				<td></td>
			</tr>
			<tr>
				<td class="text">공지사항</td>
				<td><textarea id="notice" name="notice"></textarea>
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
<script>

function register(){
	var registerData = $("form[name=registerForm]").serialize() ;
	console.log(registerData)
	$.ajax({
		type : 'POST',
		url : '/user/ceoRegisterPro.do',
		data : registerData,
		dataType : 'json',
		success : function(json){
			alert(json)
		},
		error: function(xhr, status, error){
			alert(error);
		}
	});
}
</script>
</body>
</html>