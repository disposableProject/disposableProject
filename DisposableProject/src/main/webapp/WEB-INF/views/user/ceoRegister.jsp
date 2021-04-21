<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/ceoRegister.css?v=210423" /><!-- 버전 수정 -->
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
				<td><button id="purpleButton" type="button"  onclick="checkId()">중복체크</button></td>
			</tr>
			<tr>
				<td class="text">이메일</td>
				<td><input id="email" name="email" ></td>
				<td><button id="purpleButton" type="button" onclick="checkEmail()">이메일 인증</button></td>
			</tr>
			<tr>
				<td class="text">비밀번호</td>
				<td><input id="password" name="password" type="password"></td>
				<td></td>
			</tr>
			<tr>
				<td class="text">비밀번호확인</td>
				<td><input id="password2" name="password2" type="password"></td>
				<td></td>
			</tr>
			<tr>
				<td class="text">주소</td>
				<td><input id="address" name="address"></td>
				<td><button id="purpleButton" type="button" onclick="openPopup('addressCheckModal')">주소검색</button></td>
			</tr>
			<tr>
				<td class="text">가게이름</td>
				<td><input id="shopName" name="shopName"></td>
				<td></td>
			</tr>
			<tr>
				<td class="text">전화번호</td>
				<td style="font-size: large;font-weight: bold;"><input id="phone" name="phone"></td>
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

function checkId(){
	var userId = $("#userid").val()
	if(userId == null || userId == ""){
		alert("아이디를 입력 해주세요");
		return false;
	}
	var regExp = /^[a-z0-9]{4,10}$/;
	if(!regExp.test(email)){
		alert("아이디는 영 소문자, 숫자 4~10자리로 입력해주세요.");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/user/checkUserId.do',
		data : {userId:userId },
		dataType : 'json',
		success : function(data){
			if(data.JavaData == 0){
				alert("사용가능한 아이디 입니다.");
			}else{
				alert("이미 존재하는 아이디 입니다.");
				$("#userid").val("");
			}
		},
		error: function(xhr, status, error){
			alert(error);
		}
	});
}
function checkEmail(){
	var email = $("#email").val();
	if(email == null || email == ""){
		alert("이메일을 입력 해주세요");
		return false;
	}
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(!regExp.test(email)){
		alert("올바른 이메일 형식을 입력하세요");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/user/checkEmail.do',
		data : {email: email},
		dataType : 'json',
		success : function(data){
			if(data.JavaData == "YES"){
				openPopup('emailCheckModal')
			}else{
				alert("이미 존재하는 이메일 입니다.");
				$("#email").val("");
			}
		},
		error: function(xhr, status, error){
			alert(error);
		}
	});
}

function register(){
	var registerData =common.serializeObject($("form[name=registerForm]"));
	if(registerData.password == null || registerData.password == ""){
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return false;
	}
	if(registerData.password2 == null || registerData.password2 == ""){
		alert("비밀번호를 입력하세요");
		$("#password2").focus();
		return false;
	}
	if(registerData.password != registerData.password2){
		alert("비밀번호가 일치하지 않습니다.");
		$("#password2").focus();
		return false;
	}
	if(registerData.shopName == null || registerData.shopName == ""){
		alert("가게 이름을 입력하세요");
		$("#shopName").focus();
		return false;
	}
	if(registerData.phone == null || registerData.phone == ""){
		alert("번호를 입력하세요");
		$("#phone").focus();
		return false;
	}
	var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
	var telRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var phoneNum = registerData.phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3")
	if(!phoneRegExp.test(phoneNum) && !telRegExp.test(phoneNum)){
		alert("올바른 번호 형식을 입력하세요");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/user/ceoRegisterPro.do',
		data : registerData,
		dataType : 'json',
		success : function(json){
			alert(json);
		},
		error: function(xhr, status, error){
			alert(error);
		}
	});
}
</script>
</body>
</html>